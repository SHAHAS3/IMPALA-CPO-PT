CREATE OR REPLACE PACKAGE PKG$ACT
IS

PROCEDURE   P$GETLABELID (-- ---------------------------------------------------
   p_date_from     in DATE,
   p_creator       in VARCHAR2,
   p_label_id      in VARCHAR2,
   p_project_code  in VARCHAR2,
   p_study_code    in VARCHAR2,
   p_itemcheck     in VARCHAR2,
   p_actuserid     in VARCHAR2
);

PROCEDURE   P$SETACTRESULT (-- ---------------------------------------------------
   p_actuserid     in VARCHAR2
);

FUNCTION F$CHECKITEM(-- ---------------------------------------------------
p_type          in varchar2,
p_actuserid     in varchar2
) 
return varchar2;

FUNCTION F$GETCLIN( -- ---------------------------------------------------
p_type          in varchar2,
p_clintype      in varchar2,
p_label_id      in varchar2,
p_actuserid     in varchar2
) 
return varchar2;

FUNCTION F$GETCPR(-- ---------------------------------------------------
p_type              in varchar2,
p_primarypackid     in number
) 
return varchar2;

FUNCTION F$GetLabelID(-- ---------------------------------------------------
p_primarypackid    in varchar2,
p_created_on       in date
)
return varchar2;

FUNCTION F$GETMAXJNDATETIME
(
p_label_id varchar2,
p_date date
)
return date;

FUNCTION F$MATCHING(
p_type         in varchar2,
p_field        in varchar2,
p_cprvalue     in varchar2,
p_labelid      in varchar2,
p_clinvalue    in varchar2
) 
return varchar2;

FUNCTION F$MATCHINGDS(
p_type        in varchar2,
p_field       in varchar2,
p_cprvalue     in varchar2,
p_labelid     in varchar2,
p_clinvalue    in varchar2
) 
return varchar2;

FUNCTION F$GETOCCURRENCE(
p_type          in varchar2,
p_actuserid     in varchar2,
p_cprvalue      in varchar2,
p_labelid       in varchar2
) 
return number;

FUNCTION F$GETOCCURRENCEDS(
p_type          in varchar2,
p_actuserid     in varchar2,
p_cprvalue      in varchar2,
p_labelid       in varchar2
) 
return number;

FUNCTION F$GETDOSAGESTRENGTH(
p_actuserid     in varchar2,
p_label_id      in varchar2
) 
return varchar2;

FUNCTION F$GETWARNING(
p_type              in varchar2,
p_actuserid         in varchar2,
p_labelid           in varchar2,
p_itemoccurrence    in number,
p_labeldescription  in varchar2,
p_cprvalue          in varchar2
) 
return varchar2;

FUNCTION F$GETADDLABELPARAMCLINTYPE(
p_placeholder_data      in varchar2,
p_object_name           in varchar2,
p_description           in varchar2
) 
return varchar2;

FUNCTION F$GETADDLABELPARAMPLACEHOLDER(
p_cprvalue            in varchar2,
p_clinvalue           in varchar2
) 
return varchar2;

FUNCTION F$GETADDLABELPARAMOCCURENCE(
p_actuserid    in varchar2,
p_labelid      in varchar2,
p_clinvalue    in varchar2
) 
return number;

FUNCTION   P$PLACEBODS (-- ---------------------------------------------------
   p_cprvalue      in VARCHAR2,
   p_sequence      in NUMBER,
   p_dosagestrength1 in VARCHAR2   
)
return varchar2;


END;
/

create or replace package body PKG$ACT
is


-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
FUNCTION   P$PLACEBODS (-- ---------------------------------------------------
   p_cprvalue        in VARCHAR2,
   p_sequence        in NUMBER,
   p_dosagestrength1 in VARCHAR2
)
return varchar2
is
v_result varchar2(100);
v_cprvalue varchar2(100);
v_sequence number;
begin

v_cprvalue:= p_cprvalue;
v_sequence := p_sequence;

  if (instr(v_cprvalue,'/',1,v_sequence) > 0) then
    v_result  := substr(v_cprvalue,instr(v_cprvalue,'/',1,v_sequence-1)+1,(instr(v_cprvalue,'/',1,v_sequence)-instr(v_cprvalue,'/',1,v_sequence-1)-1));
  else
    if ( instr(v_cprvalue,'/',1,v_sequence-1) = 0 ) then
      v_result:= p_dosagestrength1;
    else  
      v_result := substr(v_cprvalue,instr(v_cprvalue,'/',1,v_sequence-1)+1);
    end if; 
  end if;
  
  if (upper(v_result) in ( '0MG/G','0MG')) then
    v_result:= 'PLACEBO';
  end if;
  
return (v_result);

end;


-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
PROCEDURE   P$GETLABELID ( 
   p_date_from     IN DATE,
   p_creator       IN VARCHAR2,
   p_label_id      IN VARCHAR2,
   p_project_code  IN VARCHAR2,
   p_study_code    IN VARCHAR2,
   p_itemcheck     IN VARCHAR2,
   p_actuserid     IN VARCHAR2
)
IS
/*
  Created By : R.Priester
  Created on : 12-JUL-2011
  Purpose    :  Automated Check Tool
                Checking ecpr data into Clinicopia */   
   v_cod_id_prim         date;
   v_label_description   varchar2(80);
   v_count               number;
   
BEGIN
for c1 in (
          
          --ACT identifier saved in a FTPH
          select distinct(a.label_id) , a.placeholder_data
          from freetext_ph a
          where (upper(label_id) = upper(p_label_id) or p_label_id is null)
          and upper(label_id) in 
             (select distinct(upper(j.label_id)) from freetext_ph_jn j
                where j.jn_datetime > p_date_from 
                and j.label_id = a.label_id
                and j.version_no = a.version_no 
                and j.placeholder_id = a.placeholder_id
                and (j.jn_oracle_user =p_creator or p_creator is null)
                and j.jn_operation  = 'INS')
          )
loop
                               
               for c2 in (
                               --loop through cpr to find IDs matching to ACT identifier
                               select id from ecpr.primarypack
                               where cpr_id 
                               in (select id from ecpr.cpr where status = 'ACTIVE' and (protocolnumber = p_study_code or p_study_code is null ))
                               and (projectcode  = p_project_code or p_project_code is null)
                               order by id desc
                           )
                      loop
                          
                          if (instr(c1.placeholder_data,c2.id)>0) then      
                          
                             select description
                             into v_label_description
                             from label_artworks
                             where label_id =c1.label_id
                             and rownum = 1;
                             
                             --select count(*)
                             --into v_count 
                             --from actmapping
                             --where (actuserid = p_actuserid and labelid = c1.label_id);
                             
                             --if (v_count = 0) then
                               --populate ACT mapping table
                               --Field identifier contains concatenation of 
                               --one or several PRIMARYPACKID
                               insert into ACTMAPPING(ACTUSERID,PRIMARYPACKID,LABELID,IDENTIFIER,ITEMCHECK,LABELDESCRIPTION)
                               values (p_actuserid,c2.id,c1.label_id,c1.placeholder_data,p_itemcheck,v_label_description);commit;
                               continue;
                             --end if;  
                          end if;
                          --insert into ACTMAPPING values (1,c1.label_id||'PP ID'||c2.id);commit;
                          continue;
                     end loop;         
end loop;

END ; 

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
PROCEDURE   P$SETACTRESULT (
   p_actuserid     in VARCHAR2
)
IS
   v_count               number;
   v_label_description   varchar2(100);
BEGIN


