CREATE OR REPLACE TRIGGER "TRG_CAPAMPWEEK_DEL" 
BEFORE DELETE 
ON CAPAMPWEEK
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
DECLARE

  l_count number;
  l_hoursavailable number;
  l_sumhours number;
BEGIN

select count(*) 
into l_count
from capamp
where  id = :OLD.CAPAMP_ID;

IF (l_count > 0)  THEN

  select NVL(hoursavailable,0)
  into l_hoursavailable 
  from capamp
  where id = :OLD.CAPAMP_ID;

  update capamp set 
  assignedhours = assignedhours - NVL(:OLD.assignedhoursperweek,0) ,
  percentused = round((assignedhours-NVL(:OLD.assignedhoursperweek,0))*100/ l_hoursavailable,2)
  where id=:OLD.CAPAMP_ID;

END IF;

END ;
/

