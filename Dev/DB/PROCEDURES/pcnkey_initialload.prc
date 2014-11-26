CREATE OR REPLACE PROCEDURE PCNKEY_INITIALLOAD
IS
begin

for cx in (
     SELECT PCN,STARTDATE,STATUS,DSMUI
     FROM CAPAMPWEEK
     ORDER BY PCN,STARTDATE,STATUS
                      )
            loop  
                POPULATEPCNKEY(CX.PCN,CX.STARTDATE,CX.STATUS,CX.DSMUI);
            end loop;     
end;
/

