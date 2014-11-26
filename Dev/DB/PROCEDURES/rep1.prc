CREATE OR REPLACE PROCEDURE REP1(p_session_id NUMBER, p_par1 NUMBER) IS
l_blob BLOB;
BEGIN 
--IF PLPDF_SESION_IS_VALID(p_session) THEN 
IF 1=1 THEN 
htp.p('Invalid Session'); 
ELSE 
htp.p('Invalid Session'); 
END IF; 
END;
/

