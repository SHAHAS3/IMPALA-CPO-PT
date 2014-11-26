create or replace trigger "BI_I_TRIAL"   
  before insert on "I_TRIAL"               
  for each row  
begin   
  if :NEW."ID" is null then 
    select "IDSEQ".nextval into :NEW."ID" from dual; 
  end if; 
end;
/

