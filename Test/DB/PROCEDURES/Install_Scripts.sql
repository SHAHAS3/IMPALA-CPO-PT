-------------------------------------------------
-- Export file for user IMPALA                 --
-- Created by SHAHAS3 on 7/28/2014, 4:07:12 PM --
-------------------------------------------------

set define off
spool Install_Scripts.log

prompt
prompt Creating procedure CAPAMPBILANCE
prompt ================================
prompt
@@capampbilance.prc
prompt
prompt Creating procedure ASSGNWEEKHOURS
prompt =================================
prompt
@@assgnweekhours.prc
prompt
prompt Creating procedure CALCENDDATE
prompt ==============================
prompt
@@calcenddate.prc
prompt
prompt Creating procedure CALCENDDATE_TEST
prompt ===================================
prompt
@@calcenddate_test.prc
prompt
prompt Creating procedure CAPAMPWEEKUPDATE
prompt ===================================
prompt
@@capampweekupdate.prc
prompt
prompt Creating procedure DOCALCWK
prompt ===========================
prompt
@@docalcwk.prc
prompt
prompt Creating procedure HOST_COMMAND
prompt ===============================
prompt
@@host_command.prc
prompt
prompt Creating procedure SUMOFLABELS
prompt ==============================
prompt
@@sumoflabels.prc
prompt
prompt Creating procedure P$MOVESITECODE
prompt =================================
prompt
@@p$movesitecode.prc
prompt
prompt Creating procedure POPULATEPCNKEY
prompt =================================
prompt
@@populatepcnkey.prc
prompt
prompt Creating procedure UPDATESTARTDATE
prompt ==================================
prompt
@@updatestartdate.prc
prompt
prompt Creating procedure PCNUPDATE
prompt ============================
prompt
@@pcnupdate.prc
prompt
prompt Creating procedure PERFORM_SHIFT
prompt ================================
prompt
@@perform_shift.prc
prompt
prompt Creating procedure PROCESSTASKS
prompt ===============================
prompt
@@processtasks.prc
prompt
prompt Creating procedure SENDCOOKIE
prompt =============================
prompt
@@sendcookie.prc
prompt
prompt Creating procedure SENDMAIL
prompt ===========================
prompt
@@sendmail.prc
prompt
prompt Creating procedure STRATEGICELEMENTS
prompt ====================================
prompt
@@strategicelements.prc
prompt
prompt Creating procedure TEMP_STATUS
prompt ==============================
prompt
@@temp_status.prc
prompt
prompt Creating procedure XTEST
prompt ========================
prompt
@@xtest.prc

spool off
