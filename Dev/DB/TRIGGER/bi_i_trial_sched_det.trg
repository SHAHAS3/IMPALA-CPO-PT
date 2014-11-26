create or replace trigger "BI_I_TRIAL_SCHED_DET"   
  before insert on "I_TRIAL_SCHED_DET"               
  for each row  
begin   
  if :NEW."ID" is null then 
    select "IDSEQ".nextval into :NEW."ID" from dual; 
  end if; 
end;
/

