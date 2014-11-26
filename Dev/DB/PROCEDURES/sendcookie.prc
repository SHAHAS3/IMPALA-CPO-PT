create or replace procedure sendCookie(vname varchar2,vvalue varchar2) is
begin
   owa_util.mime_header('text/html', FALSE);
   owa_cookie.send(name => vname, value => vvalue, expires => sysdate + 5000);
   owa_util.http_header_close;
end;
/

