-------------------------------------------------
-- Export file for user IMPALA                 --
-- Created by SHAHAS3 on 7/28/2014, 4:09:56 PM --
-------------------------------------------------

set define off
spool Install_Scripts.log

prompt
prompt Creating trigger ACTMAPPINGTRG
prompt ==============================
prompt
@@actmappingtrg.trg
prompt
prompt Creating trigger BI_I_PROGRAM
prompt =============================
prompt
@@bi_i_program.trg
prompt
prompt Creating trigger BI_I_TRIAL
prompt ===========================
prompt
@@bi_i_trial.trg
prompt
prompt Creating trigger BI_I_TRIAL_SCHED_DET
prompt =====================================
prompt
@@bi_i_trial_sched_det.trg
prompt
prompt Creating trigger BI_I_TRIAL_SCHED_HEAD
prompt ======================================
prompt
@@bi_i_trial_sched_head.trg
prompt
prompt Creating trigger SYS_AUDIT_TRG_ADM_USERS
prompt ========================================
prompt
@@sys_audit_trg_adm_users.trg
prompt
prompt Creating trigger SYS_AUDIT_TRG_CAPAMPWEEK
prompt =========================================
prompt
@@sys_audit_trg_capampweek.trg
prompt
prompt Creating trigger TRG_CAPAMPWEEK_DEL
prompt ===================================
prompt
@@trg_capampweek_del.trg
prompt
prompt Creating trigger TRG_CAPAMPWEEK_INS_UPD
prompt =======================================
prompt
@@trg_capampweek_ins_upd.trg
prompt
prompt Creating trigger TRG_CAPAMPWEEK_STARTDATE_INS
prompt =============================================
prompt
@@trg_capampweek_startdate_ins.trg
prompt
prompt Creating trigger TRG_CAPAMP_INS_UPD
prompt ===================================
prompt
@@trg_capamp_ins_upd.trg
prompt
prompt Creating trigger TRG_CAPAMP_UPD_T01
prompt ===================================
prompt
@@trg_capamp_upd_t01.trg

spool off