insert into actresult(ACTTYPE,CLINTYPE,ACTUSERID,PRIMARYPACKID,LABELID,
                      CPRID,IDENTIFIER,CPRVALUE,PLACEHOLDER_ID,
                      ITEMCHECK,
                      ITEMOCCURRENCE,
                      LABELDESCRIPTION,WARNING)
               select CPRITEM,'FTPH',ACTUSERID,PRIMARYPACKID,LABELID,
                      ECPRID,IDENTIFIER,CPRVALUE,
                      PKG$ACT.F$MATCHING('FTPH',cpritem,cprvalue,LABELID,''),
                      ITEMCHECK,
                      PKG$ACT.F$GETOCCURRENCE('FTPH',ACTUSERID,cprvalue,LABELID),
                      LABELDESCRIPTION,null
                      from actecpr 
                      where actuserid = p_actuserid
                      and cpritem in ('STUDYCODE','PROJECTCODE','NUMBERPERUNIT');
                      
insert into actresult(ACTTYPE,CLINTYPE,ACTUSERID,PRIMARYPACKID,LABELID,
                      CPRID,IDENTIFIER,CPRVALUE,PLACEHOLDER_ID,
                      ITEMCHECK,
                      ITEMOCCURRENCE,
                      LABELDESCRIPTION,WARNING)
               select CPRITEM,'FTPH',ACTUSERID,PRIMARYPACKID,LABELID,
                      ECPRID,IDENTIFIER,CPRVALUE,
                      PKG$ACT.F$MATCHINGDS('FTPH',cpritem,cprvalue,LABELID,''),
                      ITEMCHECK,
                      PKG$ACT.F$GETOCCURRENCEDS('FTPH',ACTUSERID,cprvalue,LABELID),
                      LABELDESCRIPTION,null
                      from actecpr 
                      where actuserid = p_actuserid
                      and cpritem ='DOSAGESTRENGTH';    
                      
insert into actresult(ACTTYPE,CLINTYPE,ACTUSERID,PRIMARYPACKID,LABELID,
                      CPRID,IDENTIFIER,CPRVALUE,PLACEHOLDER_ID,
                      ITEMCHECK,
                      ITEMOCCURRENCE,
                      LABELDESCRIPTION,WARNING)
               select CPRITEM,'VPH',ACTUSERID,PRIMARYPACKID,LABELID,
                      ECPRID,IDENTIFIER,CPRVALUE,
                      PKG$ACT.F$MATCHINGDS('VPH',cpritem,cprvalue,LABELID,''),
                      ITEMCHECK,
                      PKG$ACT.F$GETOCCURRENCEDS('VPH',ACTUSERID,cprvalue,LABELID),
                      LABELDESCRIPTION,null
                      from actecpr 
                      where actuserid = p_actuserid
                      and cpritem ='DOSAGESTRENGTH';  
                      
insert into actresult(ACTTYPE,CLINTYPE,
                      ACTUSERID,PRIMARYPACKID,LABELID,
                      CPRID,IDENTIFIER,CPRVALUE,CLINADDLABELPARAM,
                      PLACEHOLDER_ID,
                      ITEMCHECK,
                      ITEMOCCURRENCE,
                      LABELDESCRIPTION,WARNING)
               select e.CPRITEM,PKG$ACT.F$GETADDLABELPARAMCLINTYPE(c.placeholder_data,c.object_name,c.description),
                      e.ACTUSERID,e.PRIMARYPACKID,e.LABELID,
                      e.ECPRID,e.IDENTIFIER,e.CPRVALUE,
                      NVL(c.placeholder_data,NVL(c.object_name,c.description)),
                      PKG$ACT.F$GETADDLABELPARAMPLACEHOLDER(e.CPRVALUE,NVL(c.placeholder_data,NVL(c.object_name,c.description))),
                      e.ITEMCHECK,
                      PKG$ACT.F$GETADDLABELPARAMOCCURENCE(e.ACTUSERID,e.LABELID,NVL(c.placeholder_data,NVL(c.object_name,c.description))),
                      e.LABELDESCRIPTION,null
                      from actecpr e, actclinlabelparam c
                      where e.actuserid = p_actuserid
                      and e.cpritem ='ADDLABELPARAM'
                      and e.actuserid = c.actuserid
                      and e.labelid  = c.labelid;                     
                                         

commit;

END;

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
FUNCTION F$GETADDLABELPARAMCLINTYPE(
p_placeholder_data     in varchar2,
p_object_name          in varchar2,
p_description           in varchar2
) 
return varchar2
is


v_result varchar2(10);

begin

if (p_placeholder_data is not null ) then
  v_result := 'FTPH';
elsif (p_object_name is not null) then
  v_result := 'OBJ';
else
  v_result := 'VPH';
end if;  

return (v_result);

end;


FUNCTION Isnumber(p_num VARCHAR2) RETURN NUMBER 
AS
 a NUMBER;
BEGIN
 a := p_num;
 RETURN 1;
EXCEPTION WHEN OTHERS THEN
 RETURN 0;
END;

FUNCTION Setuprange(
p_clinvalue VARCHAR2,
p_addlabelparam VARCHAR2
) 
RETURN VARCHAR2 
IS
 v_startrange NUMBER := 0;
 v_endrange   NUMBER := 0;
 v_singleclinvalue VARCHAR2(100) := p_clinvalue ;
 v_clinaddlabelparam  VARCHAR2(100) := p_addlabelparam;
 v_tempvalue VARCHAR2(100):= '' ;
BEGIN

if (instr(v_singleclinvalue,'-')> 0 and v_clinaddlabelparam is not null) then
  v_singleclinvalue := replace(v_singleclinvalue,v_clinaddlabelparam,'');
  v_tempvalue:=substr(v_singleclinvalue,instr(v_singleclinvalue,'-')+1,length(v_singleclinvalue));
  if  Isnumber(v_tempvalue) = 1 then
     v_endrange := v_tempvalue;
  end if;
  v_tempvalue:=substr(v_singleclinvalue,1,instr(v_singleclinvalue,'-')-1);
  if  Isnumber(v_tempvalue) = 1 then
    v_startrange := v_tempvalue;
  end if;
  if (v_startrange >0 and v_endrange >0 and v_startrange < v_endrange) then 
     v_singleclinvalue := '';
     FOR Lcntr IN v_startrange..v_endrange
     LOOP
       v_singleclinvalue := v_singleclinvalue||v_clinaddlabelparam||Lcntr||'/';
     END LOOP;
   end if;
end if;   

 RETURN v_singleclinvalue;
EXCEPTION WHEN OTHERS THEN
 RETURN v_singleclinvalue;
END;





-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
FUNCTION F$GETADDLABELPARAMPLACEHOLDER(
p_cprvalue          in varchar2,
p_clinvalue           in varchar2
) 
return varchar2
is


v_result varchar2(1):='';
v_clinvalue varchar2(200):=p_clinvalue;
v_cprvalue varchar2(200):=p_cprvalue;
v_singlecprvalue varchar2(200);
v_singleclinvalue varchar2(200);
v_tempvalue varchar2(200);
v_clinaddlabelparam  varchar2(50):= ''; -- Day1-15/16-29/30-44
v_range varchar2(1);


begin

v_cprvalue := upper(replace(v_cprvalue,' ',null));
v_clinvalue := upper(replace(v_clinvalue,' ',null));
v_range := 'N';

--in Clinicopia values can be entered as Day1-15/16-29/30-44
--replace with Day1-15/Day16-29/Day30-44 for comparing with ecpr values
if (instr(v_clinvalue,'DAY')>0 and v_clinaddlabelparam is null) then
  v_clinaddlabelparam := 'DAY';
