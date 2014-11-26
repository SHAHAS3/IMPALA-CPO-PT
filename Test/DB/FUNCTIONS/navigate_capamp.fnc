create or replace function navigate_capamp
(
pi_direction  varchar2, --NEXT or PREVIOUS
pi_id         number
)
return number
as
v_new_id   number;
v_week    number;
v_weeksperyear    number;
v_year     number;
v_sitecode varchar2(2);

begin

  SELECT mpweek, mpyear,sitecode
  INTO v_week,v_year,v_sitecode
  FROM capamp
  WHERE id=pi_id
  and rownum = 1;

  if (pi_direction = 'Next') then

    -- evaluate whether year has 52 or 53 weeks
    if has52or53(v_year)='YES' then
      v_weeksperyear:=53;
    else
      v_weeksperyear:=52;
    end if;
    -- evaluate week and year
    IF v_week = v_weeksperyear THEN
      v_week := 1;
      v_year := v_year + 1;
    ELSE
      v_week := v_week +1;
    END IF;
    SELECT id
    INTO v_new_id
    FROM capamp
    WHERE mpweek=v_week
    AND mpyear    =v_year
    AND sitecode = v_sitecode
    and rownum = 1;
  else
    -- evaluate whether year has 52 or 53 weeks
    if has52or53(v_year)='YES' then
       v_weeksperyear:=53;
    else
       v_weeksperyear:=52;
    end if;
    -- evaluate week and year
    IF v_week = 1 THEN
      v_week := v_weeksperyear;
      v_year := v_year - 1;
    ELSE
      v_week := v_week -1;
    END IF;
    SELECT id
    INTO v_new_id
    FROM capamp
    WHERE mpweek=v_week
    AND mpyear    =v_year
    AND sitecode = v_sitecode
    and rownum = 1;
END IF;

return v_new_id;

exception
when no_data_found then
   return null;

end navigate_capamp;
/

