CREATE OR REPLACE FORCE VIEW LABEL_PLACEHOLDERS AS
SELECT "LABEL_ID",
    "VERSION_NO",
    "PLACEHOLDER_SEQ",
    "TPH_ID",
    "DPH_ID",
    "VPH_ID",
    "OBJECT_ID",
    "CREATED_BY",
    "DATE_CREATED",
    "FTPH_ID",
    "LANG_CD",
    "STOCK_CD",
    "TPH_PLACEHOLDER_SEQ",
    "RTPH_ID"
  FROM LABEL_PLACEHOLDERS@clin;