end if;
if (instr(v_clinvalue,'VISIT')>0 and v_clinaddlabelparam is null) then
  v_clinaddlabelparam := 'VISIT';
end if;
if (instr(v_clinvalue,'PERIOD')>0 and v_clinaddlabelparam is null) then
  v_clinaddlabelparam := 'PERIOD';
end if;
if (instr(v_clinvalue,'BOTTLE')>0 and v_clinaddlabelparam is null) then
  v_clinaddlabelparam := 'BOTTLE';
end if;
if (instr(v_clinvalue,'INHALER')>0 and v_clinaddlabelparam is null) then
  v_clinaddlabelparam := 'INHALER';
end if;
if (instr(v_clinvalue,'AREA')>0 and v_clinaddlabelparam is null) then
  v_clinaddlabelparam := 'AREA';
end if;
if (instr(v_clinvalue,'PERIOD')>0 and v_clinaddlabelparam is null) then
  v_clinaddlabelparam := 'PERIOD';
end if;
if (instr(v_clinvalue,'STRATUM')>0 and v_clinaddlabelparam is null) then
  v_clinaddlabelparam := 'STRATUM';
end if;
if (instr(v_clinvalue,'FOR TRAINING')>0 and v_clinaddlabelparam is null) then
  v_clinaddlabelparam := 'FOR TRAINING';
end if;


if (instr(v_clinvalue,'/') = 0 and instr(v_clinvalue,'-') = 0) then

  if (instr(v_cprvalue,':') = 0) then
    --if (instr(v_clinvalue,v_cprvalue) > 0 ) then 
    if (v_clinvalue = v_cprvalue ) then 
      v_result := 'Y';
    else
      v_result:= 'N';
    end if;
  else
   if (v_cprvalue is not null and instr(v_cprvalue,':') > 0 ) then
    while ( instr(v_cprvalue,':') > 0  )  loop 
      select substr(v_cprvalue,1,instr(v_cprvalue,':')-1)  into v_singlecprvalue from dual;
      --if (instr(v_clinvalue,v_singlecprvalue) > 0 ) then 
      if (v_clinvalue = v_singlecprvalue ) then 
        v_result := 'Y';
        exit;
      end if;
      v_cprvalue := substr(v_cprvalue,instr(v_cprvalue,':')+1);
      v_cprvalue := upper(replace(v_cprvalue,' ',null));
    
     end loop;
  end if;

  if (v_cprvalue is not null and instr(v_cprvalue,':') = 0 ) then
      --if (instr(v_clinvalue,v_cprvalue) > 0 ) then 
      if (v_clinvalue = v_cprvalue ) then 
        v_result := 'Y';
      end if;
  end if;
 end if;  
  
else 

   if substr(v_clinvalue,1,1) = '/' then
      select substr(v_clinvalue,2) into v_clinvalue from dual;
   end if;

  --------------------------------------------------
  --loop through all clinicopia values '/' separated
  -------------------------------------------------  
    if (v_clinvalue is not null and (instr(v_clinvalue,'/') > 0 or instr(v_clinvalue,'-') > 0) ) then   
        -- check if last value is a range
        v_tempvalue:=substr(v_clinvalue,instr(v_clinvalue,'-',-1)+1);
        if (instr (v_tempvalue,'/')=0 and  v_clinaddlabelparam is not null and Isnumber(v_tempvalue)=1) then
          v_clinvalue:=v_clinvalue||'/'||v_clinaddlabelparam||v_tempvalue;
        end if;
        --
        while ( instr(v_clinvalue,'/') > 0  )  loop 
          v_clinvalue := upper(replace(v_clinvalue,' ',null));
          select substr(v_clinvalue,1,instr(v_clinvalue,'/')-1)  into v_singleclinvalue from dual;
          -------------------------
          --set up range values
          -------------------------
          if (instr(v_singleclinvalue,'-')> 0 and v_clinaddlabelparam is not null) then
            v_tempvalue:= Setuprange(v_singleclinvalue,v_clinaddlabelparam);
            if (v_singleclinvalue != v_tempvalue) then
               v_singleclinvalue := v_tempvalue;
               v_range := 'Y';
            end if;
          end if;
          if (v_clinaddlabelparam is not null and v_range = 'N') then
            if (instr(v_singleclinvalue,v_clinaddlabelparam)=0) then
               v_singleclinvalue := v_clinaddlabelparam||v_singleclinvalue;
            end if;   
          end if;
          if (instr(v_cprvalue,':') = 0 and v_range = 'N') then
            v_result:= 'N';
            return 'N'; ---------
          else
             if (v_cprvalue is not null and instr(v_cprvalue,':') > 0 and v_range = 'N') then
                ---------------------------------------------
                --loop through all ecpr values ':' separated
                ---------------------------------------------
                 while ( instr(v_cprvalue,':') > 0  )  loop 
                    select substr(v_cprvalue,1,instr(v_cprvalue,':')-1)  into v_singlecprvalue from dual;
                    v_cprvalue := upper(replace(v_cprvalue,' ',null));            
                    --if (instr(v_singleclinvalue,v_singlecprvalue) > 0 ) then 
                    if (v_singleclinvalue = v_singlecprvalue ) then 
                      v_result := 'Y';
                      exit;
                    else
                      v_result :='N';
                    end if;   
                    v_cprvalue := substr(v_cprvalue,instr(v_cprvalue,':')+1);
                    v_cprvalue := upper(replace(v_cprvalue,' ',null));
                end loop;
                ---------------------------------------------
                --end loop ecpr 
                ---------------------------------------------         
             end if;
             ---------------------------------------------
             --last ecpr 
             ---------------------------------------------   
             if (v_cprvalue is not null and instr(v_cprvalue,':') = 0 and (v_result != 'Y' or v_result is null)and v_range = 'N') then
                --if (instr(v_singleclinvalue,v_cprvalue) > 0 ) then 
                if (v_singleclinvalue=v_cprvalue ) then 
                  v_result := 'Y';
                  exit;              
                else
                  v_result := 'N';
             end if;
           end if;
           --v_cprvalue := substr(v_cprvalue,instr(v_cprvalue,':')+1);
           v_cprvalue := upper(replace(v_cprvalue,' ',null));
       end if;  
       if (v_result = 'N' and v_range = 'N') then
         return('N');
       end if;
       if ( v_range = 'N') then
         v_clinvalue := substr(v_clinvalue,instr(v_clinvalue,'/')+1);
       else
         v_clinvalue := substr(v_clinvalue,instr(v_clinvalue,'/')+1)||'/'||v_singleclinvalue; 
         v_range := 'N';
       end if;
       v_clinvalue := upper(replace(v_clinvalue,' ',null));
       v_cprvalue := upper(replace(p_cprvalue,' ',null));
    end loop;
    ---------------------------------------------
    --end loop clin
    ---------------------------------------------      
   end if;
   ---------------------------------------------
   --last clin value
   ---------------------------------------------       
    if (v_clinvalue is not null and instr(v_clinvalue,'/') = 0  ) then
       if (instr(v_cprvalue,':') = 0) then
            v_result:= 'N';
        else
          if (v_clinaddlabelparam is not null) then
            if (instr(v_singleclinvalue,v_clinaddlabelparam)=0) then
              v_singleclinvalue := v_clinaddlabelparam||v_singleclinvalue;
            end if;   
          end if;
          if (v_cprvalue is not null and instr(v_cprvalue,':') > 0  ) then
            ---------------------
            --start loop ecpr / last clin value
            --------------------
            while ( instr(v_cprvalue,':') > 0  )  loop 
              select substr(v_cprvalue,1,instr(v_cprvalue,':')-1) into v_singlecprvalue from dual;   
              v_clinvalue := upper(replace(v_clinvalue,' ',null));
              --if (instr(v_clinvalue,v_singlecprvalue) > 0 ) then 
              if (v_clinvalue = v_singlecprvalue ) then 
                v_result := 'Y';
                exit;
              else
                v_result := 'N';-----------------------
              end if;
              v_cprvalue := substr(v_cprvalue,instr(v_cprvalue,':')+1);
              v_cprvalue := upper(replace(v_cprvalue,' ',null));
           end loop;
            ---------------------
            --end loop ecpr / last clin value
            --------------------           
          end if;
          ---------
          --last ecpr value / last clin value
          ---------
          if (v_cprvalue is not null and instr(v_cprvalue,':') = 0 and (v_result != 'Y' or v_result is null)) then
            --if (instr(v_clinvalue,v_cprvalue) > 0 ) then 
            if (v_clinvalue = v_cprvalue ) then 
              v_result := 'Y';
            else   
              v_result := 'N';    
            end if;
          end if;
         end if;  
       end if;    
