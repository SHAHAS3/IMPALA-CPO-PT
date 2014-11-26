CREATE OR REPLACE PACKAGE SYS_AUDIT AS

   g_trigger_name     varchar2(100) := 'SYS_AUDIT_TRG_';
   g_seq_name         varchar2(100) := 'IDSEQ';
   g_user_id          varchar2(100) := 'nvl(GLOBALVARS.GUSID,GLOBALVARS.GUSID)';
   g_view_name        varchar2(100) := 'V_SYS_AUDIT_01';
   g_user_table       varchar2(100) := 'ADM_USERS';
   g_user_id_column   varchar2(100) := 'ID';
   g_user_name_column varchar2(100) := 'GLOBALVARS.GUSER';
   g_id1              varchar2(100) := 'NULL';
   g_id2              varchar2(100) := 'NULL';
--
PROCEDURE create_trigger(v_trigger_id in varchar2,v_table_name in varchar2);
PROCEDURE create_all;
PROCEDURE create_view;
FUNCTION  get_name(v_table_name  in varchar2,
                   v_column_name in varchar2,
                   v_id_column   in varchar2,
                   v_id          in varchar2) return varchar2;

END;
/

CREATE OR REPLACE PACKAGE BODY SYS_AUDIT AS
--
PROCEDURE create_trigger(v_trigger_id in varchar2,v_table_name in varchar2) IS
   p_sql          varchar2(32000);
   p_column_names varchar2(32000);
   p_seperator    char(1);
   P_PK_COL1 VARCHAR2 (32000);
   P_PK_COL2 VARCHAR2 (32000);
BEGIN
   p_seperator := null;
   --------------------------

SELECT NVL (cols.column_name, NULL)
  INTO p_pk_col1
  FROM user_constraints cons, user_cons_columns cols
 WHERE cons.constraint_type = 'P'
   AND cons.constraint_name = cols.constraint_name
   AND POSITION = 1
   AND cols.table_name = v_table_name;

/*SELECT NVL (cols.column_name, NULL)
  INTO p_pk_col2
  FROM user_constraints cons, user_cons_columns cols
 WHERE cons.constraint_type = 'P'
   AND cons.constraint_name = cols.constraint_name
   AND POSITION = 2
   AND cols.table_name = v_table_name;*/
   
   --------------------------------
      
   for c1 in (select * from SYS_AUDIT_COLUMNS where table_name=v_table_name) loop
      p_column_names := p_column_names || p_seperator || c1.column_name;
      p_seperator := ',';
   end loop;
   p_sql :=       'CREATE OR REPLACE TRIGGER ' || g_trigger_name || v_trigger_id || ' AFTER INSERT OR DELETE OR UPDATE ';
   p_sql := p_sql || ' OF ' || p_column_names || ' ON ' || v_table_name || ' REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW ';
   p_sql := p_sql || 'DECLARE ';
   p_sql := p_sql || '   p_time timestamp; ';
   p_sql := p_sql || '    p_type char(1); ';
   p_sql := p_sql || 'BEGIN ';
   p_sql := p_sql || '   p_time := systimestamp;';
   p_sql := p_sql || '   if INSERTING then ';
   p_sql := p_sql || '      p_type := ''I'';';
   p_sql := p_sql || '   elsif DELETING then ';
   p_sql := p_sql || '      p_type := ''D'';';
   p_sql := p_sql || '   else ';
   p_sql := p_sql || '      p_type := ''U'';';
   p_sql := p_sql || '   end if;';
   for c1 in (select a.*,b.data_type from SYS_AUDIT_COLUMNS a,USER_TAB_COLUMNS b  
               where a.table_name=v_table_name 
               and a.table_name=b.table_name 
               and a.column_name=b.column_name) loop
      p_sql := p_sql || ' if (:OLD.'||c1.column_name||' is not null and :NEW.'||c1.column_name||' is not null and :OLD.'||c1.column_name||' != :NEW.'||c1.column_name||')';
      p_sql := p_sql || ' or (:OLD.'||c1.column_name||' is not null and :NEW.'||c1.column_name||' is null)';
      p_sql := p_sql || ' or (:OLD.'||c1.column_name||' is null and :NEW.'||c1.column_name||' is not null) then';        
      p_sql := p_sql || '    insert into SYS_AUDITS(ID,AUDIT_COLUMNS_ID,USER_ID,OP_TYPE,OP_DATE,INITIAL_VALUE,LAST_VALUE,ID1,ID2, USER_NAME )';
      if c1.data_type in('DATE','TIMESTAMP(6)') then
         p_sql := p_sql || '    values ('||g_seq_name||'.nextval,'||c1.id||','||g_user_id||',p_type,p_time,to_char(:OLD.'||c1.column_name||',''dd.mm.yyyy hh24:mi:ss''),to_char(:NEW.'||c1.column_name||',''dd.mm.yyyy hh24:mi:ss''),:NEW.'||P_PK_COL1||','||g_id2||','||SYS_AUDIT.G_USER_NAME_COLUMN||');';
      else
         p_sql := p_sql || '    values ('||g_seq_name||'.nextval,'||c1.id||','||g_user_id||',p_type,p_time,:OLD.'||c1.column_name||',:NEW.'||c1.column_name||',:NEW.'||P_PK_COL1||','|| g_id2 ||','||SYS_AUDIT.G_USER_NAME_COLUMN||');';
      end if;
      p_sql := p_sql || ' end if;';
   end loop;
   p_sql := p_sql || ' end;';
   
  -- raise_application_error(-20001,p_sql);  
     
   execute immediate (p_sql);
