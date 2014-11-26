create or replace procedure doCalcWK(
p_capampid          number,
p_capampweekid      number
)
is

vcapamp_id                   number := p_capampid;
vcapampweek_id               number := p_capampweekid;

vpcn                         varchar2(50);
vdescription                 varchar2(100);
vstatus                      varchar2(100);

vcpodatelabelling            date;
vstartdate                   date;
venddate                     date;

vmpweek                      number;
vmpyear                      number;
vnumberofbatches             number;
vfillcounts                  number;
vnumberofpeople              number;
vactualhoursperorder         number;
vweekdaynumber               number;
vdaysleft                    number;
vhoursleft                   number;
vcount                       number;
vweekhours                   number;
vhours                       number;
vweek                        number;
vyear                        number;
vweekcount                   number;
vorderscount                 number;
vvcapamp_id                  number;
vvcapampweek_id              number;
vhoursperweek                number;
vweeksperyear                number;
vassignedhoursperorde        number;
vassignedhoursperweek        number;
vnumberofclinicopialabels    number;
vnumberofclintracklabels     number;
vnumberofseallabels          number;

begin

-- CAPAMPBILANCE
update CAPAMP 
set    assignedhours = sumhours( vcapamp_id ) 
where  id = vcapamp_id;

update CAPAMP 
set    percentused = round( sumhours( vcapamp_id )*100 / hoursavailable,2 ) 
where  id = vcapamp_id;

commit;

-- ASSGNWEEKHOURS
select capamp_id,                 pcn,                        description,
       cpodatelabelling,          assignedhoursperorde,       assignedhoursperweek, 
       numberofclinicopialabels,  numberofclintraklabels,     numberofseallabels,
       status,                    startdate,                  enddate,
       numberofbatches,           fillcounts,                 numberofpeople,
       actualhoursperorder
into   vcapamp_id,                vpcn,                       vdescription,
       vcpodatelabelling,         vassignedhoursperorde,      vassignedhoursperweek, 
       vnumberofclinicopialabels, vnumberofclintracklabels,   vnumberofseallabels,
       vstatus,                   vstartdate,                 venddate,
       vnumberofbatches,          vfillcounts,                vnumberofpeople,
       vactualhoursperorder
from   CAPAMPWEEK
where  id = vcapampweek_id;

select mpweek,  mpyear
into   vmpweek, vmpyear 
from   CAPAMP
where  id = vcapamp_id;

select to_number( to_char( vstartdate,'D' ) ) 
into   vweekdaynumber
from   DUAL;
  
vdaysleft    := 7 - vweekdaynumber;
vhoursleft   := vdaysleft * 7 * vnumberofpeople;

if vhoursleft > vassignedhoursperorde then -- assign vassignehourseperorder
   update CAPAMPWEEK
   set    assignedhoursperweek = vassignedhoursperorde
   where  id = vcapampweek_id;
      
   commit;
   return;
else                                       --  assign vhoursleft
   update CAPAMPWEEK
   set    assignedhoursperweek = vhoursleft
   where  id = vcapampweek_id;
      
   commit;
end if;

vhoursleft := vassignedhoursperorde - vhoursleft;
vweekhours := vnumberofpeople * 7 * 5;
vweek      := vmpweek;
vyear      := vmpyear;


while vhoursleft > 0
loop
     if vweekhours > vhoursleft then -- insert or update with vhoursleft
        vhoursperweek := vhoursleft;
     else                            -- insert or update with vweekhours
        vhoursperweek := vweekhours;
     end if;

     insert into CHECKTRANS(
     trans )
     values(
     vweekdaynumber );
     
     commit;
    
     -- evaluate whether year has 52 or 53 weeks
     if has52or53( vyear ) ='YES' then
        vweeksperyear := 53;
     else
        vweeksperyear := 52;
     end if;

     -- evaluate week and year
     IF vweek = vweeksperyear then
        vweek := 1;
        vyear := vyear + 1;
     else
        vweek := vweek +1;
     end if;

     -- check whether week record already exists
     select count(*)
     into   vweekcount
     from   CAPAMP
     where  mpweek = vweek
       and  mpyear = vyear;

     -- when week record already exist, no record has to be added
     if vweekcount > 0 then -- week record exists already
                            -- check whether order record exists already
        select id
        into   vvcapamp_id
        from   CAPAMP
        where  mpweek = vweek
          and  mpyear = vyear;

        select count(*)
        into   vorderscount
        from   CAPAMPWEEK
        where  pcn = vpcn
          and  capamp_id = vvcapamp_id;

        if vorderscount > 0 then -- order record exists
                                 -- update
           update CAPAMPWEEK
           set    assignedhoursperweek = vhoursperweek
           where  pcn = vpcn
             and  capamp_id = vvcapamp_id;
        
           commit;
        else                     -- order record does not exist
                                 -- insert
           select idseq.nextval
           into   vvcapampweek_id
           from   DUAL;

           insert into CAPAMPWEEK(
           id,                     capamp_id,            pcn,
           description,            cpodatelabelling,     assignedhoursperorde,
           assignedhoursperweek,   status,               startdate,
           enddate,                numberofbatches,      fillcounts,
           numberofpeople,         actualhoursperorder )
           values(
           vvcapampweek_id,        vvcapamp_id,          vpcn,
           vdescription,           vcpodatelabelling,    vassignedhoursperorde,
           vassignedhoursperweek,  vstatus,              vstartdate,
           venddate,               vnumberofbatches,     vfillcounts,
           vnumberofpeople,        vactualhoursperorder );
          
           commit;
        end if;
     else                        -- week record does not exist, insert week
        select idseq.nextval
        into   vvcapamp_id
        from   DUAL;

        select idseq.nextval
        into   vvcapampweek_id 
        from   DUAL;

        -- insert week record
        insert into CAPAMP(
        id, mpweek, mpyear )
        values(
        vvcapamp_id, vweek, vyear );

        -- insert order record
        insert into CAPAMPWEEK(
        id,                     capamp_id,            pcn,
        description,            cpodatelabelling,     assignedhoursperorde,
        assignedhoursperweek,   status,               startdate,
        enddate,                numberofbatches,      fillcounts,
        numberofpeople,         actualhoursperorder )
        values(
        vvcapampweek_id,        vvcapamp_id,          vpcn,
        vdescription,           vcpodatelabelling,    vassignedhoursperorde,
        vassignedhoursperweek,  vstatus,              vstartdate,
        venddate,               vnumberofbatches,     vfillcounts,
        vnumberofpeople,        vactualhoursperorder );
        
        commit;
     end if;

     vhoursleft := vhoursleft - vhoursperweek;
end loop;

end;
/

