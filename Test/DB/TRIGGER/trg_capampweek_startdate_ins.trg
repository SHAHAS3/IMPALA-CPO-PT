CREATE OR REPLACE TRIGGER "TRG_CAPAMPWEEK_STARTDATE_INS" 
BEFORE INSERT 
ON CAPAMPWEEK
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
DECLARE
  l_year number;
  l_week number;
  l_initialdate date;
BEGIN 


if (F$PCNFIRSTWEEKYN(:NEW.ID,:NEW.PCNKEY) = 'Y' and (:new.status != 'SHIFTED QTY CHANGE' and :new.status != 'SHIFTED NO QTY CHANGE' or  :new.status is null)) then
   
   select mpyear,mpweek
   into l_year, l_week
   from capamp
   where id = :NEW.CAPAMP_ID;
   
   select weekdate(l_year,l_week)into l_initialdate from dual;
   
   case upper(:NEW.weekday)
when 'MONDAY' then
  :NEW.STARTDATE :=  l_initialdate;
when 'TUESDAY' then
  :NEW.STARTDATE :=  l_initialdate+1d;
when 'WEDNESDAY' then
  :NEW.STARTDATE :=  l_initialdate+2d;
when 'THURSDAY' then
  :NEW.STARTDATE :=  l_initialdate+3d;
when 'FRIDAY' then
  :NEW.STARTDATE :=  l_initialdate+4d;
end case;

end if;

END ;
/

