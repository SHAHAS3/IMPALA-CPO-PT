CREATE OR REPLACE FORCE VIEW ACTCLINLABELPARAM AS
SELECT A."ACTUSERID",
    A."LABELID",
    A."VERSION_NO",
    A."FTPH_ID",
    A."PLACEHOLDER_DATA",
    A."OBJECT_ID",
    I."OBJECT_NAME",
    A."VPH_ID",
    A."DESCRIPTION"
  FROM ACTLABELPLACEHOLDERS A,
    IMG_OBJECTS I
  WHERE A.OBJECT_ID    = I.OBJECT_ID(+)
  AND ( A."OBJECT_ID" IS NOT NULL
  OR (upper(a.placeholder_data) LIKE ('DAY%')
  OR upper(a.placeholder_data) LIKE ('VISIT%')
  OR upper(a.placeholder_data) LIKE ('PERIOD%')
  OR upper(a.placeholder_data) LIKE ('BOTTLE%')
  OR upper(a.placeholder_data) LIKE ('INHALER%')
  OR upper(a.placeholder_data) LIKE ('AREA%')
  OR upper(a.placeholder_data) LIKE ('VARIANT%')
  OR upper(a.placeholder_data) LIKE ('STRATUM%')
  OR upper(a.placeholder_data) = 'FOR TRAINING'
  OR upper(a.description) LIKE ('DAY%')
  OR upper(a.description) LIKE ('VISIT%')
  OR upper(a.description) LIKE ('PERIOD%')
  OR upper(a.description) LIKE ('BOTTLE%')
  OR upper(a.description) LIKE ('INHALER%')
  OR upper(a.description) LIKE ('AREA%')
  OR upper(a.description) LIKE ('VARIANT%')
  OR upper(a.description) LIKE ('STRATUM%')
  OR upper(a.description) = 'FOR TRAINING' ) );

