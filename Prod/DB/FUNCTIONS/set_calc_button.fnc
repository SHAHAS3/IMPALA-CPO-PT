create or replace function set_calc_button
(
pi_startdate   date,
pi_capamp_id         number,
pi_type        varchar2,
pi_status      varchar2
)
return varchar2
as
vmpweek      NUMBER;
vmpyear      NUMBER;
v_calc_button VARCHAR2(50);

begin

SELECT mpweek, mpyear
INTO vmpweek,vmpyear
FROM capamp
WHERE id=pi_capamp_id
and rownum = 1;


if ((pi_startdate) not between weekdate(vmpyear,vmpweek) and weekdate(vmpyear,vmpweek)+4) or (pi_status = 'SHIFTED') then
  v_calc_button := ' ';
else
  v_calc_button:= pi_type;
end if;

return v_calc_button;

end set_calc_button;
/

