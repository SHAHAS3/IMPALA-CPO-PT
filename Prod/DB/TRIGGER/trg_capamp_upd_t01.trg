CREATE OR REPLACE TRIGGER "TRG_CAPAMP_UPD_T01" 
BEFORE UPDATE
ON CAPAMP
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
DECLARE
/******************************************************************************
   NAME:   TRG_CAPAMP_UPD_T01
   PURPOSE: used for personal tracking calculation
   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        03-NOV-2010       R.Priester Created this trigger.

   NOTES:

******************************************************************************/
  v_hoursholiday number;
  v_hoursillness number;
  v_hourstraining number;
  v_hoursmachine number;
  v_hoursovertime number;
BEGIN

v_hoursholiday := NVL(:old.hoursholiday,0) - NVL(:new.hoursholiday,0);
v_hoursillness := NVL(:old.hoursillness,0) - NVL(:new.hoursillness,0);
v_hourstraining := NVL(:old.hourstraining,0) - NVL(:new.hourstraining,0);
v_hoursmachine := NVL(:old.hoursmachine,0) - NVL(:new.hoursmachine,0);
v_hoursovertime := NVL(:old.hoursovertime,0) - NVL(:new.hoursovertime,0);

IF (v_hoursholiday != 0 or v_hoursillness != 0  or v_hourstraining != 0 or v_hoursmachine != 0  or v_hoursovertime != 0 ) THEN

  :new.hoursavailable := :old.hoursavailable + v_hoursholiday +v_hoursillness + v_hourstraining - v_hoursmachine - v_hoursovertime;
  IF ( :new.hoursavailable < 0 ) THEN
   raise_application_error (-20001,'HOURS AVAILABLE IS NEGATIVE');
  END IF;
  
END IF;

END ;
/

