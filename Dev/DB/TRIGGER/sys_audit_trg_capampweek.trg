CREATE OR REPLACE TRIGGER "SYS_AUDIT_TRG_CAPAMPWEEK" 
  AFTER INSERT OR DELETE OR UPDATE  OF 
  STARTDATE,COMMENT200,PCN,ENDDATE,DSMUI ON 
  CAPAMPWEEK 
  REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW 
DECLARE    
  p_time timestamp;     
  p_type char(1);
  BEGIN    
  p_time := systimestamp;   
  if INSERTING then      
  p_type := 'I';   
  elsif DELETING then       
  p_type := 'D';   else       
  p_type := 'U';   end if; 
  if (:OLD.STARTDATE is not null and :NEW.STARTDATE is not null and :OLD.STARTDATE != :NEW.STARTDATE) or 
  (:OLD.STARTDATE is not null and :NEW.STARTDATE is null) or (:OLD.STARTDATE is null and :NEW.STARTDATE is not null) then  
  insert into SYS_AUDITS(ID,AUDIT_COLUMNS_ID,USER_ID,OP_TYPE,OP_DATE,INITIAL_VALUE,LAST_VALUE,ID1,ID2, USER_NAME )    values
  (IDSEQ.nextval,26026,nvl(GLOBALVARS.GUSID,1),p_type,p_time,to_char(:OLD.STARTDATE,'dd.mm.yyyy hh24:mi:ss'),
  to_char(:NEW.STARTDATE,'dd.mm.yyyy hh24:mi:ss'),:NEW.ID,NULL,GLOBALVARS.GUSER); end if; if 
  (:OLD.COMMENT200 is not null and :NEW.COMMENT200 is not null and :OLD.COMMENT200 != :NEW.COMMENT200) or 
  (:OLD.COMMENT200 is not null and :NEW.COMMENT200 is null) or (:OLD.COMMENT200 is null and :NEW.COMMENT200 is not null) then 
  insert into SYS_AUDITS(ID,AUDIT_COLUMNS_ID,USER_ID,OP_TYPE,OP_DATE,INITIAL_VALUE,LAST_VALUE,ID1,ID2, USER_NAME )    
  values (IDSEQ.nextval,25767,nvl(GLOBALVARS.GUSID,1),p_type,p_time,:OLD.COMMENT200,:NEW.COMMENT200,:NEW.ID,NULL,GLOBALVARS.GUSER); 
  end if; if (:OLD.PCN is not null and :NEW.PCN is not null and :OLD.PCN != :NEW.PCN) or 
  (:OLD.PCN is not null and :NEW.PCN is null) or (:OLD.PCN is null and :NEW.PCN is not null) then   
  insert into SYS_AUDITS(ID,AUDIT_COLUMNS_ID,USER_ID,OP_TYPE,OP_DATE,INITIAL_VALUE,LAST_VALUE,ID1,ID2, USER_NAME )  
  values (IDSEQ.nextval,25768,nvl(GLOBALVARS.GUSID,1),p_type,p_time,:OLD.PCN,:NEW.PCN,:NEW.ID,NULL,GLOBALVARS.GUSER);
  end if; if (:OLD.ENDDATE is not null and :NEW.ENDDATE is not null and :OLD.ENDDATE != :NEW.ENDDATE) or
  (:OLD.ENDDATE is not null and :NEW.ENDDATE is null) or (:OLD.ENDDATE is null and :NEW.ENDDATE is not null) then  
  insert into SYS_AUDITS(ID,AUDIT_COLUMNS_ID,USER_ID,OP_TYPE,OP_DATE,INITIAL_VALUE,LAST_VALUE,ID1,ID2, USER_NAME )   
  values (IDSEQ.nextval,26027,nvl(GLOBALVARS.GUSID,1),p_type,p_time,to_char(:OLD.ENDDATE,'dd.mm.yyyy hh24:mi:ss'),
  to_char(:NEW.ENDDATE,'dd.mm.yyyy hh24:mi:ss'),:NEW.ID,NULL,GLOBALVARS.GUSER); end if; 
  if (:OLD.DSMUI is not null and :NEW.DSMUI is not null and :OLD.DSMUI != :NEW.DSMUI) or
  (:OLD.DSMUI is not null and :NEW.DSMUI is null) or 
  (:OLD.DSMUI is null and :NEW.DSMUI is not null) then   
  insert into SYS_AUDITS(ID,AUDIT_COLUMNS_ID,USER_ID,OP_TYPE,OP_DATE,INITIAL_VALUE,LAST_VALUE,ID1,ID2, USER_NAME )   
  values (IDSEQ.nextval,31000,nvl(GLOBALVARS.GUSID,1),p_type,p_time,:OLD.DSMUI,:NEW.DSMUI,:NEW.ID,NULL,GLOBALVARS.GUSER); end if; end;
/

