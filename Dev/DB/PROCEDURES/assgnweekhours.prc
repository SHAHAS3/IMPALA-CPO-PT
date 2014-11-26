CREATE OR REPLACE PROCEDURE ASSGNWEEKHOURS
  (
    VCAPAMPWEEK_ID NUMBER)
AS
  vmpweek      NUMBER;
  vmpyear      NUMBER;
  VCAPAMP_ID   NUMBER;
  VPCN         VARCHAR2(50);
  VDESCRIPTION VARCHAR2(100);
  VCPODATELABELLING DATE;
  VASSIGNEDHOURSPERORDE     NUMBER;
  VASSIGNEDHOURSPERWEEK     NUMBER;
  VNUMBEROFCLINICOPIALABELS NUMBER;
  VNUMBEROFCLINTRAKLABELS   NUMBER;
  VNUMBEROFSEALLABELS       NUMBER;
  VSTATUS                   VARCHAR2(100);
  VSTARTDATE           DATE;
  VENDDATE             DATE;
  VNUMBEROFBATCHES     NUMBER;
  VFILLCOUNTS          NUMBER;
  VNUMBEROFPEOPLE      NUMBER;
  VACTUALHOURSPERORDER NUMBER;
  vweekdaynumber       NUMBER;
  vdaysleft            NUMBER;
  vhoursleft           NUMBER;
  vcount               NUMBER;
  vweekhours           NUMBER;
  vhours               NUMBER;
  vweek                NUMBER;
  vyear                NUMBER;
  vweekcount           NUMBER;
  vorderscount         NUMBER;
  vvcapamp_id          NUMBER;
  vvcapampweek_id      NUMBER;
  vhoursperweek        NUMBER;
  vweeksperyear        NUMBER;
  vsitecode            VARCHAR2(2);
  vorderfinished       VARCHAR2(3);
  vcomment200          VARCHAR2(200);
  vdsmui               VARCHAR2(200);
  vweekday             VARCHAR2 (20);
  vpcnkey              NUMBER; 
