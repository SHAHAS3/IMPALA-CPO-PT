-------------------------------------------------
-- Export file for user IMPALA                 --
-- Created by SHAHAS3 on 7/28/2014, 4:09:27 PM --
-------------------------------------------------

set define off
spool Install_Scripts.log

prompt
prompt Creating package GLOBALVARS
prompt ===========================
prompt
@@globalvars.spc
prompt
prompt Creating package PKG$ACT
prompt ========================
prompt
@@pkg$act.pck
prompt
prompt Creating package SYS_AUDIT
prompt ==========================
prompt
@@sys_audit.pck
prompt
prompt Creating package SYS_CPO_AUDIT
prompt ==============================
prompt
@@sys_cpo_audit.pck

spool off
