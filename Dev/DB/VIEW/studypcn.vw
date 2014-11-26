create or replace force view studypcn as
(select trim(substr(year,3,2))||'-'||to_char(number_4,'0999')||decode(stock_c,'VMLK','CH','CSUS','US','-') "PCN",stud_c "STUDYCODE" from pela_commiss  where appl_typ <= 20);