BEGIN
   SELECT CAPAMP_ID         ,
    PCN                     ,
    DESCRIPTION             ,
    CPODATELABELLING        ,
    ASSIGNEDHOURSPERORDE    ,
    ASSIGNEDHOURSPERWEEK    ,
    NUMBEROFCLINICOPIALABELS,
    NUMBEROFCLINTRAKLABELS  ,
    NUMBEROFSEALLABELS      ,
    STATUS                  ,
    STARTDATE               ,
    ENDDATE                 ,
    NUMBEROFBATCHES         ,
    FILLCOUNTS              ,
    NUMBEROFPEOPLE          ,
    ACTUALHOURSPERORDER     ,
    ORDERFINISHED           ,
    COMMENT200              ,
    DSMUI                   ,
    WEEKDAY                 ,
    PCNKEY
     INTO vCAPAMP_ID         ,
    vPCN                     ,
    vDESCRIPTION             ,
    vCPODATELABELLING        ,
    vASSIGNEDHOURSPERORDE    ,
    vASSIGNEDHOURSPERWEEK    ,
    vNUMBEROFCLINICOPIALABELS,
    vNUMBEROFCLINTRAKLABELS  ,
    vNUMBEROFSEALLABELS      ,
    vSTATUS                  ,
    vSTARTDATE               ,
    vENDDATE                 ,
    vNUMBEROFBATCHES         ,
    vFILLCOUNTS              ,
    vNUMBEROFPEOPLE          ,
    vACTUALHOURSPERORDER     ,
    vORDERFINISHED           ,
    vCOMMENT200              ,
    vDSMUI                   ,
    vWEEKDAY                 ,
    vPCNKEY
     FROM capampweek
    WHERE id=vcapampweek_id;
    
   SELECT mpweek, mpyear,sitecode INTO vmpweek,vmpyear,vsitecode FROM capamp WHERE id=vcapamp_id;
   SELECT to_number(TO_CHAR(vstartdate,'D')) INTO vweekdaynumber FROM dual;

  
  vdaysleft    :=7         - vweekdaynumber;
  vhoursleft   :=vdaysleft * 8 * vnumberofpeople;
  --CTS--vhoursleft   :=vdaysleft * 7 * vnumberofpeople;
  
  
  if vhoursleft >= vassignedhoursperorde THEN
  -- assign vassignehourseperorder
      UPDATE capampweek
      SET assignedhoursperweek= vassignedhoursperorde,
          assignedhoursperorde = vassignedhoursperorde
      WHERE id              = vcapampweek_id;
      
      commit; -- WK, 06.08.2009
      
      capampbilance(vCAPAMP_ID);      
      
      --
      --delete orders when assigned hours/orders get reduced
      --
      vorderscount:=1;
      vweek           := vmpweek;
      vyear           := vmpyear;
      WHILE vorderscount > 0
      LOOP
        -- evaluate whether year has 52 or 53 weeks
        if has52or53(vyear)='YES' then
            vweeksperyear:=53;
        else
            vweeksperyear:=52;
        end if;
        -- evaluate week and year
        IF vweek = vweeksperyear THEN
          vweek := 1;
          vyear := vyear + 1;
        ELSE
          vweek := vweek +1;
        END IF;
            SELECT id
         INTO vvcapamp_id
         FROM capamp
         WHERE mpweek=vweek
         AND mpyear    =vyear
         AND sitecode = vsitecode;
        SELECT COUNT(*)
         INTO vorderscount
         FROM capampweek
         WHERE pcn     =vpcn
         AND capamp_id   =vvcapamp_id
         and startdate = vstartdate;
         IF vorderscount = 1 THEN
           --delete record because no  hour left           
              delete capampweek
              WHERE capamp_id   =vvcapamp_id
              AND pcnkey = vpcnkey;
             commit;
             capampbilance(vvCAPAMP_ID);
        END IF;
      END LOOP;   
      --
      --end delete orders when assigned hours/orders get reduced
      --     
      return;
  --  assign vhoursleft
  ELSE
    UPDATE capampweek
    SET assignedhoursperweek= vhoursleft,
        assignedhoursperorde = vassignedhoursperorde
      WHERE id              = vcapampweek_id;
      
      commit; -- WK, 06.08.2009
      
      capampbilance(vCAPAMP_ID);
      
  END IF;
  vhoursleft      := vassignedhoursperorde-vhoursleft;
  vweekhours      := vnumberofpeople      * 8 * 5;
  --CTS--vweekhours      := vnumberofpeople      * 7 * 5;
  vweek           := vmpweek;
  vyear           := vmpyear;
  WHILE vhoursleft > 0
  LOOP
    IF vweekhours > vhoursleft THEN
      --insert or update with vhoursleft
      vhoursperweek:=vhoursleft;
    ELSE
      --insert or update with vweekhours
      vhoursperweek:=vweekhours;
    END IF;
     INSERT INTO CHECKTRANS
      (TRANS
      ) VALUES
      (vweekdaynumber
      );
      
      COMMIT;
    -- evaluate whether year has 52 or 53 weeks
    if has52or53(vyear)='YES' then
        vweeksperyear:=53;
    else
        vweeksperyear:=52;
    end if;
    -- evaluate week and year
    IF vweek = vweeksperyear THEN
      vweek := 1;
      vyear := vyear + 1;
    ELSE
      vweek := vweek +1;
    END IF;
    -- check whether week record already exists
     SELECT COUNT( *)
       INTO vweekcount
       FROM capamp
      WHERE mpweek=vweek
    AND mpyear    =vyear;
    
    -- when week record already exist, no record has to be added
    IF vweekcount > 0 THEN
      -- week record exists already
      -- checke whether order record exists already
       SELECT id
         INTO vvcapamp_id
         FROM capamp
        WHERE mpweek=vweek
      AND mpyear    =vyear
      AND sitecode = vsitecode;
           
       SELECT COUNT(*)
         INTO vorderscount
         FROM capampweek
        WHERE pcn     =vpcn
      AND capamp_id   =vvcapamp_id
      AND startdate = vstartdate;  --R.Priester   08-NOV-2010
      IF vorderscount > 0 THEN
        --order record exists
        --update
         UPDATE capampweek
        SET ASSIGNEDHOURSPERWEEK=vHOURSPERWEEK,
            assignedhoursperorde = vassignedhoursperorde
          WHERE pcn             =vpcn
          AND startdate         =vstartdate  --R.Priester 08-NOV-2010
        AND capamp_id           =vvcapamp_id;        
        commit; -- WK, 06.08.2009
        capampbilance(vvCAPAMP_ID);
      ELSE
        --order record does not exist
        --insert       
         SELECT idseq.nextval
           INTO vvcapampweek_id
           FROM dual;
         INSERT
           INTO capampweek
          (
            id                      ,
            CAPAMP_ID               ,
            PCN                     ,
            DESCRIPTION             ,
            CPODATELABELLING        ,
            ASSIGNEDHOURSPERORDE    ,
            ASSIGNEDHOURSPERWEEK    ,
            STATUS                  ,
            STARTDATE               ,
            ENDDATE                 ,
            NUMBEROFBATCHES         ,
            FILLCOUNTS              ,
            NUMBEROFPEOPLE          ,
            ORDERFINISHED           ,
            COMMENT200              ,
            DSMUI                   ,
            WEEKDAY                 ,
            PCNKEY
          )
          VALUES
          (
            vvcapampweek_id          ,
            vvCAPAMP_ID              ,
            vPCN                     ,
            vDESCRIPTION             ,
            vCPODATELABELLING        ,
            vASSIGNEDHOURSPERORDE    ,
            vHOURSPERWEEK            ,
            vSTATUS                  ,
            vSTARTDATE               ,
            vENDDATE                 ,
            vNUMBEROFBATCHES         ,
            vFILLCOUNTS              ,
            vNUMBEROFPEOPLE          ,
            vORDERFINISHED           ,
            vCOMMENT200              ,
            vDSMUI                   ,
            vWEEKDAY                 ,
            vPCNKEY
          );
          commit; -- WK, 06.08.2009
          capampbilance(vvCAPAMP_ID);
      END IF;
    ELSE
      -- week record does not exist, insert week
       SELECT idseq.nextval
         INTO vvcapamp_id
         FROM dual;
       SELECT idseq.nextval INTO vvcapampweek_id FROM dual;
      -- insert week record
       INSERT
         INTO capamp
        (
          id    ,
          mpweek,
          mpyear,
          sitecode
        )
        VALUES
        (
          vvcapamp_id,
          vweek      ,
          vyear      ,
          vsitecode
        );
      -- insert order record
      INSERT
      INTO capampweek
        (
          id                      ,
          CAPAMP_ID               ,
          PCN                     ,
          DESCRIPTION             ,
          CPODATELABELLING        ,
          ASSIGNEDHOURSPERORDE    ,
          ASSIGNEDHOURSPERWEEK    ,
          STATUS                  ,
          STARTDATE               ,
          ENDDATE                 ,
          NUMBEROFBATCHES         ,
          FILLCOUNTS              ,
          NUMBEROFPEOPLE          ,
          ORDERFINISHED           ,
          COMMENT200              ,
          DSMUI                   ,
          WEEKDAY                 ,
          PCNKEY
        )
        VALUES
        (
          vvcapampweek_id          ,
          vvCAPAMP_ID              ,
          vPCN                     ,
          vDESCRIPTION             ,
          vCPODATELABELLING        ,
          vASSIGNEDHOURSPERORDE    ,
          vHOURSPERWEEK            ,
          vSTATUS                  ,
          vSTARTDATE               ,
          vENDDATE                 ,
          vNUMBEROFBATCHES         ,
          vFILLCOUNTS              ,
          vNUMBEROFPEOPLE          ,
          vORDERFINISHED           ,
          vCOMMENT200              ,
          vDSMUI                   ,
          vWEEKDAY                 ,
          vPCNKEY
        );
        commit; -- WK, 06.08.2009
        capampbilance(vvCAPAMP_ID);
    END IF;
    vhoursleft:=vhoursleft-vhoursperweek;
  END LOOP;
  --
  --delete orders when assigned hours/orders get reduced
  --
          
  WHILE vorderscount > 0
  LOOP
    -- evaluate whether year has 52 or 53 weeks
    if has52or53(vyear)='YES' then
        vweeksperyear:=53;
    else
        vweeksperyear:=52;
    end if;
    -- evaluate week and year
    IF vweek = vweeksperyear THEN
      vweek := 1;
      vyear := vyear + 1;
    ELSE
      vweek := vweek +1;
    END IF;
       
    SELECT id
       INTO vvcapamp_id
       FROM capamp
       WHERE mpweek=vweek
       AND mpyear    =vyear
       AND sitecode = vsitecode;
       
    SELECT COUNT(*)
     INTO vorderscount
     FROM capampweek
     WHERE pcn     =vpcn
     AND capamp_id   =vvcapamp_id
     and startdate = vstartdate;
    IF vorderscount = 1 THEN  
      delete capampweek
      WHERE pcn     =vpcn
      AND capamp_id   =vvcapamp_id
      and startdate = vstartdate;
      
      commit;
    END IF;
  
  END LOOP;
  --
  --end delete orders in case assigned hours/orders get reduced  
  --
END;
/

