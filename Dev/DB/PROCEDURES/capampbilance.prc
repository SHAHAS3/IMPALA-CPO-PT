create or replace procedure capampbilance(vcapamp_id number)
AS
begin
update capamp set assignedhours = sumhours(vcapamp_id) where id=vcapamp_id;
update capamp set percentused = round(sumhours(vcapamp_id)*100/ hoursavailable,2) where id = vcapamp_id;

commit; -- WK, 06.08.2009
end;
/

