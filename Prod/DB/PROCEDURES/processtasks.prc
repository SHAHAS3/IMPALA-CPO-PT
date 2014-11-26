create or replace procedure processtasks
is
vtaskprocedure varchar2(200);
vtask varchar2(200);
vid number;
cursor tasks is select id,taskprocedure from taskmanager;
begin
open tasks;
loop
  fetch tasks into vid,vtaskprocedure;
  exit when tasks%notfound;
  execute immediate 'begin '||vtaskprocedure||'; end;';
  insert into vtest (vn,vt) values(30,vtaskprocedure);
end loop;
close tasks;

commit; -- WK, 06.08.2009
end;
/

