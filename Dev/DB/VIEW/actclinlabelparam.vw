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
FROM ACTLABELPLACEHOLDERS A, IMG_OBJECTS I
where  A.OBJECT_ID = I.OBJECT_ID(+)
and ( A."OBJECT_ID" is not null or
 (upper(a.placeholder_data) like ('DAY%') or
 upper(a.placeholder_data) like ('VISIT%') or
 upper(a.placeholder_data) like ('PERIOD%') or
 upper(a.placeholder_data) like ('BOTTLE%') or
 upper(a.placeholder_data) like ('INHALER%') or
 upper(a.placeholder_data) like ('AREA%') or
 upper(a.placeholder_data) like ('VARIANT%') or
 upper(a.placeholder_data) like ('STRATUM%') or
 upper(a.placeholder_data) = 'FOR TRAINING'  or
 upper(a.description) like ('DAY%') or
 upper(a.description) like ('VISIT%') or
 upper(a.description) like ('PERIOD%') or
 upper(a.description) like ('BOTTLE%') or
 upper(a.description) like ('INHALER%') or
 upper(a.description) like ('AREA%') or
 upper(a.description) like ('VARIANT%') or
 upper(a.description) like ('STRATUM%') or
 upper(a.description) = 'FOR TRAINING'  )
);

