CREATE OR REPLACE PROCEDURE TEMP_STATUS
  (
    DATEFROM DATE ,
    DATETO DATE ,
    stock_codes VARCHAR2,
    APPL_TYPES  VARCHAR2 )
IS
  VSTOCK_C  VARCHAR ( 4 );
  VYEAR     NUMBER;
  VNUMBER_4 NUMBER;
  VI DATE;
  VP DATE;
  VD DATE;
  VF DATE;
  VR DATE;
  VQ Date;
  VO Date;
  vcount NUMBER;
  VCONS_N NUMBER;
  VAPPL_TYP VARCHAR2(40);
  VSHIP_EFF_D DATE;
  VDSC_D DATE;
  VCONS_CTRY_NA VARCHAR2(100);
  CURSOR c1
  IS
    SELECT DISTINCT s.stock_c ,
      s.YEAR                  ,
      s.number_4,
      C.CONS_N,
      C.APPL_TYP,
      C.SHIP_EFF_D,
      C.DSC_D,
      C.CONS_CTRY_NA
       FROM pela_comm_status s,
      pela_commiss c
      WHERE c.creation_d BETWEEN datefrom AND dateto
    AND instr(appl_types,c.appl_typ) > 0
    AND instr(stock_codes,s.stock_c) > 0
    AND c.stock_c                    =s.stock_c
    AND c.year                       =s.year
    AND c.number_4                   =s.number_4;
BEGIN
  delete from imos_status;
  commit;
  OPEN c1;
  LOOP
    FETCH c1 INTO vstock_c,vyear,vnumber_4,VCONS_N,VAPPL_TYP,VSHIP_EFF_D,VDSC_D, VCONS_CTRY_NA;
    EXIT
  WHEN c1%notfound;
    -- getting i status date
   SELECT COUNT(*)
       INTO vcount
       FROM pela_comm_status
      WHERE status1='I'
    AND stock_c    =vstock_c
    AND YEAR       = vyear
    AND number_4   =vnumber_4
    AND stat_key   =
      (SELECT MAX(stat_key)
         FROM pela_comm_status
        WHERE status1='I'
      AND stock_c    =vstock_c
      AND YEAR       = vyear
      AND number_4   =vnumber_4
      );
    IF vcount > 0 THEN
       SELECT creation_d
         INTO vi
         FROM pela_comm_status
        WHERE status1='I'
      AND stock_c    =vstock_c
      AND YEAR       = vyear
      AND number_4   =vnumber_4
      AND stat_key   =
        (SELECT MAX(stat_key)
           FROM pela_comm_status
          WHERE status1='I'
        AND stock_c    =vstock_c
        AND YEAR       = vyear
        AND number_4   =vnumber_4
        ); 
        ELSE 
         vi     :='';
        end if;
      -- getting P status date
     SELECT COUNT(*)
       INTO vcount
       FROM pela_comm_status
        WHERE status1='P'
      AND stock_c    =vstock_c
      AND YEAR       = vyear
      AND number_4   =vnumber_4
      AND stat_key   =
        (SELECT MAX(stat_key)
           FROM pela_comm_status
          WHERE status1='P'
        AND stock_c    =vstock_c
        AND YEAR       = vyear
        AND number_4   =vnumber_4
        and
        (sign_reason <> 'Refresh master data' or sign_reason is null)
        );
      if vcount>0 then
       SELECT creation_d
         INTO vp
         FROM pela_comm_status
        WHERE status1='P'
      AND stock_c    =vstock_c
      AND YEAR       = vyear
      AND number_4   =vnumber_4
      AND stat_key   =
        (SELECT MAX(stat_key)
           FROM pela_comm_status
          WHERE status1='P'
        AND stock_c    =vstock_c
        AND YEAR       = vyear
        AND number_4   =vnumber_4
        and
        (sign_reason <> 'Refresh master data' or sign_reason is null)
        );
        else 
         vp:='';
        end if;
      -- getting D status date
     SELECT COUNT(*)
       INTO vcount
       FROM pela_comm_status
        WHERE status1='D'
      AND stock_c    =vstock_c
      AND YEAR       = vyear
      AND number_4   =vnumber_4
      AND stat_key   =
        (SELECT MAX(stat_key)
           FROM pela_comm_status
          WHERE status1='D'
        AND stock_c    =vstock_c
        AND YEAR       = vyear
        AND number_4   =vnumber_4
        );
      if vcount >0 then
       SELECT creation_d
         INTO vd
         FROM pela_comm_status
        WHERE status1='D'
      AND stock_c    =vstock_c
      AND YEAR       = vyear
      AND number_4   =vnumber_4
      AND stat_key   =
        (SELECT MAX(stat_key)
           FROM pela_comm_status
          WHERE status1='D'
        AND stock_c    =vstock_c
        AND YEAR       = vyear
        AND number_4   =vnumber_4
        );
        else 
         vd:='';
        end if;
      -- getting R status date
     SELECT COUNT(*)
       INTO vcount
       FROM pela_comm_status
        WHERE status1='R'
      AND stock_c    =vstock_c
      AND YEAR       = vyear
      AND number_4   =vnumber_4
      AND stat_key   =
        (SELECT MAX(stat_key)
           FROM pela_comm_status
          WHERE status1='R'
        AND stock_c    =vstock_c
        AND YEAR       = vyear
        AND number_4   =vnumber_4
        );
      if vcount > 0 then
       SELECT creation_d
         INTO vr
         FROM pela_comm_status
        WHERE status1='R'
      AND stock_c    =vstock_c
      AND YEAR       = vyear
      AND number_4   =vnumber_4
      AND stat_key   =
        (SELECT MAX(stat_key)
           FROM pela_comm_status
          WHERE status1='R'
        AND stock_c    =vstock_c
        AND YEAR       = vyear
        AND number_4   =vnumber_4
        );
        else 
        vr:='';
        end if;
      -- getting F status date
     SELECT COUNT(*)
       INTO vcount
       FROM pela_comm_status
        WHERE status1='F'
      AND stock_c    =vstock_c
      AND YEAR       = vyear
      AND number_4   =vnumber_4
      AND stat_key   =
        (SELECT MAX(stat_key)
           FROM pela_comm_status
          WHERE status1='F'
        AND stock_c    =vstock_c
        AND YEAR       = vyear
        AND number_4   =vnumber_4
        );
      if vcount > 0 then
       SELECT creation_d
         INTO vf
         FROM pela_comm_status
        WHERE status1='F'
      AND stock_c    =vstock_c
      AND YEAR       = vyear
      AND number_4   =vnumber_4
      AND stat_key   =
        (SELECT MAX(stat_key)
           FROM pela_comm_status
          WHERE status1='F'
        AND stock_c    =vstock_c
        AND YEAR       = vyear
        AND number_4   =vnumber_4
        );
        else 
        vf:='';
        end if;

      -- getting Q status date
     SELECT COUNT(*)
       INTO vcount
       FROM pela_comm_status
        WHERE status1='Q'
      AND stock_c    =vstock_c
      AND YEAR       = vyear
      AND number_4   =vnumber_4
      AND stat_key   =
        (SELECT MAX(stat_key)
           FROM pela_comm_status
          WHERE status1='Q'
        AND stock_c    =vstock_c
        AND YEAR       = vyear
        AND number_4   =vnumber_4
        );
      if vcount > 0 then
       SELECT creation_d
         INTO vq
         FROM pela_comm_status
        WHERE status1='Q'
      AND stock_c    =vstock_c
      AND YEAR       = vyear
      AND number_4   =vnumber_4
      AND stat_key   =
        (SELECT MAX(stat_key)
           FROM pela_comm_status
          WHERE status1='Q'
        AND stock_c    =vstock_c
        AND YEAR       = vyear
        AND number_4   =vnumber_4
        );
        else 
        vq:='';
        end if;
		
