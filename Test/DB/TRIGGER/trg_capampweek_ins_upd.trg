CREATE OR REPLACE TRIGGER "TRG_CAPAMPWEEK_INS_UPD" 
BEFORE INSERT OR UPDATE
ON CAPAMPWEEK
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
DECLARE
/******************************************************************************
   NAME:
   PURPOSE:

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        3/29/2010             1. Created this trigger.

   NOTES:

   Automatically available Auto Replace Keywords:
      Object Name:
      Sysdate:         3/29/2010
      Date and Time:   3/29/2010, 3:39:16 PM, and 3/29/2010 3:39:16 PM
      Username:         (set in TOAD Options, Proc Templates)
      Table Name:      CAPAMPWEEK
      Trigger Options:  (set in the "New PL/SQL Object" dialog)
******************************************************************************/
  v_user varchar2(50);
BEGIN
  if (user = 'ANONYMOUS') then
    v_user := GLOBALVARS.guserid;
  else
    v_user := user;
  end if;
   if inserting then
     :new.created_by := v_user;
	   :new.created_on := sysdate;
   else
     :new.modified_by := v_user;
	   :new.modified_on := sysdate;
   end if;
   
   if (:new.numberofpeople = 0) then
      :new.numberofpeople := '';
   end if;

END ;
/

