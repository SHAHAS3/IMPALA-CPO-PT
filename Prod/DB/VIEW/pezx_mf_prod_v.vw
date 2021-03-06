CREATE OR REPLACE FORCE VIEW PEZX_MF_PROD_V AS
SELECT 
 "PROD_N","KN_N","U_VERSION","NOPAS_NB","NOPAS_NB_BULK","NOPAS_PROD_NAME_BULK","REF_N","THEOR_UNIT_W","PROD_TYPE","PROD_SUB_TYPE","TRANSP_INSTR","GENER_NA","CHEM_DESC","CREATOR_NA","CREATOR_DEP","CREATION_D","MUT_D","DRUG_FORM_C","DOSE","FORMULA","MUT_DEP","MUT_NA","PHARMA_STEP","PROD_TXT20","PROD_TXTS","PROD_TXT40_1","PROD_TXT40_2","QUANT_C_DOSE","QUANT_C_VOL","SALT_FORM_NA","STATUS1","STOR_INSTR_1","STOR_INSTR_2","STOR_INSTR_3","VOLUME_W","COMMENT_L","PROD_TXT_3","PROD_TXT_4","LONG_TEXT","CHANGE_REASON","BASNR","VARNR","BASNR_DP","VARNR_DP","DRUGCODE","DOSAGE","GMP_RELEVANCE","ANAL_SOURCE","PROD_N_NEW","KN_N_NEW","ORIGIN","PRODUCT_SYNONYM","CAS_N","NSC_C","HANDLING_RECOM","TRANSP_CLASS","PMF_STATUS","SUPPLY_MANAGER","TRD_MATERIAL_NAME","DG_CLASS_C","CNTRLD_DRG"   
FROM
PEZX_MF_PROD@PELA;