-------------------------------------------------------------------
      -- getting 'O' status date  By Soumen Das on Aug'2012
     SELECT COUNT(*)
       INTO vcount
       FROM pela_comm_status
        WHERE status1='O'
      AND stock_c    =vstock_c
      AND YEAR       = vyear
      AND number_4   =vnumber_4
      AND stat_key   =
        (SELECT MAX(stat_key)
           FROM pela_comm_status
          WHERE status1='O'
        AND stock_c    =vstock_c
        AND YEAR       = vyear
        AND number_4   =vnumber_4
        );
      if vcount > 0 then
       SELECT creation_d
         INTO vo
         FROM pela_comm_status
        WHERE status1='O'
      AND stock_c    =vstock_c
      AND YEAR       = vyear
      AND number_4   =vnumber_4
      AND stat_key   =
        (SELECT MAX(stat_key)
           FROM pela_comm_status
          WHERE status1='O'
        AND stock_c    =vstock_c
        AND YEAR       = vyear
        AND number_4   =vnumber_4
        );
        else 
        vo:='';
        end if;
--------------------------------------------------------

       INSERT
         INTO imos_status
        (
          STOCK_C ,
          YEAR    ,
          NUMBER_4,
          I       ,
          P       ,
          D       ,
          F       ,
          R,
          Q,
		  O,
          CONS_N,
          APPL_TYP,
          SHIP_EFF_D,
          DSC_D,
          CONS_CTRY_NA
        )
        VALUES
        (
          vstock_c ,
          vyear    ,
          vnumber_4,
          vi       ,
          vp       ,
          vd       ,
          vf       ,
          vr,
          vq,
		  vo,
          VCONS_N,
          VAPPL_TYP,
          VSHIP_EFF_D,
          VDSC_D,
          VCONS_CTRY_NA
        );
    END LOOP;
    CLOSE c1;
    COMMIT;
  END;
/

