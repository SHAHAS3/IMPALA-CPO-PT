create or replace function sumhours(vcapamp_id number)
return NUMBER
is
vsum number;
begin
select sum(assignedhoursperweek) into vsum from capampweek where capamp_id=vcapamp_id group by capamp_id;
return vsum;
end;
/

