-------------------------------------------------
-- Export file for user IMPALA                 --
-- Created by SHAHAS3 on 7/28/2014, 4:07:44 PM --
-------------------------------------------------

set define off
spool Install_Scripts.log

prompt
prompt Creating trigger ACTMAPPINGTRG
prompt ==============================
prompt
@@actmappingtrg.trg
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
