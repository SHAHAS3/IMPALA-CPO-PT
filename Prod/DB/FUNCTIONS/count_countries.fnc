create or replace function COUNT_COUNTRIES (VSTUDY_CODE VARCHAR2)
    return number
is
vcount number;
begin
    select count(*) into vcount from sai_v_trial_country@clinadmin where study_code=VSTUDY_CODE;
    return vcount;
end;
/