end if;

return (v_result);

end;

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
FUNCTION F$GETADDLABELPARAMOCCURENCE(
p_actuserid     in varchar2,
p_labelid      in varchar2,
p_clinvalue    in varchar2
) 
return number
is


v_count  number;

begin

select count(*)
into v_count 
from actclinlabelparam
where actuserid = p_actuserid
and labelid = p_labelid
and ( placeholder_data = p_clinvalue or
object_name = p_clinvalue or
description = p_clinvalue );


return (v_count);

end;


-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
FUNCTION F$CHECKITEM(
p_type     in varchar2,
p_actuserid     in varchar2
) 
return varchar2
is

v_count number;
v_result varchar2(1);

begin

   select instr(itemcheck,p_type)
   into v_count
   from actecpr
   where actuserid = p_actuserid
   and rownum = 1;



if (v_count > 0) then
  v_result := 'Y';
else
  v_result := 'N';
end if;

return (v_result);

end;



-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
FUNCTION F$GETCLIN(
p_type     in varchar2,
p_clintype in varchar2,
p_label_id     in varchar2,
p_actuserid     in varchar2
) 
return varchar2
is

v_result varchar2(4000):='';
v_acttype varchar2(200):='';

begin

if (p_type = 'MISMATCH') then

--clinicopia data not mapped
for cx in (

  select   distinct(placeholder_data )
  from actlabelplaceholders
  where labelid = p_label_id
  and instr(placeholder_data, '___') =0
  and clintype = 'FTPH'
  and actuserid = p_actuserid
  and placeholder_data not in (select identifier from actresult where  labelid = p_label_id and actuserid = p_actuserid)  
  and placeholder_data not in (select NVL(clinaddlabelparam,'XXXXXX') from actresult where  labelid = p_label_id and actuserid = p_actuserid )
  union
  select   distinct(placeholder_data )
  from actlabelplaceholders
  where labelid = p_label_id
  and instr(placeholder_data, '___') =0
  and clintype = 'FTPH'
  and actuserid = p_actuserid
  and placeholder_data not in (select identifier from actresult where  labelid = p_label_id and actuserid = p_actuserid)  
  and placeholder_data  in (select NVL(clinaddlabelparam,'XXXXXX') from actresult where  labelid = p_label_id and actuserid = p_actuserid and placeholder_id = 'N' or placeholder_id is null)
  minus
  select distinct(placeholder_data)
  from actlabelplaceholders
  where ftph_id in (select placeholder_id from actresult where labelid = p_label_id and clintype = 'FTPH'   and actuserid = p_actuserid )
  and labelid = p_label_id
  and instr(placeholder_data, '___') =0
  and clintype = 'FTPH'
  and actuserid = p_actuserid
          )
   loop
     if (v_result is null) then
        v_result:=cx.placeholder_data;
     else
        v_result:=v_result||' ; '||cx.placeholder_data;
     end if;
  end loop;  
 
for cy in (

  select distinct(description )
  from actlabelplaceholders
  where labelid = p_label_id
  and clintype = 'VPH' 
  and instr(description, '___') =0
  and description not in  (select identifier from actresult where  labelid = p_label_id)
  minus
  select distinct(description)
  from actlabelplaceholders
  where vph_id in (select placeholder_id from actresult where labelid = p_label_id and clintype = 'VPH'   and actuserid = p_actuserid )
  and labelid = p_label_id
  and instr(description, '___') =0
  and clintype = 'VPH'
  and actuserid = p_actuserid
          )
   loop
     if (v_result is null) then
        v_result:=cy.description;
     else
        if (instr(v_result,cy.description) = 0 or instr(v_result,cy.description) is null) then
          v_result:=v_result||' ; '||cy.description;
        end if;  
     end if;
  end loop; 

end if;

if (p_type = 'ITEM') then

v_result := 'Mismatch for ';

for cx in (

   select distinct(acttype)
   from actresult 
   where  labelid = p_label_id
   and actuserid = p_actuserid
   and placeholder_id = 'N'  
   AND instr(itemcheck,acttype) >0
   and acttype not in (select acttype from actresult where placeholder_id != 'N' and labelid = p_label_id and actuserid = p_actuserid )
   --and ( acttype not in (select acttype from actftph where placeholder_id != 'N'and labelid = p_label_id  ))
   and acttype != 'ADDLABELPARAM'
   union 
   select acttype
   from actresult 
   where  labelid = p_label_id      
   and (placeholder_id = 'N' or placeholder_id is null)
   and acttype = 'ADDLABELPARAM'
   and actuserid = p_actuserid
   
   --and acttype not in (select acttype from actftph where cprvalue is null )
   )          
   loop

   
     select decode(cx.acttype,'DOSAGESTRENGTH','Dosage Strength',
                              'STUDYCODE' , 'Study Code',
                              'PROJECTCODE','Drug Product Name',
                              'DOSAGESTRENGTH','Dosage Strength',
                              'DOSAGEFORM','Dosage Form',
                              'ROUTE OF ADMINISTRATION','Route of Administration',
                              'NUMBERPERUNIT','Number per Unit',
                              'ADDLABELPARAM','Add. Label Param.',cx.acttype) into v_acttype from dual;
     if (v_result = 'Mismatch for ') then
        v_result:=  'Mismatch for ' || v_acttype ;
     else
        v_result:=v_result||' ; '|| v_acttype;
     end if;   


  end loop;  

end if;


if (p_type = 'DATA') then


for cx in (

   select distinct(cprvalue) 
   from actresult 
   where  labelid = p_label_id
   and placeholder_id = 'N'
   and instr(clintype, p_clintype)>0      
   )
          
   loop
   
     if (v_result is null) then
        v_result:=cx.cprvalue;
     else
        v_result:=v_result||' ; '||cx.cprvalue;
     end if;   


  end loop;  

end if;

return (v_result);

end;

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
FUNCTION l_get_numberperunit(
p_stream varchar2
)
return varchar2
is
v_indice        number;
v_result varchar2(1000);

