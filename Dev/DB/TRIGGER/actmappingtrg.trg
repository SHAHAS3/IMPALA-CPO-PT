CREATE OR REPLACE TRIGGER "ACTMAPPINGTRG" AFTER
  INSERT OR
  DELETE
  ON ACTMAPPING
  REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW 
  
DECLARE 
    v_count number;
    v_cprid number;
  BEGIN
  
    --COLLECT CLINICOPIA DATA
    IF INSERTING THEN
    
      select count(*)
      into v_count
      from ACTLABELPLACEHOLDERS
      where labelid = :NEW.LABELID;

           

      IF (v_count = 0  ) THEN 
      
        insert into ACTLABELPLACEHOLDERS(CLINTYPE,ACTUSERID,LABELID,VERSION_NO,
                                         PLACEHOLDER_SEQ,DPH_ID,VPH_ID,OBJECT_ID,DESCRIPTION,
                                         CREATED_BY,DATE_CREATED,FTPH_ID,
                                         PLACEHOLDER_DATA,LANG_CD)
             select decode(NVL(L.FTPH_ID,'NOFTPH'),'NOFTPH','VPH','FTPH'), :NEW.ACTUSERID,L.LABEL_ID,L.VERSION_NO,
                    L.PLACEHOLDER_SEQ,L.DPH_ID,L.VPH_ID,L.OBJECT_ID,V.DESCRIPTION,
                    L.CREATED_BY,L.DATE_CREATED,L.FTPH_ID,
                    F.PLACEHOLDER_DATA,L.LANG_CD
            from label_placeholders l, freetext_ph f,visit_ph v
            where l.label_id = :NEW.LABELID
            and l.stock_cd is null
            and l.tph_id is null
            and l.dph_id is null
            and l.rtph_id is null
            and l.label_id = f.label_id(+)
            and l.ftph_id = f.placeholder_id(+)
            and l.label_id = v.label_id(+)
            and l.vph_id = v.placeholder_id(+);
            
                              
      END IF;  
      
      --COLLECT ECPR DATA
      
      select count(*)
      into v_count
      from ACTECPR
      where labelid = :NEW.LABELID;    
      
    
      IF (v_count = 0  ) THEN 
      
        v_cprid := to_number(PKG$ACT.F$GETCPR('CPRID',:NEW.PRIMARYPACKID));
        
        if (instr(:NEW.ITEMCHECK,'STUDYCODE')>0 ) THEN
      
          insert into ACTECPR(ACTUSERID,ITEMCHECK,LABELID,LABELDESCRIPTION,ECPRID,
                              PRIMARYPACKID,IDENTIFIER,CPRITEM,CPRVALUE)
                      values (:NEW.ACTUSERID,:NEW.ITEMCHECK,:NEW.LABELID,:NEW.LABELDESCRIPTION,v_cprid, 
                              :NEW.PRIMARYPACKID,:NEW.IDENTIFIER,'STUDYCODE',   PKG$ACT.F$GETCPR('STUDYCODE',:NEW.PRIMARYPACKID));
                            
        end if;
        
        if (instr(:NEW.ITEMCHECK,'PROJECTCODE')>0 ) THEN                           
          insert into ACTECPR(ACTUSERID,ITEMCHECK,LABELID,LABELDESCRIPTION,ECPRID,
                              PRIMARYPACKID,IDENTIFIER,CPRITEM,CPRVALUE)
                      values (:NEW.ACTUSERID,:NEW.ITEMCHECK,:NEW.LABELID,:NEW.LABELDESCRIPTION,v_cprid, 
                              :NEW.PRIMARYPACKID,:NEW.IDENTIFIER,'PROJECTCODE',   PKG$ACT.F$GETCPR('PROJECTCODE',:NEW.PRIMARYPACKID));                                   
        end if;
        
        if (instr(:NEW.ITEMCHECK,'DOSAGESTRENGTH')>0 ) THEN
          insert into ACTECPR(ACTUSERID,ITEMCHECK,LABELID,LABELDESCRIPTION,ECPRID,
                              PRIMARYPACKID,IDENTIFIER,CPRITEM,CPRVALUE)
                      values (:NEW.ACTUSERID,:NEW.ITEMCHECK,:NEW.LABELID,:NEW.LABELDESCRIPTION,v_cprid, 
                              :NEW.PRIMARYPACKID,:NEW.IDENTIFIER,'DOSAGESTRENGTH',   PKG$ACT.F$GETCPR('DOSAGESTRENGTH',:NEW.PRIMARYPACKID));          
        end if;

        if (instr(:NEW.ITEMCHECK,'NUMBERPERUNIT')>0 ) THEN
          insert into ACTECPR(ACTUSERID,ITEMCHECK,LABELID,LABELDESCRIPTION,ECPRID,
                              PRIMARYPACKID,IDENTIFIER,CPRITEM,CPRVALUE)
                      values (:NEW.ACTUSERID,:NEW.ITEMCHECK,:NEW.LABELID,:NEW.LABELDESCRIPTION,v_cprid, 
                              :NEW.PRIMARYPACKID,:NEW.IDENTIFIER,'NUMBERPERUNIT',   PKG$ACT.F$GETCPR('NUMBERPERUNIT',:NEW.PRIMARYPACKID));     
        end if;
        
        if (instr(:NEW.ITEMCHECK,'ADDLABELPARAM')>0 ) THEN
                           
          insert into ACTECPR(ACTUSERID,ITEMCHECK,LABELID,LABELDESCRIPTION,ECPRID,
                              PRIMARYPACKID,IDENTIFIER,CPRITEM,CPRVALUE)
                      values (:NEW.ACTUSERID,:NEW.ITEMCHECK,:NEW.LABELID,:NEW.LABELDESCRIPTION,v_cprid, 
                              :NEW.PRIMARYPACKID,:NEW.IDENTIFIER,'ADDLABELPARAM',   PKG$ACT.F$GETCPR('ADDLABELPARAM',:NEW.PRIMARYPACKID));                               
        end if;                              
                              
      END IF;       
 
    END IF;
                           
                                    
    IF DELETING THEN
      delete from ACTLABELPLACEHOLDERS 
      where ACTUSERID = :OLD.ACTUSERID;
      delete from ACTECPR 
      where ACTUSERID = :OLD.ACTUSERID;
      delete from ACTRESULT 
      where ACTUSERID = :OLD.ACTUSERID;
      delete from ACTCLINLABELPARAM 
      where ACTUSERID = :OLD.ACTUSERID;      
    END IF;


  END;
/

