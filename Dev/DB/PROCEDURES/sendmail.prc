create or replace procedure sendMail(iv2_recipient in varchar2,
                   iv2_subject   in varchar2, 
                   iv2_text      in varchar2, 
                   iv2_sendor    in varchar2 default 'impala@eu.novartis.net') is
   pcn_conn          utl_smtp.connection;
   pv2_mailServer    varchar2(30) := 'mail.novartis.com';
   pnu_Port          number       := 25;
   pv2_crlf          varchar2(2)  := CHR(13)||CHR(10);
   pv2_msg           varchar2(32000);
BEGIN
   pcn_conn := utl_smtp.open_connection(pv2_mailServer, pnu_port);
   utl_smtp.helo(pcn_conn, pv2_mailServer);
   utl_smtp.mail(pcn_conn, iv2_sendor);
   utl_smtp.rcpt(pcn_conn, iv2_recipient);   
   pv2_msg:= 'Date: '||TO_CHAR( SYSDATE, 'dd Mon yy hh24:mi:ss' )|| pv2_crlf ||'From: '||iv2_sendor|| pv2_crlf ||
          'Subject: '||iv2_subject|| pv2_crlf ||'To: '||iv2_recipient || pv2_crlf ||'' || pv2_crlf ||iv2_text||'';
   utl_smtp.data(pcn_conn, 'MIME-Version: 1.0' ||pv2_crlf||'Content-type: text/html'||pv2_crlf||pv2_msg);   
   utl_smtp.quit(pcn_conn);   
end sendMail;
/

