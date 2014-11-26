-------------------------------------------------
-- Export file for user IMPALA                 --
-- Created by SHAHAS3 on 7/28/2014, 4:10:10 PM --
-------------------------------------------------

set define off
spool Install_Scripts.log

prompt
prompt Creating view IMG_OBJECTS
prompt =========================
prompt
@@img_objects.vw
prompt
prompt Creating view ACTCLINLABELPARAM
prompt ===============================
prompt
@@actclinlabelparam.vw
prompt
prompt Creating view LABEL_PLACEHOLDERS
prompt ================================
prompt
@@label_placeholders.vw
prompt
prompt Creating view PHRASE_TRANSLATION
prompt ================================
prompt
@@phrase_translation.vw
prompt
prompt Creating view ACT_V
prompt ===================
prompt
@@act_v.vw
prompt
prompt Creating view FREETEXT_PH
prompt =========================
prompt
@@freetext_ph.vw
prompt
prompt Creating view FREETEXT_PH_JN
prompt ============================
prompt
@@freetext_ph_jn.vw
prompt
prompt Creating view PELA_STOCK
prompt ========================
prompt
@@pela_stock.vw
prompt
prompt Creating view IMOS_INVL_V
prompt =========================
prompt
@@imos_invl_v.vw
prompt
prompt Creating view LABEL_ARTWORKS
prompt ============================
prompt
@@label_artworks.vw
prompt
prompt Creating view LABEL_OBJECT_JN
prompt =============================
prompt
@@label_object_jn.vw
prompt
prompt Creating view MARS_TRD_DPPPFP
prompt =============================
prompt
@@mars_trd_dpppfp.vw
prompt
prompt Creating view MARS_TRD_DS
prompt =========================
prompt
@@mars_trd_ds.vw
prompt
prompt Creating view PELA_COMMISS
prompt ==========================
prompt
@@pela_commiss.vw
prompt
prompt Creating view PELA_COMMISS_MORE
prompt ===============================
prompt
@@pela_commiss_more.vw
prompt
prompt Creating view PELA_MOVE
prompt =======================
prompt
@@pela_move.vw
prompt
prompt Creating view PEZX_MF_PROD_V
prompt ============================
prompt
@@pezx_mf_prod_v.vw
prompt
prompt Creating view QA_APPROVALS
prompt ==========================
prompt
@@qa_approvals.vw
prompt
prompt Creating view RUNS
prompt ==================
prompt
@@runs.vw
prompt
prompt Creating view SAI_V_TRIAL_V
prompt ===========================
prompt
@@sai_v_trial_v.vw
prompt
prompt Creating view STUDYPCN
prompt ======================
prompt
@@studypcn.vw
prompt
prompt Creating view USERS
prompt ===================
prompt
@@users.vw
prompt
prompt Creating view VISIT_PH
prompt ======================
prompt
@@visit_ph.vw
prompt
prompt Creating view V_SAI_V_TRIAL
prompt ===========================
prompt
@@v_sai_v_trial.vw
prompt
prompt Creating view quarterly_sum
prompt ===========================
prompt
@@quarterly_sum.vw

spool off
