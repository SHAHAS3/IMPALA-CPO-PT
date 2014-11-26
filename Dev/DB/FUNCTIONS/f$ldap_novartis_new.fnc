CREATE OR REPLACE FUNCTION F$LDAP_NOVARTIS_NEW
(P_NTUSERID in VARCHAR2,
 P_NTPASSWORD IN  VARCHAR2) RETURN BOOLEAN is
   ldapHost1 VARCHAR2(100) := 'cds-oud-fe2-factory.eu.novartis.net';
   ldapPort1 NUMBER := 3636;
   l_retval   pls_integer;
   l_session   dbms_ldap.session;
   l_ldap_base    VARCHAR2(256) := 'dc=novartis,dc=com';
   authenticated BOOLEAN := FALSE;
   instanceName VARCHAR2(30);
   walletPassword VARCHAR2(30) := 'BQ8UHFT004f8S0v7xOmr';
   invalid_credentials exception;
   pragma exception_init(invalid_credentials,-31202);
BEGIN

      begin

      l_retval          := -1;
      dbms_ldap.use_exception := TRUE;
      l_session := dbms_ldap.init(ldapHost1, ldapPort1);

--     l_retval := dbms_ldap.open_ssl (l_session, 'file:/opt/oracle/product/tnsadmin/cert_wallet/',walletPassword, 2);
       l_retval := dbms_ldap.open_ssl (l_session, 'file:/opt/oracle/product/base/tnsadmin/cert_wallet/',walletPassword, 2);
     

      l_retval := dbms_ldap.simple_bind_s( l_session, 'uid='||P_NTUSERID||',ou=people,ou=intranet,dc=novartis,dc=com', P_NTPASSWORD );

      if l_retval = 0 then
       authenticated := TRUE;
      end if;

      l_retval := dbms_ldap.unbind_s( l_session );
      return authenticated;
      exception
   when dbms_ldap.init_failed then
        raise;
   when dbms_ldap.invalid_session then
      begin
        l_retval := dbms_ldap.unbind_s( l_session );
      exception when others then
        raise;
      end;
   when dbms_ldap.invalid_ssl_wallet_loc then
      l_retval := dbms_ldap.unbind_s( l_session );
      raise_application_error(-20001,'Invalid Wallet Location');
   when dbms_ldap.invalid_ssl_wallet_passwd then
      l_retval := dbms_ldap.unbind_s( l_session );
      raise_application_error(-20001,'Invalid Wallet Password');
   when dbms_ldap.invalid_search_scope then
      l_retval := dbms_ldap.unbind_s( l_session );
      raise_application_error(-20001,'Invalid Search Scope');
  when invalid_credentials then
     l_retval := dbms_ldap.unbind_s( l_session );
     authenticated := FALSE;
     return authenticated;
   when others then
      l_retval := dbms_ldap.unbind_s( l_session );
      raise;
       end;
       return authenticated;
END F$LDAP_NOVARTIS_NEW;
/

