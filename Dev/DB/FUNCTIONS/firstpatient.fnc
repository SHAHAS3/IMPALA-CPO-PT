create or replace function firstpatient(vstudy_code varchar2)
return date
is
vfpfv date;
begin
select min(actual_date) into vfpfv from sai_v_trs_event@clinadmin.ph.chbs where study_code=vstudy_code
and event_description='1st Patient Entered Trial';
return vfpfv;
end;
/

