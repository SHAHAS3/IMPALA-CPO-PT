CREATE OR REPLACE FORCE VIEW FREETEXT_PH AS
SELECT "LABEL_ID",
    "VERSION_NO",
    "PLACEHOLDER_ID",
    "PLACEHOLDER_DATA",
    "CREATED_BY",
    "DATE_CREATED" ,
    "MODIFIED_BY" ,
    "DATE_MODIFIED" ,
    "PLACEHOLDER_DATA_OCX",
    "LANG_CD"
  FROM FREETEXT_PH@clin.ph.chbs;

