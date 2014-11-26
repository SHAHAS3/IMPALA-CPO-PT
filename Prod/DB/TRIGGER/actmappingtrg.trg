CREATE OR REPLACE TRIGGER "ACTMAPPINGTRG" AFTER
  INSERT OR
  DELETE ON ACTMAPPING REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW 
DECLARE v_count NUMBER;
  v_cprid                                                                             NUMBER;
  BEGIN
    --COLLECT CLINICOPIA DATA
    IF INSERTING THEN
      SELECT COUNT(*)
      INTO v_count
      FROM ACTLABELPLACEHOLDERS
      WHERE labelid = :NEW.LABELID;
      IF (v_count   = 0 ) THEN
        INSERT
        INTO ACTLABELPLACEHOLDERS
          (
            CLINTYPE,
            ACTUSERID,
            LABELID,
            VERSION_NO,
            PLACEHOLDER_SEQ,
            DPH_ID,
            VPH_ID,
            OBJECT_ID,
            DESCRIPTION,
            CREATED_BY,
            DATE_CREATED,
            FTPH_ID,
            PLACEHOLDER_DATA,
            LANG_CD
          )
        SELECT DECODE(NVL(L.FTPH_ID,'NOFTPH'),'NOFTPH','VPH','FTPH'),
          :NEW.ACTUSERID,
          L.LABEL_ID,
          L.VERSION_NO,
          L.PLACEHOLDER_SEQ,
          L.DPH_ID,
          L.VPH_ID,
          L.OBJECT_ID,
          V.DESCRIPTION,
          L.CREATED_BY,
          L.DATE_CREATED,
          L.FTPH_ID,
          F.PLACEHOLDER_DATA,
          L.LANG_CD
        FROM label_placeholders l,
          freetext_ph f,
          visit_ph v
        WHERE l.label_id = :NEW.LABELID
        AND l.stock_cd  IS NULL
        AND l.tph_id    IS NULL
        AND l.dph_id    IS NULL
        AND l.rtph_id   IS NULL
        AND l.label_id   = f.label_id(+)
        AND l.ftph_id    = f.placeholder_id(+)
        AND l.label_id   = v.label_id(+)
        AND l.vph_id     = v.placeholder_id(+);
      END IF;
      --COLLECT ECPR DATA
      SELECT COUNT(*)
      INTO v_count
      FROM ACTECPR
      WHERE labelid                          = :NEW.LABELID;
      IF (v_count                            = 0 ) THEN
        v_cprid                             := to_number(PKG$ACT.F$GETCPR('CPRID',:NEW.PRIMARYPACKID));
        IF (instr(:NEW.ITEMCHECK,'STUDYCODE')>0 ) THEN
          INSERT
          INTO ACTECPR
            (
              ACTUSERID,
              ITEMCHECK,
              LABELID,
              LABELDESCRIPTION,
              ECPRID,
              PRIMARYPACKID,
              IDENTIFIER,
              CPRITEM,
              CPRVALUE
            )
            VALUES
            (
              :NEW.ACTUSERID,
              :NEW.ITEMCHECK,
              :NEW.LABELID,
              :NEW.LABELDESCRIPTION,
              v_cprid,
              :NEW.PRIMARYPACKID,
              :NEW.IDENTIFIER,
              'STUDYCODE',
              PKG$ACT.F$GETCPR('STUDYCODE',:NEW.PRIMARYPACKID)
            );
        END IF;
        IF
          (
            instr(:NEW.ITEMCHECK,'PROJECTCODE')>0
          )
          THEN
          INSERT
          INTO ACTECPR
            (
              ACTUSERID,
              ITEMCHECK,
              LABELID,
              LABELDESCRIPTION,
              ECPRID,
              PRIMARYPACKID,
              IDENTIFIER,
              CPRITEM,
              CPRVALUE
            )
            VALUES
            (
              :NEW.ACTUSERID,
              :NEW.ITEMCHECK,
              :NEW.LABELID,
              :NEW.LABELDESCRIPTION,
              v_cprid,
              :NEW.PRIMARYPACKID,
              :NEW.IDENTIFIER,
              'PROJECTCODE',
              PKG$ACT.F$GETCPR('PROJECTCODE',:NEW.PRIMARYPACKID)
            );
        END IF;
        IF
          (
            instr(:NEW.ITEMCHECK,'DOSAGESTRENGTH')>0
          )
          THEN
          INSERT
          INTO ACTECPR
            (
              ACTUSERID,
              ITEMCHECK,
              LABELID,
              LABELDESCRIPTION,
              ECPRID,
              PRIMARYPACKID,
              IDENTIFIER,
              CPRITEM,
              CPRVALUE
            )
            VALUES
            (
              :NEW.ACTUSERID,
              :NEW.ITEMCHECK,
              :NEW.LABELID,
              :NEW.LABELDESCRIPTION,
              v_cprid,
              :NEW.PRIMARYPACKID,
              :NEW.IDENTIFIER,
              'DOSAGESTRENGTH',
              PKG$ACT.F$GETCPR('DOSAGESTRENGTH',:NEW.PRIMARYPACKID)
            );
        END IF;
        IF
          (
            instr(:NEW.ITEMCHECK,'NUMBERPERUNIT')>0
          )
          THEN
          INSERT
          INTO ACTECPR
            (
              ACTUSERID,
              ITEMCHECK,
              LABELID,
              LABELDESCRIPTION,
              ECPRID,
              PRIMARYPACKID,
              IDENTIFIER,
              CPRITEM,
              CPRVALUE
            )
            VALUES
            (
              :NEW.ACTUSERID,
              :NEW.ITEMCHECK,
              :NEW.LABELID,
              :NEW.LABELDESCRIPTION,
              v_cprid,
              :NEW.PRIMARYPACKID,
              :NEW.IDENTIFIER,
              'NUMBERPERUNIT',
              PKG$ACT.F$GETCPR('NUMBERPERUNIT',:NEW.PRIMARYPACKID)
            );
        END IF;
        IF
          (
            instr(:NEW.ITEMCHECK,'ADDLABELPARAM')>0
          )
          THEN
          INSERT
          INTO ACTECPR
            (
              ACTUSERID,
              ITEMCHECK,
              LABELID,
              LABELDESCRIPTION,
              ECPRID,
              PRIMARYPACKID,
              IDENTIFIER,
              CPRITEM,
              CPRVALUE
            )
            VALUES
            (
              :NEW.ACTUSERID,
              :NEW.ITEMCHECK,
              :NEW.LABELID,
              :NEW.LABELDESCRIPTION,
              v_cprid,
              :NEW.PRIMARYPACKID,
              :NEW.IDENTIFIER,
              'ADDLABELPARAM',
              PKG$ACT.F$GETCPR('ADDLABELPARAM',:NEW.PRIMARYPACKID)
            );
        END IF;
      END IF;
    END IF;
    IF DELETING THEN
      DELETE FROM ACTLABELPLACEHOLDERS WHERE ACTUSERID = :OLD.ACTUSERID;
      DELETE FROM ACTECPR WHERE ACTUSERID = :OLD.ACTUSERID;
      DELETE FROM ACTRESULT WHERE ACTUSERID = :OLD.ACTUSERID;
      DELETE FROM ACTCLINLABELPARAM WHERE ACTUSERID = :OLD.ACTUSERID;
    END IF;
  END;
/

