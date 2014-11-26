CREATE OR REPLACE FORCE VIEW STUDYPCN AS
(SELECT trim(SUBSTR(YEAR,3,2))
    ||'-'
    ||TO_CHAR(number_4,'0999')
    ||DECODE(stock_c,'VMLK','CH','CSUS','US','-') "PCN",
    stud_c "STUDYCODE"
  FROM pela_commiss@pela
  WHERE appl_typ <= 20
  );

