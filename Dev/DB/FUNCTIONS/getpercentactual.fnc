create or replace function getpercentactual(vcapamp_id number)
return NUMBER
is
vsum number;
vtotal number;
begin

select sum(actualhoursperorder) into vsum from capampweek where capamp_id=vcapamp_id ;

select hoursavailable into vtotal from capamp where id=vcapamp_id ;


if (vtotal is not null and vtotal > 0) then
  vsum:= vsum/vtotal*100;
else
  vsum:= '';
end if;

return round(vsum,2);

end;
/

