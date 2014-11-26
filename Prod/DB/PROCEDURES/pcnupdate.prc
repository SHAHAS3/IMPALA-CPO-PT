create or replace procedure PCNUPDATE(p_capampid number) is
begin

for cx in (
             select id,startdate,weekday,pcn,status,pcnkey,assignedhoursperorde,numberofpeople,dsmui
             from   CAPAMPWEEK
             where  capamp_id = p_capampid
             and startdate is not null
                      )
            loop
              if (cx.pcnkey is null) then
                 populatepcnkey(cx.pcn,cx.startdate,cx.status,cx.dsmui);
              end if;
            
              if ( cx.status is null or cx.status = 'IN PROCESS' or cx.status = 'PLANNING' or cx.status = 'IN PROCESS'
                   or cx.status = 'ON TIME' or cx.status = 'DELAYED' or cx.status = 'LU2 DONE' or cx.status = 'LABELS RECEIVED'   ) then
                --set start date according to week day     
                --changing start date is only allowed in first week entry
                UPDATESTARTDATE(cx.id,cx.startdate,cx.weekday,cx.pcn,cx.pcnkey,cx.assignedhoursperorde,cx.numberofpeople);
                --update capampweek fields
                CAPAMPWEEKUPDATE(cx.id);
                --calculate week per hour
                if (F$PCNFIRSTWEEKYN(cx.id,cx.pcnkey) = 'Y') then
                   ASSGNWEEKHOURS(cx.id);  
                end if;   
                commit;
              end if;
               if (cx.status = 'CANCEL' or  cx.status = 'REJECTED' or cx.status = 'ON HOLD') then
                 for cy in (
                             select id,capamp_id
                             from CAPAMPWEEK
                             where pcnkey = cx.pcnkey
                            )
                  loop
                    update capampweek
                    set assignedhoursperorde = '',
                    numberofpeople = '',
                    assignedhoursperweek = '',
                    actualhoursperorder = '',
                    status = cx.status
                    where id = cy.id;
                    commit;
                    capampbilance(cy.capamp_id);
                  end loop;
              end if;
            end loop;     
end;
/

