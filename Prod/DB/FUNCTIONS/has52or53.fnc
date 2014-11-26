create or replace function has52or53(vyear number)
return varchar2
as
vday number;
vdate date default trunc(sysdate);
begin
vdate:='1-JAN-'||vyear;
select to_number(to_char(vdate,'D')) into vday from dual;
if vday=5 then 
  return 'YES';
else
  return 'NO';
end if;
end;
/