begin

  select instr(p_stream,'PC') 
  into v_indice
  from dual;
  
  if (v_indice > 0) then
    select substr(p_stream,1,v_indice-1) 
    into v_result
    from dual;

    select instr(v_result,' ',-1) 
    into v_indice
    from dual;

    select substr(v_result,v_indice+1,length(v_result)) 
    into v_result
    from dual;
  else
    v_result:='';  
  end if;
  if  (v_result is null) then
  
  select instr(p_stream,'ST') 
  into v_indice
  from dual;
  
  if (v_indice > 0) then
    select substr(p_stream,1,v_indice-1) 
    into v_result
    from dual;

    select instr(v_result,' ',-1) 
    into v_indice
    from dual;

    select substr(v_result,v_indice+1,length(v_result)) 
    into v_result
    from dual;
  else
    v_result:='';  
  end if;  
  
  end if;
  
return v_result;

end;

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
FUNCTION F$GETCPR(
p_type     in varchar2,
p_primarypackid     in number
) 
return varchar2
is

v_result        varchar2(2000);
v_count         number;
v_identifier    varchar2(1000);
v_primarypackid varchar2(200);
v_tmpresult     varchar2(2000);
v_primary_y_n   varchar2(1);
v_open          varchar2(500);


begin

if (p_type = 'STUDYCODE') then

  select protocolnumber 
  into v_result 
  from ecpr.cpr
  where id = 
   (select cpr_id from ecpr.primarypack where id = p_primarypackid);


end if;

if (p_type in ('PROJECTCODE','DOSAGESTRENGTH','ADDLABELPARAM')) then
--projectcode extracted from 1st part of label description at Packaging design master
--dosage strength extracted from 1st part of label description at Packaging design master
--add label param specific field in ecpr

  select count(*) 
  into v_count
  from ecpr.designtable
  where (instr(studymed_id,p_primarypackid)>0 or instr(p_primarypackid,studymed_id)>0)
  and rownum = 1;
  
  

  if (v_count > 0 ) then
    CASE  p_type
    WHEN 'PROJECTCODE' THEN 
      select NVL(substr(label_desc,1,instr(label_desc,' ')),label_desc)
      into v_result
      from ecpr.designtable
      where instr(studymed_id,p_primarypackid)>0
      and rownum = 1;

    WHEN 'DOSAGESTRENGTH' THEN     
      select NVL(substr(label_desc,instr(label_desc,' ')+1),label_desc)
      into v_result
      from ecpr.designtable
      where (instr(studymed_id,p_primarypackid)>0
      or instr(p_primarypackid,studymed_id)>0)
      and rownum = 1;       
    WHEN 'ADDLABELPARAM' THEN 
      select addlabelparam
      into v_result
      from ecpr.designtable
      where instr(studymed_id,p_primarypackid)>0
      and rownum = 1;  
    ELSE v_result:= '';
    END case;
  end if;

end if;

--if (p_type = 'DOSAGESTRENGTH') then

  --select dp_name||PP_name  
  --into v_result 
  --from ecpr.primarypack
  --where id = p_primarypackid;


--end if;

if (p_type = 'NUMBERPERUNIT') then

  select count(*) 
  into v_count
  from ecpr.designtable
  where instr(studymed_id,p_primarypackid) > 0;

  if (v_count=1) then
    select replace(studymed_id,' ',null)
    into v_identifier
    from ecpr.designtable
    where instr(studymed_id,p_primarypackid) > 0
    and rownum = 1;
  
    while (instr(v_identifier,'/')> 0  )
    LOOP
      select NVL(substr(v_identifier,1,instr(v_identifier,'/')-1) ,v_identifier)
      into v_primarypackid
      from dual;
    
      select NVL(substr(v_identifier,instr(v_identifier,'/')+1) ,v_identifier)
      into v_identifier
      from dual;
    
      select dp_name||PP_name   
      into v_tmpresult 
      from ecpr.primarypack
      where id = v_primarypackid;
    
      v_result:= v_result||v_tmpresult;  
  
    END LOOP;
    select dp_name||PP_name   
    into v_tmpresult 
    from ecpr.primarypack
    where id = v_identifier;
    
    v_result:= v_result||v_tmpresult;  
   
  --extract number per unit from TRD material description
    v_result:=l_get_numberperunit(v_result);
    --or from OPEN design for primary packs
    if ( v_result is null ) then
      select "Primary_y_n",open
      into v_primary_y_n,v_open
      from ecpr.designtable
      where instr(studymed_id,p_primarypackid) > 0
      and rownum = 1;

      if (upper(v_primary_y_n) = 'Y') then
        v_open := replace(v_open,' ',null);
        if ( instr(v_open,'x') > 0) then
          v_result := substr(v_open,1,instr(v_open,'x')-1);
        end if;  
      end if;

    end if;

    if (v_result is null) then
      select dp_name||PP_name   
      into v_result 
      from ecpr.primarypack
      where id = p_primarypackid;
    end if;
  end if;
end if;

if (p_type = 'CPRID') then
  select cpr_id 
  into v_result 
  from ecpr.primarypack
  where id = p_primarypackid;
end if;

return (v_result);

end;

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
FUNCTION F$GetLabelID(
p_primarypackid    in varchar2,
p_created_on       in date
)
return varchar2
is

v_label_id       varchar2(100);

begin

select label_id 
into v_label_id
from label_object_jn
where jn_oracle_user = 'PRIESRE1'
and jn_operation = 'INS'
and jn_datetime > p_created_on
and instr (label_object,p_primarypackid) >0
and rownum = 1;

return v_label_id;

exception
when no_data_found then
   return null;
end;

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
FUNCTION F$GETMAXJNDATETIME
(
p_label_id varchar2,
p_date date
)
return date
is

v_date date;

begin
select max(jn_datetime) 
into v_date
from label_object_jn 
where label_id = p_label_id
and jn_datetime > p_date;


return v_date;

exception
when no_data_found then
   return null;


end;

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
FUNCTION F$MATCHING(
p_type         in varchar2,
p_field        in varchar2,
p_cprvalue     in varchar2,
p_labelid     in varchar2,
p_clinvalue    in varchar2
) 
return varchar2
is

v_result            varchar2(90);
v_actcodelist       varchar2(250);
v_count             number;
v_indice            number;
v_cprvalue          varchar2(1000);


begin

if (p_type = 'FTPH') then

  select ftph_id
  into v_result
  from actlabelplaceholders
  where labelid = p_labelid
  and upper(replace(placeholder_data,' ',null)) = upper(replace(p_cprvalue,' ',null))
  and rownum = 1 ;

 
 
end if;

if (p_type = 'VPH') then
  select vph_id 
  into v_result
  from actlabelplaceholders
  where labelid = p_labelid
  and instr(upper(replace(description,' ',null)),upper(replace(p_cprvalue,' ',null)))>0
  and rownum = 1 ;
end if;


if (p_type = 'TPH') then
   select decode(upper(p_cprvalue),upper(p_clinvalue),'Y','N')
   into v_result
   from dual;
   --do not highlight in case plural
   if (v_result = 'N' and  upper(substr(p_clinvalue,length(p_clinvalue),length(p_clinvalue))) = 'S') then
      v_result:='Y';
   end if;
   --mapping list for ROA and dosageform
   if (v_result = 'N' and p_field in ('ROUTEOFADMINISTRATION','DOSAGEFORM')) then
     select count(*)
     into v_count
     from actcodelist
     where clinicopiadata = upper(p_clinvalue);
     
     if (v_count > 0) then     
       select ecprdata
       into v_actcodelist
       from actcodelist
       where clinicopiadata = p_clinvalue
       and rownum = 1;
     
      if (v_actcodelist is not null) then
         select instr(upper(v_actcodelist),upper(p_cprvalue))
         into v_count
         from dual;
         
         if (v_count > 0) then
           v_result:='Y';
         end if;
      end if;
    end if;     
   end if;   
end if;

return v_result;

