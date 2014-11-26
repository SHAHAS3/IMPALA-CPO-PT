--------------------------------------------------
-- Export file for user IMPALA                  --
-- Created by SHAHAS3 on 7/23/2014, 12:47:36 PM --
--------------------------------------------------

set define off
spool Install_Scripts.log

prompt
prompt Creating synonym MMDM_VARIANT_COFC_V
prompt ====================================
prompt
@@mmdm_variant_cofc_v.syn
prompt
prompt Creating synonym PELA_COMM_STATUS
prompt =================================
prompt
@@pela_comm_status.syn
prompt
prompt Creating synonym PEZX_MF_BATCH
prompt ==============================
prompt
@@pezx_mf_batch.syn
prompt
prompt Creating synonym PEZX_MF_CODE
prompt =============================
prompt
@@pezx_mf_code.syn
prompt
prompt Creating synonym PEZX_MF_CODE_TXT
prompt =================================
prompt
@@pezx_mf_code_txt.syn
prompt
prompt Creating synonym PEZX_MF_PROD
prompt =============================
prompt
@@pezx_mf_prod.syn
prompt
prompt Creating synonym SAI_V_TRIAL
prompt ============================
prompt
@@sai_v_trial.syn
prompt
prompt Creating synonym SAI_V_TRIAL_COUNTRY
prompt ====================================
prompt
@@sai_v_trial_country.syn

spool off
