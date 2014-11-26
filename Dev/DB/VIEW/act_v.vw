CREATE OR REPLACE FORCE VIEW ACT_V
(actidentifier, actuserid, sequence, item, clin_data, clin_label_id, cpr_data, cpr_id, matching, primarypackid, itemoccurrence, labeldescription, warning)
AS
SELECT DISTINCT(a."IDENTIFIER"),
    a."ACTUSERID",
    1 "SEQUENCE",
    'Study Code' "ITEM",
    a."CPRVALUE" "CLIN_DATA",
    a."LABELID" "CLIN_LABEl_ID",
    b."PLACEHOLDER_DATA" "CPR_DATA",
    a."CPRID" "CPR_ID",
    DECODE(PKG$ACT.F$GETWARNING('STUDYCODE',a.ACTUSERID,a.LABELID,a."ITEMOCCURRENCE",a."LABELDESCRIPTION",a."CPRVALUE"),NULL,'Y','P') "MATCHING",
    a."PRIMARYPACKID" "PRIMARYPACKID",
    a."ITEMOCCURRENCE" "ITEMOCCURRENCE",
    a."LABELDESCRIPTION" "LABELDESCRIPTION",
    PKG$ACT.F$GETWARNING('STUDYCODE',a.ACTUSERID,a.LABELID,a."ITEMOCCURRENCE",a."LABELDESCRIPTION",a."CPRVALUE")"WARNING"
  FROM actresult a ,
    actlabelplaceholders b
  WHERE a.placeholder_id                         != 'N'
  AND a.placeholder_id                            = b.ftph_id
  AND a.labelid                                   = b.labelid
  AND a.acttype                                   = 'STUDYCODE'
  AND PKG$ACT.F$CHECKITEM('STUDYCODE',a.ACTUSERID)='Y'
  AND a.CLINTYPE                                  ='FTPH'
  --
  -- DRUG PRODUCT NAME (only FTPH)
  --
  UNION
  SELECT DISTINCT(a."IDENTIFIER"),
    a."ACTUSERID",
    2 "SEQUENCE",
    'Drug Product Name' "ITEM",
    a."CPRVALUE" "CLIN_DATA",
    a."LABELID" "CLIN_LABEl_ID",
    b."PLACEHOLDER_DATA" "CPR_DATA",
    a."CPRID" "CPR_ID",
    DECODE(PKG$ACT.F$GETWARNING('PROJECTCODE',a.ACTUSERID,a.LABELID,a."ITEMOCCURRENCE",a."LABELDESCRIPTION",a."CPRVALUE"),NULL,'Y','P') "MATCHING",
    a."PRIMARYPACKID" "PRIMARYPACKID",
    a."ITEMOCCURRENCE" "ITEMOCCURRENCE",
    a."LABELDESCRIPTION" "LABELDESCRIPTION",
    PKG$ACT.F$GETWARNING('PROJECTCODE',a.ACTUSERID,a.LABELID,a."ITEMOCCURRENCE",a."LABELDESCRIPTION",a."CPRVALUE")"WARNING"
  FROM actresult a ,
    actlabelplaceholders b
  WHERE a.placeholder_id                           != 'N'
  AND a.placeholder_id                              = b.ftph_id
  AND a.labelid                                     = b.labelid
  AND a.acttype                                     = 'PROJECTCODE'
  AND PKG$ACT.F$CHECKITEM('PROJECTCODE',a.ACTUSERID)='Y'
  AND a.CLINTYPE                                    ='FTPH'
  UNION
  --DOSAGE STRENGTH
  --FTPH
  SELECT DISTINCT(a."IDENTIFIER"),
    a."ACTUSERID",
    3 "SEQUENCE",
    'Dosage strength' "ITEM",
    PKG$ACT.F$GETDOSAGESTRENGTH(a.ACTUSERID,a.LABELID) "CLIN_DATA",
    a."LABELID" "CLIN_LABEl_ID",
    a."CPRVALUE" "CPR_DATA",
    a."CPRID" "CPR_ID",
    DECODE(PKG$ACT.F$GETWARNING('DOSAGESTRENGTH',a.ACTUSERID,a.LABELID,NULL,a."LABELDESCRIPTION",a."CPRVALUE"),NULL,'Y','P') "MATCHING",
    a."PRIMARYPACKID" "PRIMARYPACKID",
    PKG$ACT.F$GETOCCURRENCEDS('FTPHVPH',a.ACTUSERID,a."CPRVALUE",a."LABELID") "ITEMOCCURRENCE",
    a."LABELDESCRIPTION" "LABELDESCRIPTION",
    PKG$ACT.F$GETWARNING('DOSAGESTRENGTH',a.ACTUSERID,a.LABELID,NULL,a."LABELDESCRIPTION",a."CPRVALUE")"WARNING"
  FROM actresult a ,
    actlabelplaceholders b
  WHERE a.placeholder_id                              != 'N'
  AND a.placeholder_id                                 = b.ftph_id
  AND a.labelid                                        = b.labelid
  AND a.acttype                                        = 'DOSAGESTRENGTH'
  AND PKG$ACT.F$CHECKITEM('DOSAGESTRENGTH',a.ACTUSERID)='Y'
  UNION
  --DOSAGE STRENGTH
  --VPH
  SELECT DISTINCT(a."IDENTIFIER"),
    a."ACTUSERID",
    3 "SEQUENCE",
    'Dosage strength' "ITEM",
    PKG$ACT.F$GETDOSAGESTRENGTH(a.ACTUSERID,a.LABELID) "CLIN_DATA",
    a."LABELID" "CLIN_LABEl_ID",
    a."CPRVALUE" "CPR_DATA",
    a."CPRID" "CPR_ID",
    DECODE(PKG$ACT.F$GETWARNING('DOSAGESTRENGTH',a.ACTUSERID,a.LABELID,NULL,a."LABELDESCRIPTION",a."CPRVALUE"),NULL,'Y','P') "MATCHING",
    a."PRIMARYPACKID" "PRIMARYPACKID",
    PKG$ACT.F$GETOCCURRENCEDS('FTPHVPH',a.ACTUSERID,a."CPRVALUE",a."LABELID") "ITEMOCCURRENCE",
    a."LABELDESCRIPTION" "LABELDESCRIPTION",
    PKG$ACT.F$GETWARNING('DOSAGESTRENGTH',a.ACTUSERID,a.LABELID,NULL,a."LABELDESCRIPTION",a."CPRVALUE")"WARNING"
  FROM actresult a ,
    actlabelplaceholders b
  WHERE a.placeholder_id                              != 'N'
  AND a.placeholder_id                                 = b.vph_id
  AND a.labelid                                        = b.labelid
  AND a.acttype                                        = 'DOSAGESTRENGTH'
  AND PKG$ACT.F$CHECKITEM('DOSAGESTRENGTH',a.ACTUSERID)='Y'
  UNION
  --
  --  DOSAGE FORM (only TPH)
  --
  SELECT DISTINCT(a."IDENTIFIER"),
    a."ACTUSERID",
    4 "SEQUENCE",
    'Dosage Form' "ITEM",
    p."DESCRIPTION" "CLIN_DATA",
    a."LABELID" "CLIN_LABEl_ID",
    upper(k."DOSAGEFORM") "CPR_DATA",
    k."CPR_ID" "CPR_ID",
    --
    DECODE (PKG$ACT.F$MATCHING('TPH', 'DOSAGEFORM' ,upper(k."DOSAGEFORM"),a.LABELID,p."DESCRIPTION" ),'Y', DECODE(PKG$ACT.F$GETWARNING('DOSAGEFORM',a.ACTUSERID,a.LABELID,PKG$ACT.F$GETOCCURRENCE('TPH',a.ACTUSERID,p.PLACEHOLDER_ID,a.LABELID),a.LABELDESCRIPTION,upper(k."DOSAGEFORM")),NULL,'Y','P'), PKG$ACT.F$MATCHING('TPH', 'DOSAGEFORM' ,upper(k."DOSAGEFORM"),a.LABELID,p."DESCRIPTION" )) "MATCHING",
    --
    --DECODE(PKG$ACT.F$GETWARNING('DOSAGEFORM',NULL,NULL,PKG$ACT.F$GETOCCURRENCE('TPH',p.PLACEHOLDER_ID,a.LABELID),a.LABELDESCRIPTION), NULL,'Y','P') "MATCHING",
    0 "PRIMARYPACKID",
    PKG$ACT.F$GETOCCURRENCE('TPH',a.ACTUSERID,p.PLACEHOLDER_ID,a.LABELID) "ITEMOCCURRENCE",
    a."LABELDESCRIPTION" "LABELDESCRIPTION",
    PKG$ACT.F$GETWARNING('DOSAGEFORM',a.ACTUSERID,a.LABELID,PKG$ACT.F$GETOCCURRENCE('TPH',a.ACTUSERID,p.PLACEHOLDER_ID,a.LABELID),a.LABELDESCRIPTION,upper(k."DOSAGEFORM"))"WARNING"
  FROM label_placeholders l,
    actmapping a,
    phrase_translation p,
    ecpr.primarypack k
  WHERE a.labelid      = l.label_id
  AND p.placeholder_id = l.tph_id
  AND a.primarypackid  = k.id
  AND l.tph_id        IS NOT NULL
    --AND p.lang_cd        = l.lang_cd
  AND p.lang_cd = 'ENG'
  AND p.placeholder_id LIKE 'DOS%'
  AND PKG$ACT.F$CHECKITEM('DOSAGEFORM',a.ACTUSERID)='Y'
  UNION
  --
  --  ROUTE OF ADMINISTRATION (only TPH)
  --
  SELECT DISTINCT(a."IDENTIFIER"),
    a."ACTUSERID",
    5 "SEQUENCE",
    'Route of Administration' "ITEM",
    p."DESCRIPTION" "CLIN_DATA",
    a."LABELID" "CLIN_LABEl_ID",
    upper("ROUTEOFADMINISTRATION") "CPR_DATA",
    k."CPR_ID" "CPR_ID",
    --
    DECODE (PKG$ACT.F$MATCHING('TPH', 'ROUTEOFADMINISTRATION' ,upper("ROUTEOFADMINISTRATION"),a.LABELID,p."DESCRIPTION" ),'Y', DECODE(PKG$ACT.F$GETWARNING('ROA',a.ACTUSERID,a.LABELID,PKG$ACT.F$GETOCCURRENCE('TPH',a.ACTUSERID,p.PLACEHOLDER_ID,a.LABELID),a.LABELDESCRIPTION,upper(k."DOSAGEFORM")),NULL,'Y','P'), PKG$ACT.F$MATCHING('TPH', 'ROUTEOFADMINISTRATION' ,upper("ROUTEOFADMINISTRATION"),a.LABELID,p."DESCRIPTION" )) "MATCHING",
    --
    0 "PRIMARYPACKID",
    PKG$ACT.F$GETOCCURRENCE('TPH',a.ACTUSERID,p.PLACEHOLDER_ID,a.LABELID) "ITEMOCCURRENCE",
    a."LABELDESCRIPTION" "LABELDESCRIPTION",
    PKG$ACT.F$GETWARNING('ROA',a.ACTUSERID,a.LABELID,PKG$ACT.F$GETOCCURRENCE('TPH',a.ACTUSERID,p.PLACEHOLDER_ID,a.LABELID),a.LABELDESCRIPTION,upper(k."DOSAGEFORM"))"WARNING"
  FROM label_placeholders l,
    actmapping a,
    phrase_translation p,
    ecpr.primarypack k
  WHERE a.labelid      = l.label_id
  AND p.placeholder_id = l.tph_id
  AND a.primarypackid  = k.id
  AND l.tph_id        IS NOT NULL
    --AND p.lang_cd        = l.lang_cd
  AND p.lang_cd = 'ENG' --all should appear in English in ACT
  AND p.placeholder_id LIKE 'ROA%'
  AND PKG$ACT.F$CHECKITEM('ROUTEOFADMINISTRATION',a.ACTUSERID)='Y'
  --
  -- NUMBER PER UNIT (FTPH )
  --
  UNION
  SELECT DISTINCT(a."IDENTIFIER"),
    a."ACTUSERID",
    6,
    'Number per unit' "ITEM",
    a."CPRVALUE" "CLIN_DATA",
    a."LABELID" "CLIN_LABEL_ID",
    b."PLACEHOLDER_DATA" "CPR_DATA",
    a."CPRID" "CPR_ID",
    DECODE(PKG$ACT.F$GETWARNING('NUMBERPERUNIT',a.ACTUSERID,a.LABELID,a."ITEMOCCURRENCE",a."LABELDESCRIPTION",a."CPRVALUE"),NULL,'Y','P') "MATCHING",
    a."PRIMARYPACKID" "PRIMARYPACKID",
    a."ITEMOCCURRENCE" "ITEMOCCURRENCE",
    a."LABELDESCRIPTION" "LABELDESCRIPTION",
    PKG$ACT.F$GETWARNING('NUMBERPERUNIT',a.ACTUSERID,a.LABELID,a."ITEMOCCURRENCE",a."LABELDESCRIPTION",a."CPRVALUE")"WARNING"
  FROM actresult a ,
    actlabelplaceholders b
  WHERE a.placeholder_id                             != 'N'
  AND a.placeholder_id                                = b.ftph_id
  AND a.labelid                                       = b.labelid
  AND a.acttype                                       = 'NUMBERPERUNIT'
  AND PKG$ACT.F$CHECKITEM('NUMBERPERUNIT',a.ACTUSERID)='Y'
  --
  -- NUMBER PER UNIT ( VPH)
  --
  --
  -- Additional Label Parameter
  --
  UNION
  SELECT DISTINCT(a."IDENTIFIER"),
    a."ACTUSERID",
    7,
    'Add.Label Param.' "ITEM",
    a."CLINADDLABELPARAM" "CLIN_DATA",
    a."LABELID" "CLIN_LABEl_ID",
    a."CPRVALUE" "CPR_DATA",
    a."CPRID" "CPR_ID",
    --DECODE(upper(trim("PLACEHOLDER_DATA")),upper(trim("CPRVALUE")),'Y','N'),
    DECODE(PKG$ACT.F$GETWARNING('ADDLABELPARAM',a.ACTUSERID,a.LABELID,a."ITEMOCCURRENCE",a."LABELDESCRIPTION",a."CPRVALUE"),NULL,'Y','P') "MATCHING",
    a."PRIMARYPACKID" "PRIMARYPACKID",
    a."ITEMOCCURRENCE" "ITEMOCCURRENCE",
    a."LABELDESCRIPTION" "LABELDESCRIPTION",
    PKG$ACT.F$GETWARNING('ADDLABELPARAM',a.ACTUSERID,a.LABELID,a."ITEMOCCURRENCE",a."LABELDESCRIPTION",a."CPRVALUE")"WARNING"
  FROM actresult a
  WHERE a.placeholder_id                             != 'N'
  AND a.acttype                                       = 'ADDLABELPARAM'
  AND PKG$ACT.F$CHECKITEM('ADDLABELPARAM',a.ACTUSERID)='Y'
  --
  --MISMATCH
  --
  UNION
  SELECT DISTINCT(a."IDENTIFIER"),
    a."ACTUSERID",
    8,
    PKG$ACT.F$GETCLIN('ITEM','FTPH',a.LABELID,a."ACTUSERID") "ITEM",
    PKG$ACT.F$GETCLIN('MISMATCH','FTPH',a.LABELID,a."ACTUSERID") "CLIN_DATA",
    a."LABELID" "CLIN_LABEl_ID",
    PKG$ACT.F$GETCLIN('DATA','FTPH',a.LABELID,a."ACTUSERID") "CPR_DATA",
    a."CPRID" "CPR_ID",
    'N' "MATCHING",
    0 "PRIMARYPACKID",
    0 "ITEMOCCURRENCE",
    "LABELDESCRIPTION",
    'Mismatch' "WARNING"
  FROM actresult a
  WHERE a.placeholder_id                                        = 'N'
  AND PKG$ACT.F$GETCLIN('ITEM','FTPH',a.LABELID,a."ACTUSERID") != 'Mismatch for '
  and (PKG$ACT.F$GETCLIN('MISMATCH','FTPH',a.LABELID,a."ACTUSERID") is not null 
      or PKG$ACT.F$GETCLIN('DATA','FTPH',a.LABELID,a."ACTUSERID") is not null);