exception
when no_data_found then
   return 'N';

end;

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
FUNCTION F$MATCHINGDS(
p_type         in varchar2,
p_field        in varchar2,
p_cprvalue     in varchar2,
p_labelid     in varchar2,
p_clinvalue    in varchar2
) 
return varchar2
is

v_result            varchar2(90);
v_actcodelist       varchar2(250);
v_count             number;
v_indice            number;
v_cprvalue          varchar2(1000);
v_dosagestrength1   varchar2(100);
v_dosagestrength2   varchar2(100);
v_dosagestrength3   varchar2(100);
v_dosagestrength4   varchar2(100);
v_dosagestrength5   varchar2(100);
v_dosagestrength6   varchar2(100);
v_dosagestrength7   varchar2(100);
v_dosagestrength8   varchar2(100);
v_dosagestrength9   varchar2(100);
v_dosagestrength10  varchar2(100);
v_separator         number;

begin

  --concatenation of several dosage strengths
  --0mg and 0mg/g translated as placebo in clinicopia
  v_cprvalue:= upper(replace(p_cprvalue,' ', null));

  v_separator := length(regexp_replace(v_cprvalue, '[^/]'));
  
  --maximum 5 different dosage strengths in clinicopia PRODUCTION
  --here took 10 values
  

  if (upper(substr(v_cprvalue,1,5)) = '0MG/G') then
    v_cprvalue := replace(upper(v_cprvalue),'0MG/G','PLACEBO');
    v_separator:= v_separator -1;
  end if;
  if (instr(v_cprvalue,'/',1) > 0) then  
    v_dosagestrength1  := substr(v_cprvalue,1,instr(v_cprvalue,'/',1)-1);
  else
    v_dosagestrength1  := v_cprvalue;
  end if;
  
  v_dosagestrength2 := P$PLACEBODS (v_cprvalue,2,v_dosagestrength1);
  v_dosagestrength3 := P$PLACEBODS (v_cprvalue,3,v_dosagestrength1);
  v_dosagestrength4 := P$PLACEBODS (v_cprvalue,4,v_dosagestrength1);
  v_dosagestrength5 := P$PLACEBODS (v_cprvalue,5,v_dosagestrength1);
  v_dosagestrength6 := P$PLACEBODS (v_cprvalue,6,v_dosagestrength1);
  v_dosagestrength7 := P$PLACEBODS (v_cprvalue,7,v_dosagestrength1);
  v_dosagestrength8 := P$PLACEBODS (v_cprvalue,8,v_dosagestrength1);
  v_dosagestrength9 := P$PLACEBODS (v_cprvalue,9,v_dosagestrength1);
  v_dosagestrength10 := P$PLACEBODS (v_cprvalue,10,v_dosagestrength1);

if (p_type = 'FTPH') then
  --check if all different dosagestrengths
  --are displayed in Clinicopia
  --and if there is the same number of separators '/'
  select placeholder_id 
  into v_result
  from freetext_ph
  where label_id = p_labelid
  and instr(upper(replace(placeholder_data,' ',null)),v_dosagestrength1)>0
  and instr(upper(replace(placeholder_data,' ',null)),v_dosagestrength2)>0
  and instr(upper(replace(placeholder_data,' ',null)),v_dosagestrength3)>0
  and instr(upper(replace(placeholder_data,' ',null)),v_dosagestrength4)>0
  and instr(upper(replace(placeholder_data,' ',null)),v_dosagestrength5)>0  
  and instr(upper(replace(placeholder_data,' ',null)),v_dosagestrength6)>0  
  and instr(upper(replace(placeholder_data,' ',null)),v_dosagestrength7)>0  
  and instr(upper(replace(placeholder_data,' ',null)),v_dosagestrength8)>0  
  and instr(upper(replace(placeholder_data,' ',null)),v_dosagestrength9)>0  
  and instr(upper(replace(placeholder_data,' ',null)),v_dosagestrength10)>0   
  and NVL(length(regexp_replace(placeholder_data, '[^/]')),0) = NVL(v_separator,0)
  and rownum = 1 ; 
end if;

if (p_type = 'VPH') then
  select placeholder_id 
  into v_result
  from visit_ph
  where label_id = p_labelid
  --and instr(upper(replace(description,' ',null)),upper(replace(p_cprvalue,' ',null)))>0
  and instr(upper(replace(description,' ',null)),v_dosagestrength1)>0
  and instr(upper(replace(description,' ',null)),v_dosagestrength2)>0
  and instr(upper(replace(description,' ',null)),v_dosagestrength3)>0
  and instr(upper(replace(description,' ',null)),v_dosagestrength4)>0
  and instr(upper(replace(description,' ',null)),v_dosagestrength5)>0  
  and instr(upper(replace(description,' ',null)),v_dosagestrength6)>0  
  and instr(upper(replace(description,' ',null)),v_dosagestrength7)>0  
  and instr(upper(replace(description,' ',null)),v_dosagestrength8)>0  
  and instr(upper(replace(description,' ',null)),v_dosagestrength9)>0  
  and instr(upper(replace(description,' ',null)),v_dosagestrength10)>0   
  and NVL(length(regexp_replace(description, '[^/]')),0) = NVL(v_separator,0)
  and rownum = 1 ;
end if;


if (p_type = 'DPH') then
   select decode(upper(p_cprvalue),upper(p_clinvalue),'Y','N')
   into v_result
   from dual;
   --do not highlight in case plural
   if (v_result = 'N' and  upper(substr(p_clinvalue,length(p_clinvalue),length(p_clinvalue))) = 'S') then
      v_result:='Y';
   end if;
   --mapping list for ROA and dosageform
   if (v_result = 'N' and p_field in ('ROUTEOFADMINISTRATION','DOSAGEFORM')) then
     select count(*)
     into v_count
     from actcodelist
     where clinicopiadata = upper(p_clinvalue);
     
     if (v_count > 0) then     
       select ecprdata
       into v_actcodelist
       from actcodelist
       where clinicopiadata = p_clinvalue
       and rownum = 1;
     
      if (v_actcodelist is not null) then
         select instr(upper(v_actcodelist),upper(p_cprvalue))
         into v_count
         from dual;
         
         if (v_count > 0) then
           v_result:='Y';
         end if;
      end if;
    end if;     
   end if;   
end if;

return v_result;

exception
when no_data_found then
   return 'N';

end;

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
FUNCTION F$GETOCCURRENCE(
p_type         in varchar2,
p_actuserid     in varchar2,
p_cprvalue     in varchar2,
p_labelid      in varchar2
) 
return number
is

v_result number;

begin

if (p_type = 'FTPH') then

  select count(*) 
  into v_result
  from actlabelplaceholders
  where labelid = p_labelid
  and upper(replace(placeholder_data,' ',null)) = upper(replace(p_cprvalue,' ',null))
  and clintype = 'FTPH'
  and actuserid = p_actuserid;
end if;

if (p_type = 'VPH') then
  select count(*) 
  into v_result
  from actlabelplaceholders
  where labelid = p_labelid
  and instr(upper(replace(description,' ',null)),upper(replace(p_cprvalue,' ',null)))>0
  and actuserid = p_actuserid;
  --and upper(replace(description,' ',null)) = upper(replace(p_cprvalue,' ',null));
end if;

if (p_type = 'TPH') then
  select count(*) 
  into v_result
  from label_placeholders
  where label_id = p_labelid
  and upper(replace(tph_id,' ',null)) = upper(replace(p_cprvalue,' ',null));
end if;

return v_result;

exception
when no_data_found then
   return 0;