END create_trigger;
--
PROCEDURE create_view IS
   p_sql          varchar2(32000);
BEGIN
   p_sql := p_sql || 'CREATE OR REPLACE  VIEW '||g_view_name||' AS '; 
   p_sql := p_sql || 'select a.user_id user_id, c.'||g_user_name_column||' user_name,';
   p_sql := p_sql || 'decode(a.op_type,''I'',''Insert'',''D'',''Delete'',''U'',''Update'') operation,';
   p_sql := p_sql || ' case when b.ref_table_name is null then a.initial_value ';
   p_sql := p_sql || '      else SYS_AUDIT.get_name(b.ref_table_name,b.ref_column_name,b.ref_column_id,a.initial_value)';
   p_sql := p_sql || '      end initial_value,';
   p_sql := p_sql || ' case when b.ref_table_name is null then a.last_value ';
   p_sql := p_sql || '      else SYS_AUDIT.get_name(b.ref_table_name,b.ref_column_name,b.ref_column_id,a.last_value)';
   p_sql := p_sql || '      end last_value,';
   p_sql := p_sql || ' b.table_name,';
   p_sql := p_sql || ' a.op_date,';
   p_sql := p_sql || ' b.column_name,';
   p_sql := p_sql || ' b.description,';
   p_sql := p_sql || ' b.ref_table_name,';
   p_sql := p_sql || ' b.ref_column_name,';
   p_sql := p_sql || ' a.id1,';
   p_sql := p_sql || ' a.id2';
   p_sql := p_sql || ' from SYS_audits a,SYS_audit_columns b, '||g_user_table||' c';
   p_sql := p_sql || ' where a.audit_columns_id=b.id and a.user_id=c.'||g_user_id_column;
   execute immediate (p_sql);
END create_view;
--
FUNCTION  get_name(v_table_name  in varchar2,
                   v_column_name in varchar2,
                   v_id_column   in varchar2,
                   v_id          in varchar2) return varchar2 IS
   p_value varchar2(4000);
BEGIN
   if v_id is null then
      return null;
   end if;
   execute immediate 'select '||v_column_name||' from '||v_table_name||' where '
                      ||v_id_column||' = '||v_id into p_value;
   return p_value;
EXCEPTION WHEN OTHERS THEN
   return 'ERROR IN LOOKUP TABLE';
END get_name;
--
PROCEDURE create_all is
   p_counter integer := 0;
BEGIN
  for c1 in (select distinct table_name from SYS_AUDIT_COLUMNS) loop
     p_counter := p_counter + 1;
     create_trigger(p_counter,c1.table_name);
  end loop;
  create_view;
END create_all;
--
END;
/

