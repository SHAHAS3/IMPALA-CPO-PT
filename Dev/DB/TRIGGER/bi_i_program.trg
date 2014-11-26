create or replace trigger "BI_I_PROGRAM"   
  before insert on "I_PROGRAM"               
  for each row  
begin   
  if :NEW."ID" is null then 
    select "IDSEQ".nextval into :NEW."ID" from dual; 
  end if; 
end;
/