end;

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
FUNCTION F$GETOCCURRENCEDS(
p_type         in varchar2,
p_actuserid     in varchar2,
p_cprvalue     in varchar2,
p_labelid      in varchar2
) 
return number
is

v_result            number;
v_result1           number;
v_result2           number;
v_cprvalue          varchar2(200);
v_dosagestrength1   varchar2(100);
v_dosagestrength2   varchar2(100);
v_dosagestrength3   varchar2(100);
v_dosagestrength4   varchar2(100);
v_dosagestrength5   varchar2(100);
v_dosagestrength6   varchar2(100);
v_dosagestrength7   varchar2(100);
v_dosagestrength8   varchar2(100);
v_dosagestrength9   varchar2(100);
v_dosagestrength10  varchar2(100);
v_separator         number;

begin

v_cprvalue:= upper(replace(p_cprvalue,' ', null));
v_separator := length(regexp_replace(v_cprvalue, '[^/]'));

if (upper(substr(v_cprvalue,1,5)) = '0MG/G') then
  v_cprvalue := replace(upper(v_cprvalue),'0MG/G','PLACEBO');
  v_separator:= v_separator -1;
end if;
if (instr(v_cprvalue,'/',1) > 0) then  
  v_dosagestrength1  := substr(v_cprvalue,1,instr(v_cprvalue,'/',1)-1);
else
  v_dosagestrength1  := v_cprvalue;
end if;
  
v_dosagestrength2 := P$PLACEBODS (v_cprvalue,2,v_dosagestrength1);
v_dosagestrength3 := P$PLACEBODS (v_cprvalue,3,v_dosagestrength1);
v_dosagestrength4 := P$PLACEBODS (v_cprvalue,4,v_dosagestrength1);
v_dosagestrength5 := P$PLACEBODS (v_cprvalue,5,v_dosagestrength1);
v_dosagestrength6 := P$PLACEBODS (v_cprvalue,6,v_dosagestrength1);
v_dosagestrength7 := P$PLACEBODS (v_cprvalue,7,v_dosagestrength1);
v_dosagestrength8 := P$PLACEBODS (v_cprvalue,8,v_dosagestrength1);
v_dosagestrength9 := P$PLACEBODS (v_cprvalue,9,v_dosagestrength1);
v_dosagestrength10 := P$PLACEBODS (v_cprvalue,10,v_dosagestrength1);



if (p_type = 'FTPH') then

  select count(*) 
  into v_result
  from actlabelplaceholders
  where labelid = p_labelid
  and upper(replace(placeholder_data,' ',null)) = v_cprvalue
  and clintype = 'FTPH'
  and actuserid = p_actuserid;

  if (v_result = 0) then 


    select count(*) 
    into v_result
    from actlabelplaceholders
    where labelid = p_labelid
    and instr(upper(replace(placeholder_data,' ',null)),v_dosagestrength1)>0
    and instr(upper(replace(placeholder_data,' ',null)),v_dosagestrength2)>0
    and instr(upper(replace(placeholder_data,' ',null)),v_dosagestrength3)>0
    and instr(upper(replace(placeholder_data,' ',null)),v_dosagestrength4)>0
    and instr(upper(replace(placeholder_data,' ',null)),v_dosagestrength5)>0  
    and instr(upper(replace(placeholder_data,' ',null)),v_dosagestrength6)>0  
    and instr(upper(replace(placeholder_data,' ',null)),v_dosagestrength7)>0  
    and instr(upper(replace(placeholder_data,' ',null)),v_dosagestrength8)>0  
    and instr(upper(replace(placeholder_data,' ',null)),v_dosagestrength9)>0  
    and instr(upper(replace(placeholder_data,' ',null)),v_dosagestrength10)>0   
    and clintype = 'FTPH'
    and actuserid = p_actuserid;
  end if;
  
end if;

if (p_type = 'VPH') then
  select count(*) 
  into v_result
  from actlabelplaceholders
  where labelid = p_labelid
  and instr(upper(replace(description,' ',null)),upper(v_cprvalue))>0
  and clintype = 'VPH'
  and actuserid = p_actuserid;
  
  if (v_result = 0) then

    select count(*) 
    into v_result
    from actlabelplaceholders
    where labelid = p_labelid
    and instr(upper(replace(description,' ',null)),v_dosagestrength1)>0
    and instr(upper(replace(description,' ',null)),v_dosagestrength2)>0
    and instr(upper(replace(description,' ',null)),v_dosagestrength3)>0
    and instr(upper(replace(description,' ',null)),v_dosagestrength4)>0
    and instr(upper(replace(description,' ',null)),v_dosagestrength5)>0  
    and instr(upper(replace(description,' ',null)),v_dosagestrength6)>0  
    and instr(upper(replace(description,' ',null)),v_dosagestrength7)>0  
    and instr(upper(replace(description,' ',null)),v_dosagestrength8)>0  
    and instr(upper(replace(description,' ',null)),v_dosagestrength9)>0  
    and instr(upper(replace(description,' ',null)),v_dosagestrength10)>0   
    and clintype = 'VPH'
    and actuserid = p_actuserid;
  end if;
  
end if;


if (p_type = 'FTPHVPH') then

  select count(*) 
  into v_result1
  from actlabelplaceholders
  where labelid = p_labelid
  and upper(replace(placeholder_data,' ',null)) =v_cprvalue
  and clintype = 'FTPH'
  and actuserid = p_actuserid;

  if (v_result1 = 0) then
 

    select count(*) 
    into v_result1
    from actlabelplaceholders
    where labelid = p_labelid
    and instr(upper(replace(placeholder_data,' ',null)),v_dosagestrength1)>0
    and instr(upper(replace(placeholder_data,' ',null)),v_dosagestrength2)>0
    and instr(upper(replace(placeholder_data,' ',null)),v_dosagestrength3)>0
    and instr(upper(replace(placeholder_data,' ',null)),v_dosagestrength4)>0
    and instr(upper(replace(placeholder_data,' ',null)),v_dosagestrength5)>0  
    and instr(upper(replace(placeholder_data,' ',null)),v_dosagestrength6)>0  
    and instr(upper(replace(placeholder_data,' ',null)),v_dosagestrength7)>0  
    and instr(upper(replace(placeholder_data,' ',null)),v_dosagestrength8)>0  
    and instr(upper(replace(placeholder_data,' ',null)),v_dosagestrength9)>0  
    and instr(upper(replace(placeholder_data,' ',null)),v_dosagestrength10)>0   
    and clintype = 'FTPH'
    and actuserid = p_actuserid;
  end if;


  select count(*) 
  into v_result2
  from actlabelplaceholders
  where labelid = p_labelid
  and instr(upper(replace(description,' ',null)),upper(replace(v_cprvalue,' ',null)))>0
  and clintype = 'VPH'
  and actuserid = p_actuserid;
  
  if (v_result2 = 0) then


    select count(*) 
    into v_result2
    from actlabelplaceholders
    where labelid = p_labelid
    and instr(upper(replace(description,' ',null)),v_dosagestrength1)>0
    and instr(upper(replace(description,' ',null)),v_dosagestrength2)>0
    and instr(upper(replace(description,' ',null)),v_dosagestrength3)>0
    and instr(upper(replace(description,' ',null)),v_dosagestrength4)>0
    and instr(upper(replace(description,' ',null)),v_dosagestrength5)>0  
    and instr(upper(replace(description,' ',null)),v_dosagestrength6)>0  
    and instr(upper(replace(description,' ',null)),v_dosagestrength7)>0  
    and instr(upper(replace(description,' ',null)),v_dosagestrength8)>0  
    and instr(upper(replace(description,' ',null)),v_dosagestrength9)>0  
    and instr(upper(replace(description,' ',null)),v_dosagestrength10)>0   
    and clintype = 'VPH'
    and actuserid = p_actuserid;
  end if;
  
  v_result := v_result1 + v_result2;
  
