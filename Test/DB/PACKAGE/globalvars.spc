create or replace package GLOBALVARS
is

 GUSID     number;

 -- C. Geyer 01-Jul-2010 TQW 28458: added GUSERID
 GUSERID   varchar2(120);
 GUSER     varchar2(60);
 GROLE     varchar2(30);

end;
/