end if;

if (p_type = 'DPH') then
  select count(*) 
  into v_result
  from label_placeholders
  where label_id = p_labelid
  and upper(replace(tph_id,' ',null)) = v_cprvalue;
end if;

return v_result;

exception
when no_data_found then
   return 0;

end;

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
FUNCTION F$GETDOSAGESTRENGTH(
p_actuserid     in varchar2,
p_label_id     in varchar2
) 
return varchar2
is

v_result_VPH varchar2(4000):='';
v_result_FTPH varchar2(4000):='';
v_result_FTPH_tmp varchar2(4000):='';
v_result varchar2(4000):='';



begin

for cx in (

  select   placeholder_id 
  from actresult
  where labelid = p_label_id
  and actuserid = p_actuserid
  and clintype = 'VPH'
  and acttype = 'DOSAGESTRENGTH'
  )
   loop
    if ( cx.placeholder_id is not null and cx.placeholder_id != 'N') then
     if (v_result_VPH is null) then
        v_result_VPH:=cx.placeholder_id;
     else
        v_result_VPH:=v_result_VPH||' ; '||cx.placeholder_id;
     end if;
   end if;  
  end loop;  

  
for cy in (

  select   placeholder_id 
  from actresult
  where labelid = p_label_id
  and actuserid = p_actuserid
  and clintype = 'FTPH'
  and acttype = 'DOSAGESTRENGTH'
  )
   loop
     if ( cy.placeholder_id is not null and cy.placeholder_id != 'N') then
       select placeholder_data
       into v_result_FTPH_tmp
       from actlabelplaceholders
       where ftph_id = cy.placeholder_id 
       and clintype = 'FTPH'
       and rownum =1;
       if (v_result_VPH is null) then
         v_result_FTPH:=v_result_FTPH_tmp;
       else
         v_result_FTPH:=v_result_VPH||' ; '||v_result_FTPH_tmp;
       end if;
       --v_result_FTPH:=v_result_FTPH||' ; '||v_result_FTPH_tmp;
     end if;
  end loop;    
 

v_result := 'VPH = '||NVL(v_result_VPH,'-')||', FTPH = '||NVL(v_result_FTPH,'-');
return (v_result);

end;

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
FUNCTION F$GETWARNING(
p_type         in varchar2,
p_actuserid      in varchar2,
p_labelid in varchar2,
p_itemoccurrence in number,
p_labeldescription in varchar2,
p_cprvalue     in varchar2
) 
return varchar2
is
--rules for warning
--only applicable for S4 and S6 labels

v_result varchar2(1000);
v_labeltype varchar2(50);
v_count number;
v_tmp   varchar2(1000);
v_count_ftph number;
v_count_vph number;



begin


if (p_type = 'DOSAGESTRENGTH') then
  v_count_ftph := PKG$ACT.F$GETOCCURRENCEDS('FTPH',p_actuserid,p_cprvalue ,p_labelid);
  v_count_vph := PKG$ACT.F$GETOCCURRENCEDS('VPH',p_actuserid,p_cprvalue ,p_labelid);  
  v_count := v_count_ftph + v_count_vph;
end if;

if ( instr(upper(p_labeldescription),'_S6') = 0 
   and instr(upper(p_labeldescription),'_S4')= 0) then
  v_result:= '';
else
 if (p_type = 'DOSAGESTRENGTH')then 
  if (instr(upper(p_labeldescription),'_OL')>0 or substr(upper(p_labeldescription),1,3) = 'OL_')then
    if (v_count_ftph =2 and v_count_vph = 0 ) then
      v_result:= '';
    else
      v_result:= '2 FTPHs should be created in Clinicopia for open label';
    end if;
  end if;
  if (instr(upper(p_labeldescription),'_SB')>0 or substr(upper(p_labeldescription),1,3) = 'SB_' )then
    if (v_count_ftph =1 and v_count_vph = 1 ) then
      v_result:= '';
    else
      v_result:='1 FTPH and 1 VPH should be created in Clinicopia for single blind label';
    end if;
  end if;  
  if (instr(upper(p_labeldescription),'_DB')>0 or substr(upper(p_labeldescription),1,3) = 'DB_' )then
    if (v_count_ftph =1 and v_count_vph = 1 ) then
      v_result:= '';
    else
      v_result:= '1 FTPH and 1 VPH should be created in Clinicopia for double blind label';
    end if;
  end if;  
 end if;
 
 if (p_type in ('STUDYCODE','PROJECTCODE','NUMBERPERUNIT','ADDLABELPARAM')) then 
  if (instr(upper(p_labeldescription),'_OL')>0 or substr(upper(p_labeldescription),1,3) = 'OL_'     
      or instr(upper(p_labeldescription),'_SB')>0 or substr(upper(p_labeldescription),1,3) = 'SB_'
      or instr(upper(p_labeldescription),'_DB')>0 or substr(upper(p_labeldescription),1,3) = 'DB_' )then
    if (p_itemoccurrence = 2  ) then
      v_result:= '';
    else
      if (instr(upper(p_labeldescription),'_OL')>0 or substr(upper(p_labeldescription),1,3) = 'OL_') then  
        v_labeltype := 'for open label';
      end if;  
      if (instr(upper(p_labeldescription),'_SB')>0 or substr(upper(p_labeldescription),1,3) = 'SB_' ) then  
        v_labeltype := 'for single blind label';
      end if;  
      if (instr(upper(p_labeldescription),'_DB')>0 or substr(upper(p_labeldescription),1,3) = 'DB_') then  
        v_labeltype := 'for double blind label';
      end if;        
      v_result:= '2 FTPHs should be created in Clinicopia '||v_labeltype;
    end if;
  end if;  
 end if; 
 
  if (p_type in ('ROA','DOSAGEFORM')) then 
  if (instr(upper(p_labeldescription),'_OL')>0 or substr(upper(p_labeldescription),1,3) = 'OL_'
      or instr(upper(p_labeldescription),'_SB')>0 or substr(upper(p_labeldescription),1,3) = 'SB_'
      or instr(upper(p_labeldescription),'_DB')>0 or substr(upper(p_labeldescription),1,3) = 'DB_') then
    if ((p_type = 'ROA' and p_itemoccurrence = 1 )
       or (p_type = 'DOSAGEFORM' and p_itemoccurrence = 2 ) ) then
      v_result:= '';
    else
      if (instr(upper(p_labeldescription),'_OL')>0 or substr(upper(p_labeldescription),1,3) = 'OL_') then  
        v_labeltype := 'for open label';
      end if;  
      if (instr(upper(p_labeldescription),'_SB')>0 or substr(upper(p_labeldescription),1,3) = 'SB_') then  
        v_labeltype := 'for single blind label';
      end if;  
      if (instr(upper(p_labeldescription),'_DB')>0 or substr(upper(p_labeldescription),1,3) = 'DB_') then  
        v_labeltype := 'for double blind label';
      end if;   
      if (p_type = 'ROA') then
            v_result:= '1 TPH should be created in Clinicopia '||v_labeltype;
      end if;
            if (p_type = 'DOSAGEFORM') then
            v_result:= '2 TPHs should be created in Clinicopia '||v_labeltype;
      end if;
    end if;
  end if;  
 end if; 

end if;


return (v_result);

end;
    
end;
/

