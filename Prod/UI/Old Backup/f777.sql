set define off
set verify off
set serveroutput on size 1000000
set feedback off
WHENEVER SQLERROR EXIT SQL.SQLCODE ROLLBACK
begin wwv_flow.g_import_in_progress := true; end; 
/
 
 
--application/set_environment
prompt  APPLICATION 777 - IMPALA CENTRAL
--
-- Application Export:
--   Application:     777
--   Name:            IMPALA CENTRAL
--   Date and Time:   11:32 Monday July 21, 2014
--   Exported By:     SHAHAS3
--   Flashback:       0
--   Export Type:     Application Export
--   Version: 3.2.0.00.27
 
-- Import:
--   Using application builder
--   or
--   Using SQL*Plus as the Oracle user APEX_030200 or as the owner (parsing schema) of the application.
 
-- Application Statistics:
--   Pages:                 2
--     Items:               3
--     Computations:        0
--     Validations:         0
--     Processes:           4
--     Regions:             4
--     Buttons:             0
--   Shared Components
--     Breadcrumbs:         1
--        Entries           0
--     Items:               0
--     Computations:        0
--     Processes:           0
--     Parent Tabs:         0
--     Tab Sets:            0
--        Tabs:             0
--     NavBars:             1
--     Lists:               2
--     Shortcuts:           0
--     Themes:              2
--     Templates:
--        Page:            21
--        List:            32
--        Report:          14
--        Label:           11
--        Region:          45
--     Messages:            0
--     Build Options:       0
 
 
--       AAAA       PPPPP   EEEEEE  XX      XX
--      AA  AA      PP  PP  EE       XX    XX
--     AA    AA     PP  PP  EE        XX  XX
--    AAAAAAAAAA    PPPPP   EEEE       XXXX
--   AA        AA   PP      EE        XX  XX
--  AA          AA  PP      EE       XX    XX
--  AA          AA  PP      EEEEEE  XX      XX
prompt  Set Credentials...
 
begin
 
  -- Assumes you are running the script connected to SQL*Plus as the Oracle user APEX_030200 or as the owner (parsing schema) of the application.
  wwv_flow_api.set_security_group_id(p_security_group_id=>1062014522451416);
 
end;
/

begin wwv_flow.g_import_in_progress := true; end;
/
begin 

select value into wwv_flow_api.g_nls_numeric_chars from nls_session_parameters where parameter='NLS_NUMERIC_CHARACTERS';

end;

/
begin execute immediate 'alter session set nls_numeric_characters=''.,''';

end;

/
begin wwv_flow.g_browser_language := 'en-us'; end;
/
prompt  Check Compatibility...
 
begin
 
-- This date identifies the minimum version required to import this file.
wwv_flow_api.set_version(p_version_yyyy_mm_dd=>'2009.01.12');
 
end;
/

prompt  Set Application ID...
 
begin
 
   -- SET APPLICATION ID
   wwv_flow.g_flow_id := 777;
   wwv_flow_api.g_id_offset := 0;
null;
 
end;
/

--application/delete_application
 
begin
 
   -- Remove Application
wwv_flow_api.remove_flow(777);
 
end;
/

 
begin
 
wwv_flow_audit.remove_audit_trail(777);
null;
 
end;
/

--application/create_application
 
begin
 
wwv_flow_api.create_flow(
  p_id    => 777,
  p_display_id=> 777,
  p_owner => 'IMPALA',
  p_name  => 'IMPALA CENTRAL',
  p_alias => 'F777',
  p_page_view_logging => 'YES',
  p_default_page_template=> 9012716699033187 + wwv_flow_api.g_id_offset,
  p_printer_friendly_template=> 9014214682033191 + wwv_flow_api.g_id_offset,
  p_default_region_template=> 9019926172033199 + wwv_flow_api.g_id_offset,
  p_error_template    => 9013321601033188 + wwv_flow_api.g_id_offset,
  p_page_protection_enabled_y_n=> 'Y',
  p_checksum_salt_last_reset => '20140721113250',
  p_max_session_length_sec=> 28800,
  p_home_link         => 'f?p=&APP_ID.:1:&SESSION.',
  p_flow_language     => 'en-us',
  p_flow_language_derived_from=> '',
  p_date_format        => 'DD-MON-YYYY',
  p_flow_image_prefix => '/i/',
  p_documentation_banner=> '',
  p_authentication    => 'CUSTOM2',
  p_login_url         => '',
  p_logout_url        => '',
  p_application_tab_set=> 1,
  p_public_url_prefix => '',
  p_public_user       => '',
  p_dbauth_url_prefix => '',
  p_proxy_server      => '',
  p_cust_authentication_process=> '.'||to_char(6521620813583282 + wwv_flow_api.g_id_offset)||'.',
  p_cust_authentication_page=> '',
  p_custom_auth_login_url=> '',
  p_flow_version      => 'release 1.0',
  p_flow_status       => 'AVAILABLE_W_EDIT_LINK',
  p_flow_unavailable_text=> '',
  p_build_status      => 'RUN_AND_BUILD',
  p_exact_substitutions_only=> 'Y',
  p_vpd               => '',
  p_csv_encoding    => 'Y',
  p_theme_id => 101,
  p_default_label_template => 9028907092033221 + wwv_flow_api.g_id_offset,
  p_default_report_template => 9023521860033204 + wwv_flow_api.g_id_offset,
  p_default_list_template => 9028005977033220 + wwv_flow_api.g_id_offset,
  p_default_menu_template => 9030202862033224 + wwv_flow_api.g_id_offset,
  p_default_button_template => 9029432560033223 + wwv_flow_api.g_id_offset,
  p_default_chart_template => 9016904943033196 + wwv_flow_api.g_id_offset,
  p_default_form_template => 9017212434033196 + wwv_flow_api.g_id_offset,
  p_default_wizard_template => 9021432005033201 + wwv_flow_api.g_id_offset,
  p_default_tabform_template => 9019926172033199 + wwv_flow_api.g_id_offset,
  p_default_reportr_template   =>9019926172033199 + wwv_flow_api.g_id_offset,
  p_default_menur_template => 9015703988033195 + wwv_flow_api.g_id_offset,
  p_default_listr_template => 9018407692033198 + wwv_flow_api.g_id_offset,
  p_last_updated_by => 'SHAHAS3',
  p_last_upd_yyyymmddhh24miss=> '20140721113250',
  p_required_roles=> wwv_flow_utilities.string_to_table2(''));
 
 
end;
/

prompt  ...authorization schemes
--
 
begin
 
null;
 
end;
/

--application/shared_components/navigation/navigation_bar
prompt  ...navigation bar entries
--
 
begin
 
wwv_flow_api.create_icon_bar_item(
  p_id             => 6521830884583283 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_icon_sequence  => 200,
  p_icon_image     => '',
  p_icon_subtext   => 'Logout',
  p_icon_target    => '&LOGOUT_URL.',
  p_icon_image_alt => 'Logout',
  p_icon_height    => 32,
  p_icon_width     => 32,
  p_icon_height2   => 24,
  p_icon_width2    => 24,
  p_icon_bar_disp_cond      => '',
  p_icon_bar_disp_cond_type => 'CURRENT_LOOK_IS_1',
  p_begins_on_new_line=> '',
  p_cell_colspan      => 1,
  p_onclick=> '',
  p_icon_bar_comment=> '');
 
 
end;
/

prompt  ...application processes
--
prompt  ...application items
--
prompt  ...application level computations
--
 
begin
 
null;
 
end;
/

prompt  ...Application Tabs
--
 
begin
 
null;
 
end;
/

prompt  ...Application Parent Tabs
--
 
begin
 
null;
 
end;
/

prompt  ...Shared Lists of values
--
prompt  ...Application Trees
--
--application/pages/page_groups
prompt  ...page groups
--
 
begin
 
null;
 
end;
/

--application/comments
prompt  ...comments: requires application express 2.2 or higher
--
 
--application/pages/page_00001
prompt  ...PAGE 1: Main
--
 
begin
 
declare
    h varchar2(32767) := null;
    ph varchar2(32767) := null;
begin
h:=h||'No help is available for this page.';

ph := null;
wwv_flow_api.create_page(
  p_id     => 1,
  p_flow_id=> wwv_flow.g_flow_id,
  p_tab_set=> '',
  p_name   => 'Main',
  p_step_title=> '',
  p_step_sub_title => 'Main',
  p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS',
  p_first_item=> 'AUTO_FIRST_ITEM',
  p_include_apex_css_js_yn=>'Y',
  p_autocomplete_on_off => 'ON',
  p_help_text => ' ',
  p_html_page_header => '',
  p_step_template => 6524517196954855+ wwv_flow_api.g_id_offset,
  p_required_patch=> null + wwv_flow_api.g_id_offset,
  p_last_updated_by => 'GEYERCL1',
  p_last_upd_yyyymmddhh24miss => '20101102110421',
  p_page_is_public_y_n=> 'Y',
  p_protection_level=> 'N',
  p_page_comment  => '');
 
wwv_flow_api.set_page_help_text(p_flow_id=>wwv_flow.g_flow_id,p_flow_step_id=>1,p_text=>h);
end;
 
end;
/

declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'IMPALA (Integrated Management and Planning Application for Clinical Supplies Logistics Area)'||chr(10)||
''||chr(10)||
'<BR><BR>It’s an online platform comprised of the below applications:'||chr(10)||
''||chr(10)||
'<BR><BR>1. <B>eCPR</B> – Electronic Clinical Packaging Requests. While DSM is the owner of the system and will start the Clinical Packaging Requests (CPR), study data is down-loaded from ClinAdmin and need to be completed/checked by the';

s:=s||' study clinician and statistical data need to be completed/checked by the study statistician. All three parties (DSM, Clinical & Statistics) are requested to approve the form to complete the Packaging Order. To get access to the database you need to pass a Pathlore web-based training. The access is granted within 3 working days.'||chr(10)||
''||chr(10)||
'<BR><BR>2. <B>DSM Planning tool</B> – is an internal DSM application';

s:=s||' used for planning different Clinical Supply activities between CPR approved and FPFV. The application in addition also supports DSM Franchise resource planning. '||chr(10)||
''||chr(10)||
'<BR><BR>3. <B>CPO Planning tool & Reports</B> –'||chr(10)||
'<BR>CPO planning tool is an application with DSM- Clinical Packaging Operations group for planning packaging execution activities. '||chr(10)||
'<BR>Reports covers special reporting requirements from I';

s:=s||'MOS, Cross system KPI reports, India Labeling center KPI reports, ClinAdmin reports etc.';

wwv_flow_api.create_page_plug (
  p_id=> 6523200222583373 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_plug_name=> '&nbsp',
  p_region_name=>'',
  p_plug_template=> 9015115240033194+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 10,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'BEFORE_BOX_BODY',
  p_plug_source=> s,
  p_plug_source_type=> 'STATIC_TEXT',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => '',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 6527405805254331 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_plug_name=> '&nbsp',
  p_region_name=>'',
  p_plug_template=> 9015115240033194+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 20,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'REGION_POSITION_01',
  p_plug_source=> s,
  p_plug_source_type=> 6527109568227055 + wwv_flow_api.g_id_offset,
  p_translate_title=> 'Y',
  p_plug_display_error_message=> '#SQLERRM#',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_column_width => 'valign=top',
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => '',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'6534826628689104';

wwv_flow_api.create_page_plug (
  p_id=> 6536205420701892 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_plug_name=> '&nbsp',
  p_region_name=>'',
  p_plug_template=> 9015115240033194+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 30,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'REGION_POSITION_02',
  p_plug_source=> s,
  p_plug_source_type=> 6534826628689104 + wwv_flow_api.g_id_offset,
  p_translate_title=> 'Y',
  p_plug_display_error_message=> '#SQLERRM#',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => '',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
 
begin
 
null;
 
end;
/

 
begin
 
null;
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 1
--
 
begin
 
null;
end;
null;
 
end;
/

 
--application/pages/page_00101
prompt  ...PAGE 101: Login
--
 
begin
 
declare
    h varchar2(32767) := null;
    ph varchar2(32767) := null;
begin
h := null;
ph := null;
wwv_flow_api.create_page(
  p_id     => 101,
  p_flow_id=> wwv_flow.g_flow_id,
  p_tab_set=> '',
  p_name   => 'Login',
  p_alias  => 'LOGIN',
  p_step_title=> 'Login',
  p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS',
  p_first_item=> 'AUTO_FIRST_ITEM',
  p_include_apex_css_js_yn=>'Y',
  p_autocomplete_on_off => 'OFF',
  p_help_text => '',
  p_html_page_header => '',
  p_step_template => 9012512808033184+ wwv_flow_api.g_id_offset,
  p_required_patch=> null + wwv_flow_api.g_id_offset,
  p_last_updated_by => '',
  p_last_upd_yyyymmddhh24miss => '20101028165323',
  p_page_is_public_y_n=> 'N',
  p_page_comment  => '');
 
end;
 
end;
/

declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 6522110324583302 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 101,
  p_plug_name=> 'Login',
  p_region_name=>'',
  p_plug_template=> 0,
  p_plug_display_sequence=> 10,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'AFTER_SHOW_ITEMS',
  p_plug_source=> s,
  p_plug_source_type=> 'STATIC_TEXT',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => '',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
 
begin
 
null;
 
end;
/

 
begin
 
null;
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>6522222360583318 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 101,
  p_name=>'P101_USERNAME',
  p_data_type=> '',
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 10,
  p_item_plug_id => 6522110324583302+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> '',
  p_prompt=>'Username',
  p_display_as=> 'TEXT',
  p_lov_columns=> null,
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 40,
  p_cMaxlength=> 100,
  p_cHeight=> null,
  p_begin_on_new_line => 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan => 2,
  p_rowspan => 1,
  p_label_alignment  => 'RIGHT',
  p_field_alignment  => 'LEFT',
  p_field_template => 9029108958033222+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>6522314659583328 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 101,
  p_name=>'P101_PASSWORD',
  p_data_type=> '',
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 20,
  p_item_plug_id => 6522110324583302+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> '',
  p_prompt=>'Password',
  p_display_as=> 'PASSWORD_WITH_SUBMIT_DNSS',
  p_lov_columns=> null,
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 40,
  p_cMaxlength=> 100,
  p_cHeight=> null,
  p_begin_on_new_line => 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan => 1,
  p_rowspan => 1,
  p_label_alignment  => 'RIGHT',
  p_field_alignment  => 'LEFT',
  p_field_template => 9029108958033222+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>6522418394583329 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 101,
  p_name=>'P101_LOGIN',
  p_data_type=> '',
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 30,
  p_item_plug_id => 6522110324583302+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> '',
  p_item_default => 'Login',
  p_prompt=>'Login',
  p_source=>'LOGIN',
  p_source_type=> 'STATIC',
  p_display_as=> 'BUTTON',
  p_lov_columns=> null,
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> null,
  p_cMaxlength=> null,
  p_cHeight=> null,
  p_tag_attributes  => 'template:'||to_char(9029432560033223 + wwv_flow_api.g_id_offset),
  p_begin_on_new_line => 'NO',
  p_begin_on_new_field=> 'YES',
  p_colspan => 1,
  p_rowspan => 1,
  p_label_alignment  => 'LEFT',
  p_field_alignment  => 'LEFT',
  p_is_persistent=> 'Y',
  p_item_comment => '');
 
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'begin'||chr(10)||
'owa_util.mime_header(''text/html'', FALSE);'||chr(10)||
'owa_cookie.send('||chr(10)||
'    name=>''LOGIN_USERNAME_COOKIE'','||chr(10)||
'    value=>lower(:P101_USERNAME));'||chr(10)||
'exception when others then null;'||chr(10)||
'end;';

wwv_flow_api.create_page_process(
  p_id     => 6522621987583355 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 101,
  p_process_sequence=> 10,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Set Username Cookie',
  p_process_sql_clob => p, 
  p_process_error_message=> '',
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'wwv_flow_custom_auth_std.login('||chr(10)||
'    P_UNAME       => :P101_USERNAME,'||chr(10)||
'    P_PASSWORD    => :P101_PASSWORD,'||chr(10)||
'    P_SESSION_ID  => v(''APP_SESSION''),'||chr(10)||
'    P_FLOW_PAGE   => :APP_ID||'':1'''||chr(10)||
'    );';

wwv_flow_api.create_page_process(
  p_id     => 6522509775583346 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 101,
  p_process_sequence=> 20,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Login',
  p_process_sql_clob => p, 
  p_process_error_message=> '',
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'101';

wwv_flow_api.create_page_process(
  p_id     => 6522800171583357 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 101,
  p_process_sequence=> 30,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'CLEAR_CACHE_FOR_PAGES',
  p_process_name=> 'Clear Page(s) Cache',
  p_process_sql_clob => p, 
  p_process_error_message=> '',
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'declare'||chr(10)||
'    v varchar2(255) := null;'||chr(10)||
'    c owa_cookie.cookie;'||chr(10)||
'begin'||chr(10)||
'   c := owa_cookie.get(''LOGIN_USERNAME_COOKIE'');'||chr(10)||
'   :P101_USERNAME := c.vals(1);'||chr(10)||
'exception when others then null;'||chr(10)||
'end;';

wwv_flow_api.create_page_process(
  p_id     => 6522727272583356 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 101,
  p_process_sequence=> 10,
  p_process_point=> 'BEFORE_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Get Username Cookie',
  p_process_sql_clob => p, 
  p_process_error_message=> '',
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 101
--
 
begin
 
null;
end;
null;
 
end;
/

prompt  ...lists
--
--application/shared_components/navigation/lists/prod_links
 
begin
 
wwv_flow_api.create_list (
  p_id=> 6527109568227055 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'Prod_links',
  p_list_status=> 'PUBLIC',
  p_list_displayed=> 'BY_DEFAULT',
  p_display_row_template_id=> 9028005977033220 + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_list_item (
  p_id=> 6527321258249363 + wwv_flow_api.g_id_offset,
  p_list_id=> 6527109568227055 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>10,
  p_list_item_link_text=> 'eCPR Production',
  p_list_item_link_target=> 'http://dbsg017.eu.novartis.net:7781/apex/f?p=103:7',
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_list_item_current_type=> 'COLON_DELIMITED_PAGE_LIST',
  p_list_item_owner=> '');
 
wwv_flow_api.create_list_item (
  p_id=> 6528324899288287 + wwv_flow_api.g_id_offset,
  p_list_id=> 6527109568227055 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>30,
  p_list_item_link_text=> 'DSM Planning Tool Production ',
  p_list_item_link_target=> 'http://dbsg017.eu.novartis.net:7781/apex/f?p=860310:1 ',
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_list_item_current_type=> 'COLON_DELIMITED_PAGE_LIST',
  p_list_item_owner=> '');
 
wwv_flow_api.create_list_item (
  p_id=> 6528101350281497 + wwv_flow_api.g_id_offset,
  p_list_id=> 6527109568227055 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>50,
  p_list_item_link_text=> 'CPO Planning Tool & reports Production',
  p_list_item_link_target=> 'http://dbsg017.eu.novartis.net:7781/apex/f?p=101:7',
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_list_item_current_type=> 'COLON_DELIMITED_PAGE_LIST',
  p_list_item_owner=> '');
 
null;
 
end;
/

--application/shared_components/navigation/lists/test_links
 
begin
 
wwv_flow_api.create_list (
  p_id=> 6534826628689104 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'Test_links',
  p_list_status=> 'PUBLIC',
  p_list_displayed=> 'BY_DEFAULT',
  p_display_row_template_id=> 9028005977033220 + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_list_item (
  p_id=> 6535009184689107 + wwv_flow_api.g_id_offset,
  p_list_id=> 6534826628689104 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>10,
  p_list_item_link_text=> 'eCPR Test',
  p_list_item_link_target=> 'http://dbsg010.eu.novartis.net:7781/apex/f?p=104:7',
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_list_item_current_type=> 'COLON_DELIMITED_PAGE_LIST',
  p_list_item_owner=> '');
 
wwv_flow_api.create_list_item (
  p_id=> 6535301832689116 + wwv_flow_api.g_id_offset,
  p_list_id=> 6534826628689104 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>30,
  p_list_item_link_text=> 'DSM Planning Tool Test',
  p_list_item_link_target=> 'http://dbsg010.eu.novartis.net:7781/apex/f?p=860310:1 ',
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_list_item_current_type=> 'COLON_DELIMITED_PAGE_LIST',
  p_list_item_owner=> '');
 
wwv_flow_api.create_list_item (
  p_id=> 6535632425689116 + wwv_flow_api.g_id_offset,
  p_list_id=> 6534826628689104 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>50,
  p_list_item_link_text=> 'CPO Planning Tool & reports Test',
  p_list_item_link_target=> 'http://dbsg010.eu.novartis.net:7781/apex/f?p=101:7',
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_list_item_current_type=> 'COLON_DELIMITED_PAGE_LIST',
  p_list_item_owner=> '');
 
null;
 
end;
/

--application/shared_components/navigation/breadcrumbs
prompt  ...breadcrumbs
--
 
begin
 
wwv_flow_api.create_menu (
  p_id=> 6522907491583357 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> ' Breadcrumb');
 
null;
 
end;
/

prompt  ...page templates for application: 777
--
--application/shared_components/user_interface/templates/page/login
prompt  ......Page template 6514220765583047
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
c1:=c1||'<html lang="&BROWSER_LANGUAGE." xmlns:htmldb="http://htmldb.oracle.com">'||chr(10)||
'<head>'||chr(10)||
'<title>#TITLE#</title>'||chr(10)||
'<link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_1/theme_3_1.css" type="text/css" />'||chr(10)||
'#HEAD#'||chr(10)||
'</head>'||chr(10)||
'<body #ONLOAD#>#FORM_OPEN#';

c2:=c2||'<table width="100%" cellpadding="0" cellspacing="0" border="0" summary="">'||chr(10)||
'  <tr>'||chr(10)||
'    <td><img src="#IMAGE_PREFIX#themes/theme_1/bot_bar_left.png" alt="" /></td>'||chr(10)||
'    <td class="t1BotbarMiddle"><br /></td>'||chr(10)||
'    <td><img src="#IMAGE_PREFIX#themes/theme_1/bot_bar_right.png" alt="" /></td>'||chr(10)||
'  </tr>'||chr(10)||
'</table>'||chr(10)||
'<br />'||chr(10)||
'#FORM_CLOSE# '||chr(10)||
'</body>'||chr(10)||
'</html>';

c3:=c3||'<table width="100%" cellpadding="0" cellspacing="0" border="0" summary="">'||chr(10)||
'  <tr>'||chr(10)||
'    <td valign="top" class="t1Logo">#LOGO#</td>'||chr(10)||
'    <td align="right" valign="top"><br /></td>'||chr(10)||
'  </tr>'||chr(10)||
'</table>'||chr(10)||
'<table width="100%" cellpadding="0" cellspacing="0" border="0" summary="">'||chr(10)||
'  <tr>'||chr(10)||
'    <td><img src="#IMAGE_PREFIX#themes/theme_1/top_bar_left.png" alt="" /></td>'||chr(10)||
'    <td class="t1topbarMiddle"><br /></td>'||chr(10)||
' ';

c3:=c3||'   <td><img src="#IMAGE_PREFIX#themes/theme_1/top_bar_right.png" alt="" /></td>'||chr(10)||
'  </tr>'||chr(10)||
'</table>'||chr(10)||
'<table class="t1PageBody" cellpadding="0" cellspacing="0" border="0" summary="" width="100%" height="70%">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t1PageCenter" valign="top"><table summary="" cellpadding="0" width="100%" cellspacing="0" border="0">'||chr(10)||
'<tr>'||chr(10)||
'<td width="100%" valign="top" class="t1PageBody"><div class="t1messages">';

c3:=c3||'#GLOBAL_NOTIFICATION##SUCCESS_MESSAGE##NOTIFICATION_MESSAGE#</div>#BOX_BODY##REGION_POSITION_02##REGION_POSITION_03##REGION_POSITION_04##REGION_POSITION_05##REGION_POSITION_06##REGION_POSITION_07##REGION_POSITION_08#</td>'||chr(10)||
'</tr>'||chr(10)||
'</table></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>'||chr(10)||
'';

wwv_flow_api.create_template(
  p_id=> 6514220765583047 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'Login',
  p_body_title=> '',
  p_header_template=> c1,
  p_box=> c3,
  p_footer_template=> c2,
  p_success_message=> '<div class="t1success" id="MESSAGE"><img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''MESSAGE'')"  style="float:right;" class="pb" alt="" />#SUCCESS_MESSAGE#</div>',
  p_current_tab=> '',
  p_current_tab_font_attr=> '',
  p_non_current_tab=> '',
  p_non_current_tab_font_attr => '',
  p_top_current_tab=> '',
  p_top_current_tab_font_attr => '',
  p_top_non_curr_tab=> '',
  p_top_non_curr_tab_font_attr=> '',
  p_current_image_tab=> '',
  p_non_current_image_tab=> '',
  p_notification_message=> '<div class="t1notification" id="MESSAGE"><img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''MESSAGE'')"  style="float:right;" class="pb" alt="" />#MESSAGE#</div>',
  p_navigation_bar=> '',
  p_navbar_entry=> '',
  p_app_tab_before_tabs=>'',
  p_app_tab_current_tab=>'',
  p_app_tab_non_current_tab=>'',
  p_app_tab_after_tabs=>'',
  p_region_table_cattributes=> ' summary="" cellpadding="0" border="0" cellspacing="0"',
  p_theme_id  => 1,
  p_theme_class_id => 6,
  p_translate_this_template => 'N',
  p_template_comment => '18');
end;
 
null;
 
end;
/

--application/shared_components/user_interface/templates/page/no_tabs
prompt  ......Page template 6514330138583068
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
c1:=c1||'<html lang="&BROWSER_LANGUAGE." xmlns:htmldb="http://htmldb.oracle.com">'||chr(10)||
'<head>'||chr(10)||
'<title>#TITLE#</title>'||chr(10)||
'<link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_1/theme_3_1.css" type="text/css" />'||chr(10)||
'#HEAD#'||chr(10)||
'</head>'||chr(10)||
'<body #ONLOAD#>#FORM_OPEN#';

c2:=c2||'<table width="100%" cellpadding="0" cellspacing="0" border="0" summary="">'||chr(10)||
'  <tr>'||chr(10)||
'    <td><img src="#IMAGE_PREFIX#themes/theme_1/bot_bar_left.png" alt="" /></td>'||chr(10)||
'    <td class="t1BotbarMiddle"><div id="t1user">&APP_USER.</div></td>'||chr(10)||
'    <td class="t1BotbarMiddle"><div id="t1copy"><!-- Copyright Here --><span class="t1Customize">#CUSTOMIZE#</span></div></td>'||chr(10)||
'    <td><img src="#IMAGE_PREFIX#themes/th';

c2:=c2||'eme_1/bot_bar_right.png" alt="" /></td>'||chr(10)||
'  </tr>'||chr(10)||
'</table>'||chr(10)||
'<br />'||chr(10)||
'#REGION_POSITION_05#'||chr(10)||
'#FORM_CLOSE# '||chr(10)||
'</body>'||chr(10)||
'</html>';

c3:=c3||'<table width="100%" cellpadding="0" cellspacing="0" border="0" summary="">'||chr(10)||
'  <tr>'||chr(10)||
'    <td valign="top" class="t1Logo">#LOGO##REGION_POSITION_06#</td>'||chr(10)||
'   <td valign="top" width="100%">#REGION_POSITION_07#</td>'||chr(10)||
'    <td align="right" valign="top">#NAVIGATION_BAR##REGION_POSITION_08#</td>'||chr(10)||
'  </tr>'||chr(10)||
'</table>'||chr(10)||
'<table width="100%" cellpadding="0" cellspacing="0" border="0" summary="">'||chr(10)||
'  <tr>'||chr(10)||
'    <td><img sr';

c3:=c3||'c="#IMAGE_PREFIX#themes/theme_1/top_bar_left.png" alt="" /></td>'||chr(10)||
'    <td class="t1topbarMiddle"><br />#REGION_POSITION_01#</td>'||chr(10)||
'    <td><img src="#IMAGE_PREFIX#themes/theme_1/top_bar_right.png" alt="" /></td>'||chr(10)||
'  </tr>'||chr(10)||
'</table>'||chr(10)||
'<table class="t1PageBody" cellpadding="0" cellspacing="0" border="0" summary="" width="100%" height="70%">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t1PageCenter" valign="top"><table summary="" cellpa';

c3:=c3||'dding="0" width="100%" cellspacing="0" border="0">'||chr(10)||
'<tr>'||chr(10)||
'<td width="100%" valign="top" class="t1PageBody"><div class="t1messages">#GLOBAL_NOTIFICATION##SUCCESS_MESSAGE##NOTIFICATION_MESSAGE#</div>#BOX_BODY##REGION_POSITION_02##REGION_POSITION_04#</td>'||chr(10)||
'<td valign="top">#REGION_POSITION_03#<br /></td>'||chr(10)||
'</tr>'||chr(10)||
'</table></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>'||chr(10)||
'';

wwv_flow_api.create_template(
  p_id=> 6514330138583068 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'No Tabs',
  p_body_title=> '',
  p_header_template=> c1,
  p_box=> c3,
  p_footer_template=> c2,
  p_success_message=> '<div class="t1success" id="MESSAGE"><img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''MESSAGE'')"  style="float:right;" class="pb" alt="" />#SUCCESS_MESSAGE#</div>',
  p_current_tab=> '',
  p_current_tab_font_attr=> '',
  p_non_current_tab=> '',
  p_non_current_tab_font_attr => '',
  p_top_current_tab=> '',
  p_top_current_tab_font_attr => '',
  p_top_non_curr_tab=> '',
  p_top_non_curr_tab_font_attr=> '',
  p_current_image_tab=> '',
  p_non_current_image_tab=> '',
  p_notification_message=> '<div class="t1Notification" id="MESSAGE"><img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''MESSAGE'')"  style="float:right;" class="pb" alt="" />#MESSAGE#</div>',
  p_navigation_bar=> '<div class="t1NavigationBar">#BAR_BODY#</div>',
  p_navbar_entry=> '<a href="#LINK#" class="t1NavigationBar">#TEXT#</a>',
  p_app_tab_before_tabs=>'',
  p_app_tab_current_tab=>'',
  p_app_tab_non_current_tab=>'',
  p_app_tab_after_tabs=>'',
  p_region_table_cattributes=> ' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"',
  p_sidebar_def_reg_pos => 'REGION_POSITION_02',
  p_breadcrumb_def_reg_pos => 'REGION_POSITION_01',
  p_theme_id  => 1,
  p_theme_class_id => 3,
  p_translate_this_template => 'N',
  p_template_comment => '');
end;
 
null;
 
end;
/

--application/shared_components/user_interface/templates/page/no_tabs_with_side_bar
prompt  ......Page template 6514430537583069
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
c1:=c1||'<html lang="&BROWSER_LANGUAGE." xmlns:htmldb="http://htmldb.oracle.com">'||chr(10)||
'<head>'||chr(10)||
'<title>#TITLE#</title>'||chr(10)||
'<link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_1/theme_3_1.css" type="text/css" />'||chr(10)||
'#HEAD#'||chr(10)||
'</head>'||chr(10)||
'<body #ONLOAD#>#FORM_OPEN#';

c2:=c2||'<table width="100%" cellpadding="0" cellspacing="0" border="0" summary="">'||chr(10)||
'  <tr>'||chr(10)||
'    <td><img src="#IMAGE_PREFIX#themes/theme_1/bot_bar_left.png" alt="" /></td>'||chr(10)||
'    <td class="t1BotbarMiddle"><div id="t1user">&APP_USER.</div></td>'||chr(10)||
'    <td class="t1BotbarMiddle"><div id="t1copy"><!-- Copyright Here --><span class="t1Customize">#CUSTOMIZE#</span></div></td>'||chr(10)||
'    <td><img src="#IMAGE_PREFIX#themes/th';

c2:=c2||'eme_1/bot_bar_right.png" alt="" /></td>'||chr(10)||
'  </tr>'||chr(10)||
'</table>'||chr(10)||
'<br />'||chr(10)||
'#REGION_POSITION_05#'||chr(10)||
'#FORM_CLOSE# '||chr(10)||
'</body>'||chr(10)||
'</html>';

c3:=c3||'<table width="100%" cellpadding="0" cellspacing="0" border="0" summary="">'||chr(10)||
'  <tr>'||chr(10)||
'    <td valign="top" class="t1Logo">#LOGO##REGION_POSITION_06#</td>'||chr(10)||
'   <td valign="top" width="100%">#REGION_POSITION_07#</td>'||chr(10)||
'    <td align="right" valign="top">#NAVIGATION_BAR##REGION_POSITION_08#</td>'||chr(10)||
'  </tr>'||chr(10)||
'</table>'||chr(10)||
'<table width="100%" cellpadding="0" cellspacing="0" border="0" summary="" height="70%">'||chr(10)||
'  <tr>'||chr(10)||
'  ';

c3:=c3||'  <td class="t1topbarLeft" valign="top"><img src="#IMAGE_PREFIX#themes/theme_1/top_bar_far_left.png" alt="" /></td>'||chr(10)||
'    <td align="right" class="t1topbarLeft" colspan="2"  valign="top"><img src="#IMAGE_PREFIX#themes/theme_1/top_barleft2_1.png" alt="" /></td>'||chr(10)||
'    <td align="right" class="t1topbarLeft" valign="top"><img src="#IMAGE_PREFIX#themes/theme_1/top_barleft2_2.png" alt="" /></td>'||chr(10)||
'    <td cla';

c3:=c3||'ss="t1topbarMiddle" valign="top"><table height="100%" cellpadding="0" cellspacing="0" border="0" summary=""><tr><td height="20"><br /></td></tr><tr><td valign="bottom" height="20">#REGION_POSITION_01#</td></tr></table></td>'||chr(10)||
'    <td valign="top"><img src="#IMAGE_PREFIX#themes/theme_1/top_bar_right.png" alt="" /></td>'||chr(10)||
'  </tr>'||chr(10)||
'  <tr>'||chr(10)||
'    <td class="t1PageLeft" colspan="3" align="left" valign="top">#R';

c3:=c3||'EGION_POSITION_02#</td>'||chr(10)||
'    <td><br /></td>'||chr(10)||
'    <td class="t1PageRight" colspan="2" valign="top" height="100%"><table summary="" cellpadding="0" width="100%" cellspacing="0" border="0">'||chr(10)||
'<tr>'||chr(10)||
'<td width="100%" valign="top" class="t1PageBody"><div class="t1messages">#GLOBAL_NOTIFICATION##SUCCESS_MESSAGE##NOTIFICATION_MESSAGE#</div>#BOX_BODY##REGION_POSITION_04#</td>'||chr(10)||
'<td valign="top">#REGION_POSITION_';

c3:=c3||'03#<br /></td>'||chr(10)||
'</tr>'||chr(10)||
'</table></td>'||chr(10)||
'  </tr>'||chr(10)||
'</table>';

wwv_flow_api.create_template(
  p_id=> 6514430537583069 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'No Tabs with Side Bar',
  p_body_title=> '',
  p_header_template=> c1,
  p_box=> c3,
  p_footer_template=> c2,
  p_success_message=> '<div class="t1success" id="MESSAGE"><img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''MESSAGE'')"  style="float:right;" class="pb" alt="" />#SUCCESS_MESSAGE#</div>',
  p_current_tab=> '',
  p_current_tab_font_attr=> '',
  p_non_current_tab=> '',
  p_non_current_tab_font_attr => '',
  p_top_current_tab=> '',
  p_top_current_tab_font_attr => '',
  p_top_non_curr_tab=> '',
  p_top_non_curr_tab_font_attr=> '',
  p_current_image_tab=> '',
  p_non_current_image_tab=> '',
  p_notification_message=> '<div class="t1notification" id="MESSAGE"><img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''MESSAGE'')"  style="float:right;" class="pb" alt="" />#MESSAGE#</div>',
  p_navigation_bar=> '<div class="t1NavigationBar">#BAR_BODY#</div>',
  p_navbar_entry=> '<a href="#LINK#" class="t1NavigationBar">#TEXT#</a>',
  p_app_tab_before_tabs=>'',
  p_app_tab_current_tab=>'',
  p_app_tab_non_current_tab=>'',
  p_app_tab_after_tabs=>'',
  p_region_table_cattributes=> 'summary="" cellpadding="0" border="0" cellspacing="0" width="100%"',
  p_sidebar_def_reg_pos => 'REGION_POSITION_02',
  p_breadcrumb_def_reg_pos => 'REGION_POSITION_01',
  p_theme_id  => 1,
  p_theme_class_id => 17,
  p_translate_this_template => 'N',
  p_template_comment => '');
end;
 
null;
 
end;
/

--application/shared_components/user_interface/templates/page/one_level_tabs
prompt  ......Page template 6514502854583071
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
c1:=c1||'<html lang="&BROWSER_LANGUAGE." xmlns:htmldb="http://htmldb.oracle.com">'||chr(10)||
'<head>'||chr(10)||
'<title>#TITLE#</title>'||chr(10)||
'<link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_1/theme_3_1.css" type="text/css" />'||chr(10)||
'#HEAD#'||chr(10)||
'</head>'||chr(10)||
'<body #ONLOAD#>#FORM_OPEN#';

c2:=c2||'<table width="100%" cellpadding="0" cellspacing="0" border="0" summary="">'||chr(10)||
'  <tr>'||chr(10)||
'    <td><img src="#IMAGE_PREFIX#themes/theme_1/bot_bar_left.png" alt="" /></td>'||chr(10)||
'    <td class="t1BotbarMiddle"><div id="t1user">&APP_USER.</div></td>'||chr(10)||
'    <td class="t1BotbarMiddle"><div id="t1copy"><!-- Copyright Here --><span class="t1Customize">#CUSTOMIZE#</span></div></td>'||chr(10)||
'    <td><img src="#IMAGE_PREFIX#themes/th';

c2:=c2||'eme_1/bot_bar_right.png" alt="" /></td>'||chr(10)||
'  </tr>'||chr(10)||
'</table>'||chr(10)||
'<br />'||chr(10)||
'#REGION_POSITION_05#'||chr(10)||
'#FORM_CLOSE# '||chr(10)||
'</body>'||chr(10)||
'</html>';

c3:=c3||'<table width="100%" cellpadding="0" cellspacing="0" border="0" summary="">'||chr(10)||
'  <tr>'||chr(10)||
'    <td valign="top" class="t1Logo">#LOGO##REGION_POSITION_06#</td>'||chr(10)||
'   <td valign="top" width="100%">#REGION_POSITION_07#</td>'||chr(10)||
'    <td align="right" valign="top">#NAVIGATION_BAR##REGION_POSITION_08#</td>'||chr(10)||
'  </tr>'||chr(10)||
'</table>'||chr(10)||
'<table width="100%" cellpadding="0" cellspacing="0" border="0" summary="" height="70%">'||chr(10)||
'  <tr>'||chr(10)||
'  ';

c3:=c3||'  <td colspan="5" class="t1ParentTabHolder"><table border="0" cellpadding="0" cellspacing="0" summary="" align="right"><tr><td><br /></td>#TAB_CELLS#</tr></table></td>'||chr(10)||
'  </tr>'||chr(10)||
'  <tr>'||chr(10)||
'    <td valign="top"><img src="#IMAGE_PREFIX#themes/theme_1/top_bar_left.png" alt="" /></td>'||chr(10)||
'    <td class="t1topbarMiddle" valign="bottom"><table cellpadding="0" cellspacing="0" border="0" summary=""><tr><td height="';

c3:=c3||'50%"><br /></td></tr><tr><td height="50%">#REGION_POSITION_01#</td></tr></table></td>'||chr(10)||
'    <td valign="top"><img src="#IMAGE_PREFIX#themes/theme_1/top_bar_right.png" alt="" /></td>'||chr(10)||
'  </tr>'||chr(10)||
'<tr>'||chr(10)||
'<td><br /></td>'||chr(10)||
'<td class="t1PageCenter" colspan="2" valign="top" height="100%"><table summary="" cellpadding="0" width="100%" cellspacing="0" border="0">'||chr(10)||
'<tr>'||chr(10)||
'<td width="100%" valign="top" class="t1PageBody';

c3:=c3||'"><div class="t1messages">#GLOBAL_NOTIFICATION##SUCCESS_MESSAGE##NOTIFICATION_MESSAGE#</div>#BOX_BODY##REGION_POSITION_02##REGION_POSITION_04#</td>'||chr(10)||
'<td valign="top">#REGION_POSITION_03#<br /></td>'||chr(10)||
'</tr>'||chr(10)||
'</table></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>';

wwv_flow_api.create_template(
  p_id=> 6514502854583071 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'One Level Tabs',
  p_body_title=> '',
  p_header_template=> c1,
  p_box=> c3,
  p_footer_template=> c2,
  p_success_message=> '<div class="t1success" id="MESSAGE"><img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''MESSAGE'')"  style="float:right;" class="pb" alt="" />#SUCCESS_MESSAGE#</div>',
  p_current_tab=> '<td><img src="#IMAGE_PREFIX#themes/theme_1/tab_on_left.png" border="0" alt="" /></td>'||chr(10)||
'<td class="t1ParentTabCenterOn">#TAB_LABEL##TAB_INLINE_EDIT#</td>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_1/tab_on_right.png" border="0" alt="" /></td>'||chr(10)||
''||chr(10)||
'',
  p_current_tab_font_attr=> '',
  p_non_current_tab=> '<td><img src="#IMAGE_PREFIX#themes/theme_1/tab_off_left.png" border="0" alt="" /></td>'||chr(10)||
'<td class="t1ParentTabCenterOff"><a href="#TAB_LINK#">#TAB_LABEL#</a>#TAB_INLINE_EDIT#</td>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_1/tab_off_right.png" border="0" alt="" /></td>'||chr(10)||
'',
  p_non_current_tab_font_attr => '',
  p_top_current_tab=> '',
  p_top_current_tab_font_attr => '',
  p_top_non_curr_tab=> '',
  p_top_non_curr_tab_font_attr=> '',
  p_current_image_tab=> '',
  p_non_current_image_tab=> '',
  p_notification_message=> '<div class="t1notification" id="MESSAGE"><img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''MESSAGE'')"  style="float:right;" class="pb" alt="" />#MESSAGE#</div>',
  p_navigation_bar=> '<div class="t1NavigationBar">#BAR_BODY#</div>',
  p_navbar_entry=> '<a href="#LINK#" class="t1NavigationBar">#TEXT#</a>',
  p_app_tab_before_tabs=>'',
  p_app_tab_current_tab=>'',
  p_app_tab_non_current_tab=>'',
  p_app_tab_after_tabs=>'',
  p_region_table_cattributes=> ' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"',
  p_breadcrumb_def_reg_pos => 'REGION_POSITION_01',
  p_theme_id  => 1,
  p_theme_class_id => 1,
  p_translate_this_template => 'N',
  p_template_comment => '12');
end;
 
null;
 
end;
/

--application/shared_components/user_interface/templates/page/one_level_tabs_with_side_bar
prompt  ......Page template 6514619610583073
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
c1:=c1||'<html lang="&BROWSER_LANGUAGE." xmlns:htmldb="http://htmldb.oracle.com">'||chr(10)||
'<head>'||chr(10)||
'<title>#TITLE#</title>'||chr(10)||
'<link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_1/theme_3_1.css" type="text/css" />'||chr(10)||
'#HEAD#'||chr(10)||
'</head>'||chr(10)||
'<body #ONLOAD#>#FORM_OPEN#';

c2:=c2||'<table width="100%" cellpadding="0" cellspacing="0" border="0" summary="">'||chr(10)||
'  <tr>'||chr(10)||
'    <td><img src="#IMAGE_PREFIX#themes/theme_1/bot_bar_left.png" alt="" /></td>'||chr(10)||
'    <td class="t1BotbarMiddle"><div id="t1user">&APP_USER.</div></td>'||chr(10)||
'    <td class="t1BotbarMiddle"><div id="t1copy"><!-- Copyright Here --><span class="t1Customize">#CUSTOMIZE#</span></div></td>'||chr(10)||
'    <td><img src="#IMAGE_PREFIX#themes/th';

c2:=c2||'eme_1/bot_bar_right.png" alt="" /></td>'||chr(10)||
'  </tr>'||chr(10)||
'</table>'||chr(10)||
'<br />'||chr(10)||
'#REGION_POSITION_05#'||chr(10)||
'#FORM_CLOSE# '||chr(10)||
'</body>'||chr(10)||
'</html>';

c3:=c3||'<table width="100%" cellpadding="0" cellspacing="0" border="0" summary="">'||chr(10)||
'  <tr>'||chr(10)||
'    <td valign="top" class="t1Logo">#LOGO##REGION_POSITION_06#</td>'||chr(10)||
'   <td valign="top" width="100%">#REGION_POSITION_07#</td>'||chr(10)||
'    <td align="right" valign="top">#NAVIGATION_BAR##REGION_POSITION_08#</td>'||chr(10)||
'  </tr>'||chr(10)||
'</table>'||chr(10)||
'<table width="100%" cellpadding="0" cellspacing="0" border="0" summary="" height="70%">'||chr(10)||
'  <tr>'||chr(10)||
'  ';

c3:=c3||'  <td colspan="5" class="t1ParentTabHolder"><table border="0" cellpadding="0" cellspacing="0" summary="" align="right"><tr><td><br /></td>#TAB_CELLS#</tr></table></td>'||chr(10)||
'  </tr>'||chr(10)||
'  <tr>'||chr(10)||
'    <td class="t1topbarLeft" valign="top"><img src="#IMAGE_PREFIX#themes/theme_1/top_bar_far_left.png" alt="" /></td>'||chr(10)||
'    <td align="right" class="t1topbarLeft" colspan="2"  valign="top"><img src="#IMAGE_PREFIX#themes';

c3:=c3||'/theme_1/top_barleft2_1.png" alt="" /></td>'||chr(10)||
'    <td align="right" class="t1topbarLeft" valign="top"><img src="#IMAGE_PREFIX#themes/theme_1/top_barleft2_2.png" alt="" /></td>'||chr(10)||
'    <td class="t1topbarMiddle" valign="top"><table height="100%" cellpadding="0" cellspacing="0" border="0" summary=""><tr><td height="20"><br /></td></tr><tr><td valign="bottom" height="20">#REGION_POSITION_01#</td></tr></tab';

c3:=c3||'le></td>'||chr(10)||
'    <td valign="top"><img src="#IMAGE_PREFIX#themes/theme_1/top_bar_right.png" alt="" /></td>'||chr(10)||
'  </tr>'||chr(10)||
'  <tr>'||chr(10)||
'    <td class="t1PageLeft" colspan="3" align="left" valign="top">#REGION_POSITION_02#</td>'||chr(10)||
'    <td><br /></td>'||chr(10)||
'    <td class="t1PageRight" colspan="2" valign="top" height="100%"><table summary="" cellpadding="0" width="100%" cellspacing="0" border="0">'||chr(10)||
'<tr>'||chr(10)||
'<td width="100%" valign=';

c3:=c3||'"top" class="t1PageBody"><div class="t1messages">#GLOBAL_NOTIFICATION##SUCCESS_MESSAGE##NOTIFICATION_MESSAGE#</div>#BOX_BODY##REGION_POSITION_04#</td>'||chr(10)||
'<td valign="top">#REGION_POSITION_03#<br /></td>'||chr(10)||
'</tr>'||chr(10)||
'</table></td>'||chr(10)||
'  </tr>'||chr(10)||
'</table>';

wwv_flow_api.create_template(
  p_id=> 6514619610583073 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'One Level Tabs with Side Bar',
  p_body_title=> '',
  p_header_template=> c1,
  p_box=> c3,
  p_footer_template=> c2,
  p_success_message=> '<div class="t1success" id="MESSAGE"><img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''MESSAGE'')"  style="float:right;" class="pb" alt="" />#SUCCESS_MESSAGE#</div>',
  p_current_tab=> '<td><img src="#IMAGE_PREFIX#themes/theme_1/tab_on_left.png" border="0" alt="" /></td>'||chr(10)||
'<td class="t1ParentTabCenterOn">#TAB_LABEL##TAB_INLINE_EDIT#</td>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_1/tab_on_right.png" border="0" alt="" /></td>'||chr(10)||
'',
  p_current_tab_font_attr=> '',
  p_non_current_tab=> '<td><img src="#IMAGE_PREFIX#themes/theme_1/tab_off_left.png" border="0" alt="" /></td>'||chr(10)||
'<td class="t1ParentTabCenterOff"><a href="#TAB_LINK#">#TAB_LABEL#</a>#TAB_INLINE_EDIT#</td>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_1/tab_off_right.png" border="0" alt="" /></td>'||chr(10)||
'',
  p_non_current_tab_font_attr => '',
  p_top_current_tab=> '',
  p_top_current_tab_font_attr => '',
  p_top_non_curr_tab=> '',
  p_top_non_curr_tab_font_attr=> '',
  p_current_image_tab=> '',
  p_non_current_image_tab=> '',
  p_notification_message=> '<div class="t2notification" id="MESSAGE"><img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''MESSAGE'')"  style="float:right;" class="pb" alt="" />#MESSAGE#</div>',
  p_navigation_bar=> '<div class="t1NavigationBar">#BAR_BODY#</div>',
  p_navbar_entry=> '<a href="#LINK#" class="t1NavigationBar">#TEXT#</a>',
  p_app_tab_before_tabs=>'',
  p_app_tab_current_tab=>'',
  p_app_tab_non_current_tab=>'',
  p_app_tab_after_tabs=>'',
  p_region_table_cattributes=> ' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"',
  p_sidebar_def_reg_pos => 'REGION_POSITION_02',
  p_breadcrumb_def_reg_pos => 'REGION_POSITION_01',
  p_theme_id  => 1,
  p_theme_class_id => 16,
  p_translate_this_template => 'N',
  p_template_comment => '');
end;
 
null;
 
end;
/

--application/shared_components/user_interface/templates/page/popup
prompt  ......Page template 6514704383583074
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
c1:=c1||'<html lang="&BROWSER_LANGUAGE." xmlns:htmldb="http://htmldb.oracle.com">'||chr(10)||
'<head>'||chr(10)||
'<title>#TITLE#</title>'||chr(10)||
'<link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_1/theme_3_1.css" type="text/css" />'||chr(10)||
'#HEAD#'||chr(10)||
'</head>'||chr(10)||
'<body #ONLOAD#>#FORM_OPEN#';

c2:=c2||'#FORM_CLOSE#</body>'||chr(10)||
'</html>';

c3:=c3||'<table summary="" cellpadding="0" width="100%" cellspacing="0" border="0">'||chr(10)||
'<tr>'||chr(10)||
'<td width="100%" valign="top"><div class="t1messages">#SUCCESS_MESSAGE##NOTIFICATION_MESSAGE#</div>#BOX_BODY##REGION_POSITION_01##REGION_POSITION_02##REGION_POSITION_04##REGION_POSITION_05##REGION_POSITION_06##REGION_POSITION_07##REGION_POSITION_08#</td>'||chr(10)||
'<td valign="top">#REGION_POSITION_03#<br /></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>';

wwv_flow_api.create_template(
  p_id=> 6514704383583074 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'Popup',
  p_body_title=> '',
  p_header_template=> c1,
  p_box=> c3,
  p_footer_template=> c2,
  p_success_message=> '<div class="t1success" id="MESSAGE"><img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''MESSAGE'')"  style="float:right;" class="pb" alt="" />#SUCCESS_MESSAGE#</div>',
  p_current_tab=> '',
  p_current_tab_font_attr=> '',
  p_non_current_tab=> '',
  p_non_current_tab_font_attr => '',
  p_top_current_tab=> '',
  p_top_current_tab_font_attr => '',
  p_top_non_curr_tab=> '',
  p_top_non_curr_tab_font_attr=> '',
  p_current_image_tab=> '',
  p_non_current_image_tab=> '',
  p_notification_message=> '<div class="t1notification" id="MESSAGE"><img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''MESSAGE'')"  style="float:right;" class="pb" alt="" />#MESSAGE#</div>',
  p_navigation_bar=> '#BAR_BODY#',
  p_navbar_entry=> '<a href="#LINK#">#TEXT#</a>',
  p_app_tab_before_tabs=>'',
  p_app_tab_current_tab=>'',
  p_app_tab_non_current_tab=>'',
  p_app_tab_after_tabs=>'',
  p_region_table_cattributes=> ' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"',
  p_theme_id  => 1,
  p_theme_class_id => 4,
  p_translate_this_template => 'N',
  p_template_comment => '');
end;
 
null;
 
end;
/

--application/shared_components/user_interface/templates/page/printer_friendly
prompt  ......Page template 6514820359583074
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
c1:=c1||'<html lang="&BROWSER_LANGUAGE." xmlns:htmldb="http://htmldb.oracle.com">'||chr(10)||
'<head>'||chr(10)||
'<title>#TITLE#</title>'||chr(10)||
'<link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_1/theme_3_1.css" type="text/css" />'||chr(10)||
'#HEAD#'||chr(10)||
'</head>'||chr(10)||
'<body #ONLOAD#>#FORM_OPEN#';

c2:=c2||'#FORM_CLOSE#</body>'||chr(10)||
'</html>';

c3:=c3||'<table summary="" cellpadding="0" width="100%" cellspacing="0" border="0">'||chr(10)||
'<tr>'||chr(10)||
'<td width="100%" valign="top">'||chr(10)||
'<div style="border:1px solid black;">#SUCCESS_MESSAGE##NOTIFICATION_MESSAGE#</div>'||chr(10)||
'#BOX_BODY##REGION_POSITION_04#</td>'||chr(10)||
'<td valign="top">#REGION_POSITION_03#<br /></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>';

wwv_flow_api.create_template(
  p_id=> 6514820359583074 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'Printer Friendly',
  p_body_title=> '',
  p_header_template=> c1,
  p_box=> c3,
  p_footer_template=> c2,
  p_success_message=> '',
  p_current_tab=> '',
  p_current_tab_font_attr=> '',
  p_non_current_tab=> '',
  p_non_current_tab_font_attr => '',
  p_top_current_tab=> '',
  p_top_current_tab_font_attr => '',
  p_top_non_curr_tab=> '',
  p_top_non_curr_tab_font_attr=> '',
  p_current_image_tab=> '',
  p_non_current_image_tab=> '',
  p_notification_message=> '',
  p_navigation_bar=> '',
  p_navbar_entry=> '',
  p_app_tab_before_tabs=>'',
  p_app_tab_current_tab=>'',
  p_app_tab_non_current_tab=>'',
  p_app_tab_after_tabs=>'',
  p_region_table_cattributes=> ' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"',
  p_theme_id  => 1,
  p_theme_class_id => 5,
  p_translate_this_template => 'N',
  p_template_comment => '3');
end;
 
null;
 
end;
/

--application/shared_components/user_interface/templates/page/two_level_tabs
prompt  ......Page template 6514909737583075
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
c1:=c1||'<html lang="&BROWSER_LANGUAGE." xmlns:htmldb="http://htmldb.oracle.com">'||chr(10)||
'<head>'||chr(10)||
'<title>#TITLE#</title>'||chr(10)||
'<link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_1/theme_3_1.css" type="text/css" />'||chr(10)||
'#HEAD#'||chr(10)||
'</head>'||chr(10)||
'<body #ONLOAD#>#FORM_OPEN#';

c2:=c2||'<table width="100%" cellpadding="0" cellspacing="0" border="0" summary="">'||chr(10)||
'  <tr>'||chr(10)||
'    <td><img src="#IMAGE_PREFIX#themes/theme_1/bot_bar_left.png" alt="" /></td>'||chr(10)||
'    <td class="t1BotbarMiddle"><div id="t1user">&APP_USER.</div></td>'||chr(10)||
'    <td class="t1BotbarMiddle"><div id="t1copy"><!-- Copyright Here --><span class="t1Customize">#CUSTOMIZE#</span></div></td>'||chr(10)||
'    <td><img src="#IMAGE_PREFIX#themes/th';

c2:=c2||'eme_1/bot_bar_right.png" alt="" /></td>'||chr(10)||
'  </tr>'||chr(10)||
'</table>'||chr(10)||
'<br />'||chr(10)||
'#REGION_POSITION_05#'||chr(10)||
'#FORM_CLOSE# '||chr(10)||
'</body>'||chr(10)||
'</html>';

c3:=c3||'<table width="100%" cellpadding="0" cellspacing="0" border="0" summary="">'||chr(10)||
'  <tr>'||chr(10)||
'    <td valign="top" class="t1Logo">#LOGO##REGION_POSITION_06#</td>'||chr(10)||
'   <td valign="top" width="100%">#REGION_POSITION_07#</td>'||chr(10)||
'    <td align="right" valign="top">#NAVIGATION_BAR##REGION_POSITION_08#</td>'||chr(10)||
'  </tr>'||chr(10)||
'</table>'||chr(10)||
'<table width="100%" cellpadding="0" cellspacing="0" border="0" summary="" height="70%">'||chr(10)||
'  <tr>'||chr(10)||
'  ';

c3:=c3||'  <td colspan="5" class="t1ParentTabHolder"><table border="0" cellpadding="0" cellspacing="0" summary="" align="right"><tr><td><br /></td>#PARENT_TAB_CELLS#</tr></table></td>'||chr(10)||
'  </tr>'||chr(10)||
'  <tr>'||chr(10)||
'    <td align="right" class="t1topbarLeft"><img src="#IMAGE_PREFIX#themes/theme_1/top_bar_left2.png" alt="" /></td>'||chr(10)||
'    <td class="t1topbarMiddle" valign="top"><table border="0" cellpadding="0" cellspacing="0" ';

c3:=c3||'summary=""><tr><td height="20">#TAB_CELLS#</td></tr><tr><td height="20">#REGION_POSITION_01#</td></tr></table></td>'||chr(10)||
'    <td><img src="#IMAGE_PREFIX#themes/theme_1/top_bar_right.png" alt="" /></td>'||chr(10)||
'  </tr>'||chr(10)||
'  <tr>'||chr(10)||
'    <td><br /></td>'||chr(10)||
'    <td class="t1PageRight" colspan="2" valign="top" height="100%"><table summary="" cellpadding="0" width="100%" cellspacing="0" border="0">'||chr(10)||
'<tr>'||chr(10)||
'<td width="100%" vali';

c3:=c3||'gn="top" class="t1PageBody"><div class="t1messages">#GLOBAL_NOTIFICATION##SUCCESS_MESSAGE##NOTIFICATION_MESSAGE#</div>#BOX_BODY##REGION_POSITION_02##REGION_POSITION_04#</td>'||chr(10)||
'<td valign="top">#REGION_POSITION_03#<br /></td>'||chr(10)||
'</tr>'||chr(10)||
'</table></td>'||chr(10)||
'  </tr>'||chr(10)||
'</table>';

wwv_flow_api.create_template(
  p_id=> 6514909737583075 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'Two Level Tabs',
  p_body_title=> '',
  p_header_template=> c1,
  p_box=> c3,
  p_footer_template=> c2,
  p_success_message=> '<div class="t1success" id="MESSAGE"><img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''MESSAGE'')"  style="float:right;" class="pb" alt="" />#SUCCESS_MESSAGE#</div>',
  p_current_tab=> '<span class="t1ChildTab">[&nbsp;#TAB_LABEL#&nbsp;]</span>#TAB_INLINE_EDIT#',
  p_current_tab_font_attr=> '',
  p_non_current_tab=> '<a href="#TAB_LINK#" class="t1ChildTab">#TAB_LABEL#</a>#TAB_INLINE_EDIT#',
  p_non_current_tab_font_attr => '',
  p_top_current_tab=> '<td><img src="#IMAGE_PREFIX#themes/theme_1/tab_on_left.png" border="0" alt="" /></td>'||chr(10)||
'<td class="t1ParentTabCenterOn">#TAB_LABEL##TAB_INLINE_EDIT#</td>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_1/tab_on_right.png" border="0" alt="" /></td>',
  p_top_current_tab_font_attr => '',
  p_top_non_curr_tab=> '<td><img src="#IMAGE_PREFIX#themes/theme_1/tab_off_left.png" border="0" alt="" /></td>'||chr(10)||
'<td class="t1ParentTabCenterOff"><a href="#TAB_LINK#">#TAB_LABEL#</a>#TAB_INLINE_EDIT#</td>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_1/tab_off_right.png" border="0" alt="" /></td>',
  p_top_non_curr_tab_font_attr=> '',
  p_current_image_tab=> '',
  p_non_current_image_tab=> '',
  p_notification_message=> '<div class="t1notification" id="MESSAGE"><img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''MESSAGE'')"  style="float:right;" class="pb" alt="" />#MESSAGE#</div>',
  p_navigation_bar=> '<div class="t1NavigationBar">#BAR_BODY#</div>',
  p_navbar_entry=> '<a href="#LINK#" class="t1NavigationBar">#TEXT#</a>',
  p_app_tab_before_tabs=>'',
  p_app_tab_current_tab=>'',
  p_app_tab_non_current_tab=>'',
  p_app_tab_after_tabs=>'',
  p_region_table_cattributes=> ' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"',
  p_breadcrumb_def_reg_pos => 'REGION_POSITION_01',
  p_theme_id  => 1,
  p_theme_class_id => 2,
  p_translate_this_template => 'N',
  p_template_comment => '');
end;
 
null;
 
end;
/

--application/shared_components/user_interface/templates/page/two_level_tabs_with_side_bar
prompt  ......Page template 6515000470583076
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
c1:=c1||'<html lang="&BROWSER_LANGUAGE." xmlns:htmldb="http://htmldb.oracle.com">'||chr(10)||
'<head>'||chr(10)||
'<title>#TITLE#</title>'||chr(10)||
'<link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_1/theme_3_1.css" type="text/css" />'||chr(10)||
'#HEAD#'||chr(10)||
'</head>'||chr(10)||
'<body #ONLOAD#>#FORM_OPEN#';

c2:=c2||'<table width="100%" cellpadding="0" cellspacing="0" border="0" summary="">'||chr(10)||
'  <tr>'||chr(10)||
'    <td><img src="#IMAGE_PREFIX#themes/theme_1/bot_bar_left.png" alt="" /></td>'||chr(10)||
'    <td class="t1BotbarMiddle"><div id="t1user">&APP_USER.</div></td>'||chr(10)||
'    <td class="t1BotbarMiddle"><div id="t1copy"><!-- Copyright Here --><span class="t1Customize">#CUSTOMIZE#</span></div></td>'||chr(10)||
'    <td><img src="#IMAGE_PREFIX#themes/th';

c2:=c2||'eme_1/bot_bar_right.png" alt="" /></td>'||chr(10)||
'  </tr>'||chr(10)||
'</table>'||chr(10)||
'<br />'||chr(10)||
'#REGION_POSITION_05#'||chr(10)||
'#FORM_CLOSE# '||chr(10)||
'</body>'||chr(10)||
'</html>';

c3:=c3||'<table width="100%" cellpadding="0" cellspacing="0" border="0" summary="">'||chr(10)||
'  <tr>'||chr(10)||
'    <td valign="top" class="t1Logo">#LOGO##REGION_POSITION_06#</td>'||chr(10)||
'   <td valign="top" width="100%">#REGION_POSITION_07#</td>'||chr(10)||
'    <td align="right" valign="top">#NAVIGATION_BAR##REGION_POSITION_08#</td>'||chr(10)||
'  </tr>'||chr(10)||
'</table>'||chr(10)||
'<table width="100%" cellpadding="0" cellspacing="0" border="0" summary="" height="70%">'||chr(10)||
'  <tr>'||chr(10)||
'  ';

c3:=c3||'  <td colspan="5" class="t1ParentTabHolder"><table border="0" cellpadding="0" cellspacing="0" summary="" align="right"><tr><td><br /></td>#PARENT_TAB_CELLS#</tr></table></td>'||chr(10)||
'  </tr>'||chr(10)||
'  <tr>'||chr(10)||
'    <td class="t1topbarLeft" valign="top"><img src="#IMAGE_PREFIX#themes/theme_1/top_bar_far_left.png" alt="" /></td>'||chr(10)||
'    <td class="t1topbarLeft" colspan="2"  valign="top"><img src="#IMAGE_PREFIX#themes/theme_';

c3:=c3||'1/top_barleft2_1.png" alt="" /></td>'||chr(10)||
'    <td class="t1topbarLeft" valign="top"><img src="#IMAGE_PREFIX#themes/theme_1/top_barleft2_2.png" alt="" /></td>'||chr(10)||
'    <td class="t1topbarMiddle" valign="top"><table height="100%" cellpadding="0" cellspacing="0" border="0" summary=""><tr><td height="20">#TAB_CELLS#</td></tr><tr><td valign="bottom" height="20">#REGION_POSITION_01#</td></tr></table></td>'||chr(10)||
'    <td';

c3:=c3||' valign="top"><img src="#IMAGE_PREFIX#themes/theme_1/top_bar_right.png" alt="" /></td>'||chr(10)||
'  </tr>'||chr(10)||
'  <tr>'||chr(10)||
'    <td class="t1PageLeft" colspan="3" align="left" valign="top">#REGION_POSITION_02#</td>'||chr(10)||
'    <td><br /></td>'||chr(10)||
'    <td class="t1PageRight" colspan="2" valign="top" height="100%"><table summary="" cellpadding="0" width="100%" cellspacing="0" border="0">'||chr(10)||
'<tr>'||chr(10)||
'<td width="100%" valign="top" class="t1P';

c3:=c3||'ageBody"><div class="t1messages">#GLOBAL_NOTIFICATION##SUCCESS_MESSAGE##NOTIFICATION_MESSAGE#</div>#BOX_BODY##REGION_POSITION_04#</td>'||chr(10)||
'<td valign="top">#REGION_POSITION_03#<br /></td>'||chr(10)||
'</tr>'||chr(10)||
'</table></td>'||chr(10)||
'  </tr>'||chr(10)||
'</table>';

wwv_flow_api.create_template(
  p_id=> 6515000470583076 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'Two Level Tabs with Side Bar',
  p_body_title=> '',
  p_header_template=> c1,
  p_box=> c3,
  p_footer_template=> c2,
  p_success_message=> '<div class="t1success" id="MESSAGE"><img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''MESSAGE'')"  style="float:right;" class="pb" alt="" />#SUCCESS_MESSAGE#</div>',
  p_current_tab=> '<span class="t1ChildTab">[&nbsp;#TAB_LABEL#&nbsp;]</span>#TAB_INLINE_EDIT#',
  p_current_tab_font_attr=> '',
  p_non_current_tab=> '<a href="#TAB_LINK#" class="t1ChildTab">#TAB_LABEL#</a>#TAB_INLINE_EDIT#',
  p_non_current_tab_font_attr => '',
  p_top_current_tab=> '<td><img src="#IMAGE_PREFIX#themes/theme_1/tab_on_left.png" border="0" alt="" /></td>'||chr(10)||
'<td class="t1ParentTabCenterOn">#TAB_LABEL##TAB_INLINE_EDIT#</td>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_1/tab_on_right.png" border="0" alt="" /></td>',
  p_top_current_tab_font_attr => '',
  p_top_non_curr_tab=> '<td><img src="#IMAGE_PREFIX#themes/theme_1/tab_off_left.png" border="0" alt="" /></td>'||chr(10)||
'<td class="t1ParentTabCenterOff"><a href="#TAB_LINK#">#TAB_LABEL#</a>#TAB_INLINE_EDIT#</td>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_1/tab_off_right.png" border="0" alt="" /></td>',
  p_top_non_curr_tab_font_attr=> '',
  p_current_image_tab=> '',
  p_non_current_image_tab=> '',
  p_notification_message=> '<div class="t1notification" id="MESSAGE"><img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''MESSAGE'')"  style="float:right;" class="pb" alt="" />#MESSAGE#</div>',
  p_navigation_bar=> '<div class="t1NavigationBar">#BAR_BODY#</div>',
  p_navbar_entry=> '<a href="#LINK#" class="t1NavigationBar">#TEXT#</a>',
  p_app_tab_before_tabs=>'',
  p_app_tab_current_tab=>'',
  p_app_tab_non_current_tab=>'',
  p_app_tab_after_tabs=>'',
  p_region_table_cattributes=> ' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"',
  p_sidebar_def_reg_pos => 'REGION_POSITION_02',
  p_breadcrumb_def_reg_pos => 'REGION_POSITION_01',
  p_theme_id  => 1,
  p_theme_class_id => 18,
  p_translate_this_template => 'N',
  p_template_comment => '');
end;
 
null;
 
end;
/

--application/shared_components/user_interface/templates/page/dsm_impala_main_page
prompt  ......Page template 6524517196954855
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
c1:=c1||'<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">'||chr(10)||
''||chr(10)||
'<html lang="en">'||chr(10)||
''||chr(10)||
'<head>'||chr(10)||
''||chr(10)||
'<title>IMPALA</title>'||chr(10)||
''||chr(10)||
'  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">'||chr(10)||
'  <meta name="description" content="DSM Overage Guidance Tool">'||chr(10)||
'  <meta name="keywords" content="DSM Overage Guidance Tool">'||chr(10)||
'  <meta name="audience" content="PUB">'||chr(10)||
'  <meta name="sector" content="pharmaceutical ">'||chr(10)||
'  '||chr(10)||
'';

c1:=c1||'  '||chr(10)||
'  <meta name="date" content="01-11-2010">'||chr(10)||
'  <meta http-equiv="content-language" content="en">'||chr(10)||
'  <meta name="copyright" content="Novartis Pharma AG 2010">'||chr(10)||
''||chr(10)||
'<script type="text/javascript">'||chr(10)||
'//Site specific variables'||chr(10)||
'	var copyrightLabel = ''Novartis Pharma AG'';'||chr(10)||
'	var author         = ''Claude Geyer'';'||chr(10)||
'	var authorEmail    = ''claude.geyer@novartis.com'';'||chr(10)||
'	var owner          = ''Sairam Iyer'';'||chr(10)||
'	var ownerEmai';

c1:=c1||'l     = ''sairam.iyer@novartis.com'';'||chr(10)||
'	var lastUpdated = ''02-11-2010'';'||chr(10)||
''||chr(10)||
'	var country        = ''global'';'||chr(10)||
'	var division       = ''pharma'';'||chr(10)||
'	var companyLogo    = ''novartis'';'||chr(10)||
'	var lang        = ''en'';          // all options are: en, de, es, it, etc.'||chr(10)||
'</script>'||chr(10)||
''||chr(10)||
''||chr(10)||
''||chr(10)||
'<!-- JavaScript -->'||chr(10)||
'<script type="text/javascript" src="http://www.cma.novartis.intra/cma/v4/js/utils.js"></script>'||chr(10)||
'<script type="text/javascrip';

c1:=c1||'t" src="http://www.cma.novartis.intra/cma/v4/js/language.js"></script>'||chr(10)||
'<script type="text/javascript" src="http://www.cma.novartis.intra/cma/v4/js/header.js"></script>'||chr(10)||
'<script type="text/javascript" src="http://www.cma.novartis.intra/cma/v4/js/footer.js"></script>'||chr(10)||
''||chr(10)||
'<script type="text/javascript" src="http://www.cma.novartis.intra/cma/v4/js/init.js"></script>'||chr(10)||
''||chr(10)||
'<script type="text/javascript" src="ht';

c1:=c1||'tp://www.cma.novartis.intra/cma/v4/js/global-index.js"></script>'||chr(10)||
'<script src="http://search.novartis.intra/utils.js" language="JavaScript"></script>'||chr(10)||
''||chr(10)||
''||chr(10)||
'</head>'||chr(10)||
'#HEAD#'||chr(10)||
''||chr(10)||
'<!-- main stylesheet -->'||chr(10)||
''||chr(10)||
'<link rel="stylesheet" href="#WORKSPACE_IMAGES#dsmtheme_v3.css" type="text/css"/>'||chr(10)||
''||chr(10)||
''||chr(10)||
'<body onload="init();" onunload="uninit();#ONLOAD#">#FORM_OPEN#'||chr(10)||
''||chr(10)||
'';

c2:=c2||' <div id="footer">'||chr(10)||
'  <script language="JavaScript" type="text/javascript">'||chr(10)||
'    if (window.getFooter) { getFooter(); }'||chr(10)||
'  </script>'||chr(10)||
'</div>'||chr(10)||
''||chr(10)||
'</div>'||chr(10)||
'<img src="http://www.cma.novartis.intra/cma/v4/i/b.gif" width="1" height="1" border="0" alt="I am CMA v4 compliant" />'||chr(10)||
'<!-- END main container -->'||chr(10)||
''||chr(10)||
''||chr(10)||
''||chr(10)||
'</body>'||chr(10)||
''||chr(10)||
'</html>';

c3:=c3||'<!-- BEGIN main container -->'||chr(10)||
'<div id="main-container">'||chr(10)||
''||chr(10)||
'  <table cellspacing="0" id="main-table">'||chr(10)||
'    <tr><td>'||chr(10)||
''||chr(10)||
'<table cellspacing="0" id="links-logo-table">'||chr(10)||
'		<tr>'||chr(10)||
'  		    <td colspan="2"><img id="page-dimensions-image" src="http://www.cma.novartis.intra/cma/v4/i/b.gif" width="1" height="1" border="0" alt="" /></td>'||chr(10)||
'		</tr>'||chr(10)||
'		<tr>'||chr(10)||
'		<td>'||chr(10)||
'		<script language="JavaScript" type="text/javascript">'||chr(10)||
'		';

c3:=c3||'	if (window.getHeaderUtils) { getHeaderUtils(); }'||chr(10)||
'		</script></td>'||chr(10)||
'		<td rowspan="2" class="rt">'||chr(10)||
'		<script language="JavaScript" type="text/javascript">'||chr(10)||
'			if (window.getHeaderCompanyLogo) { getHeaderCompanyLogo(); }'||chr(10)||
'		</script></td>'||chr(10)||
'		</tr>'||chr(10)||
'		<tr>'||chr(10)||
'		<td>'||chr(10)||
'		<script language="JavaScript" type="text/javascript">'||chr(10)||
'			if (window.getHeaderDivisionLogo) { getHeaderDivisionLogo(); }'||chr(10)||
'		</script></td>'||chr(10)||
'		</t';

c3:=c3||'r>'||chr(10)||
'	</table>'||chr(10)||
''||chr(10)||
'  <!-- BEGIN utils table -->'||chr(10)||
'  <table cellspacing="0" id="utils-table">'||chr(10)||
'  '||chr(10)||
'  <tr>'||chr(10)||
'    <td colspan="2"><p id="util-l-top">&#160;</p></td>'||chr(10)||
'    <td><p id="util-r-top">&#160;</p></td>'||chr(10)||
'  </tr>'||chr(10)||
'  <tr>'||chr(10)||
'    <td colspan="2" id="toolbar-l-c-cont">'||chr(10)||
'      <table cellspacing="0">'||chr(10)||
'        '||chr(10)||
'        <tr>'||chr(10)||
'</tr>'||chr(10)||
'        <tr>'||chr(10)||
'          <td colspan="3" id="sb-ql-lang-cont">'||chr(10)||
'                    </td>'||chr(10)||
'   ';

c3:=c3||'     </tr>'||chr(10)||
'      </table>'||chr(10)||
'    </td>'||chr(10)||
''||chr(10)||
'  </tr>'||chr(10)||
'  </table>'||chr(10)||
'  <!-- END utils table -->'||chr(10)||
''||chr(10)||
'   <!-- BEGIN content table -->'||chr(10)||
'  <table cellspacing="0" id="content-table">'||chr(10)||
'    <tr>'||chr(10)||
'      <!-- BEGIN left content -->'||chr(10)||
'      <!-- END left content -->'||chr(10)||
''||chr(10)||
'      <!-- BEGIN center content -->'||chr(10)||
'      <td id="content-c">  '||chr(10)||
''||chr(10)||
''||chr(10)||
''||chr(10)||
'<p style="font-size: 20px; font-weight: normal; padding: 0px 0px 0px; color: #923222;">I<span st';

c3:=c3||'yle="color:#e44c16">mpala Main Page</span></p>'||chr(10)||
''||chr(10)||
'#BOX_BODY# '||chr(10)||
''||chr(10)||
'<p style="font-size: 18px; font-weight: normal; padding: 10px 0px 0px; color: #923222;">P<span style="color:#e44c16">roduction links</span></p>'||chr(10)||
'<p>#REGION_POSITION_01#</p>  '||chr(10)||
''||chr(10)||
''||chr(10)||
'<p class="clearit">&#160;</p> '||chr(10)||
'<p style="font-size: 18px; font-weight: normal; padding: 10px 0px 0px; color: #923222;">T<span style="color:#e44c16">raining links</';

c3:=c3||'span></p>'||chr(10)||
'<p>#REGION_POSITION_02#</p>'||chr(10)||
'        '||chr(10)||
'    <p class="clearit">&#160;</p>'||chr(10)||
'            </div>'||chr(10)||
'            <p class="clearit">&#160;</p>'||chr(10)||
'  '||chr(10)||
'    <p class="clearit">&#160;</p>'||chr(10)||
'            '||chr(10)||
'            </td>'||chr(10)||
'      <!-- END center content -->'||chr(10)||
''||chr(10)||
'      '||chr(10)||
'      <!-- BEGIN right content -->'||chr(10)||
'      <td id="content-r">'||chr(10)||
'   '||chr(10)||
'  '||chr(10)||
'    <div class="callout-r">'||chr(10)||
''||chr(10)||
'  <h3>GENERAL INFORMATION</h3>'||chr(10)||
'     '||chr(10)||
'        <div>'||chr(10)||
'';

c3:=c3||'       '||chr(10)||
'  <div class="rich-content"><p>#REGION_POSITION_04#</p>'||chr(10)||
'      '||chr(10)||
'          <p>Visit the           '||chr(10)||
'  <a href="http://iws-pharma.na.novartis.net/portal/server.pt?open=514&objID=730079&parentname=CommunityPage&parentid=3&mode=2" target="_blank">DSM website</a> </p>'||chr(10)||
'      </div>'||chr(10)||
'    </div>'||chr(10)||
'  '||chr(10)||
'    <div class="callout-r">'||chr(10)||
''||chr(10)||
'  <h3>Contact</h3>'||chr(10)||
'   '||chr(10)||
'        <div>'||chr(10)||
'     '||chr(10)||
'          <p>For any questions ';

c3:=c3||'or support, please contact:</p>'||chr(10)||
'          <p>- for eCPR: <a href="mailto:karolina.nowak@novartis.com">Karolina Nowak</a></p>'||chr(10)||
'          <p>- for DSM Planning Tool: <a href="mailto:sameera.tak@novartis.com">Sameera Tak</a></p>'||chr(10)||
'          <p>- for CPO Planning Tool: <a href="mailto:christophe.bilger@novartis.com">Christophe Bilger</a></p>'||chr(10)||
'  <div class="rich-content"><p>#REGION_POSITION_05#</p>'||chr(10)||
'</div> ';

c3:=c3||'          '||chr(10)||
''||chr(10)||
'      </div>'||chr(10)||
'    </div>'||chr(10)||
'      </td>'||chr(10)||
'      <!-- END right content -->'||chr(10)||
'    </tr>'||chr(10)||
'  </table>'||chr(10)||
'  <!-- END content table -->'||chr(10)||
''||chr(10)||
'  </td>'||chr(10)||
'  </tr>'||chr(10)||
''||chr(10)||
'  </table>'||chr(10)||
''||chr(10)||
'  <!-- END main table -->'||chr(10)||
''||chr(10)||
'  <!-- END main content -->'||chr(10)||
''||chr(10)||
' ';

wwv_flow_api.create_template(
  p_id=> 6524517196954855 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'DSM IMPALA MAIN PAGE ',
  p_body_title=> '',
  p_header_template=> c1,
  p_box=> c3,
  p_footer_template=> c2,
  p_success_message=> '',
  p_current_tab=> '',
  p_current_tab_font_attr=> '',
  p_non_current_tab=> '',
  p_non_current_tab_font_attr => '',
  p_top_current_tab=> '',
  p_top_current_tab_font_attr => '',
  p_top_non_curr_tab=> '',
  p_top_non_curr_tab_font_attr=> '',
  p_current_image_tab=> '',
  p_non_current_image_tab=> '',
  p_notification_message=> '',
  p_navigation_bar=> '',
  p_navbar_entry=> '',
  p_app_tab_before_tabs=>'',
  p_app_tab_current_tab=>'',
  p_app_tab_non_current_tab=>'',
  p_app_tab_after_tabs=>'',
  p_region_table_cattributes=> '',
  p_theme_id  => 101,
  p_theme_class_id => 8,
  p_translate_this_template => 'N',
  p_template_comment => '');
end;
 
null;
 
end;
/

--application/shared_components/user_interface/templates/page/login
prompt  ......Page template 9012512808033184
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
c1:=c1||'<html lang="&BROWSER_LANGUAGE.">'||chr(10)||
'<head>'||chr(10)||
'#HEAD#'||chr(10)||
'<title>#TITLE#</title>'||chr(10)||
''||chr(10)||
'<style type="text/css">'||chr(10)||
'@import url(http://www.cma.novartis.intra/cma/v4/css/style.css);'||chr(10)||
'</style>'||chr(10)||
''||chr(10)||
'<script type="text/javascript">'||chr(10)||
'//Site specific variables'||chr(10)||
'	var copyrightLabel = ''Novartis Pharma AG'';'||chr(10)||
'	var author         = ''Claude Geyer'';'||chr(10)||
'	var authorEmail    = ''claude.geyer@novartis.com'';'||chr(10)||
'	var owner          = ''Nadia Laouar'';'||chr(10)||
'	';

c1:=c1||'var ownerEmail     = ''nadia.laouar@novartis.com'';'||chr(10)||
'	var lastUpdated = ''10-06-2010'';'||chr(10)||
''||chr(10)||
'	var country        = ''global'';'||chr(10)||
'	var division       = ''pharma'';'||chr(10)||
'	var companyLogo    = ''novartis'';'||chr(10)||
'	var lang        = ''en'';          // all options are: en, de, es, it, etc.'||chr(10)||
'	'||chr(10)||
'  '||chr(10)||
' </script>'||chr(10)||
''||chr(10)||
'<!-- main stylesheet -->'||chr(10)||
''||chr(10)||
''||chr(10)||
''||chr(10)||
'<!-- JavaScript -->'||chr(10)||
'<script type="text/javascript" src="http://www.cma.novartis.intra/cma/v4/js/ut';

c1:=c1||'ils.js"></script>'||chr(10)||
'<script type="text/javascript" src="http://www.cma.novartis.intra/cma/v4/js/language.js"></script>'||chr(10)||
'<script type="text/javascript" src="http://www.cma.novartis.intra/cma/v4/js/header.js"></script>'||chr(10)||
'<script type="text/javascript" src="http://www.cma.novartis.intra/cma/v4/js/footer.js"></script>'||chr(10)||
''||chr(10)||
'<script type="text/javascript" src="http://www.cma.novartis.intra/cma/v4/js/init.js"></s';

c1:=c1||'cript>'||chr(10)||
''||chr(10)||
'<script type="text/javascript" src="http://www.cma.novartis.intra/cma/v4/js/global-index.js"></script>'||chr(10)||
'<script src="http://search.novartis.intra/utils.js" language="JavaScript"></script>'||chr(10)||
''||chr(10)||
''||chr(10)||
'</head>'||chr(10)||
'<body onload="init();" onunload="uninit();#ONLOAD#">#FORM_OPEN#';

c2:=c2||'#FORM_CLOSE#</body>'||chr(10)||
'</html>'||chr(10)||
'';

c3:=c3||'<div id="main-container">'||chr(10)||
''||chr(10)||
'  <table cellspacing="0" id="main-table">'||chr(10)||
'    <tr><td>'||chr(10)||
''||chr(10)||
'    '||chr(10)||
'  '||chr(10)||
''||chr(10)||
'  '||chr(10)||
'  	<table cellspacing="0" id="links-logo-table">'||chr(10)||
'		<tr>'||chr(10)||
'  		    <td colspan="2"><img id="page-dimensions-image" src="http://www.cma.novartis.intra/cma/v4/i/b.gif" width="1" height="1" border="0" alt="" /></td>'||chr(10)||
'		</tr>'||chr(10)||
'		<tr>'||chr(10)||
'		<td>'||chr(10)||
'		<script language="JavaScript" type="text/javascript">'||chr(10)||
'			if (window.get';

c3:=c3||'HeaderUtils) { getHeaderUtils(); }'||chr(10)||
'		</script></td>'||chr(10)||
'		<td rowspan="2" class="rt">'||chr(10)||
'		<script language="JavaScript" type="text/javascript">'||chr(10)||
'			if (window.getHeaderCompanyLogo) { getHeaderCompanyLogo(); }'||chr(10)||
'		</script></td>'||chr(10)||
'		</tr>'||chr(10)||
'		<tr>'||chr(10)||
'		<td>'||chr(10)||
'		<script language="JavaScript" type="text/javascript">'||chr(10)||
'			if (window.getHeaderDivisionLogo) { getHeaderDivisionLogo(); }'||chr(10)||
'		</script></td>'||chr(10)||
'		</tr>'||chr(10)||
'	</table>'||chr(10)||
''||chr(10)||
' ';

c3:=c3||' <!-- BEGIN utils table -->'||chr(10)||
'  <table cellspacing="0" id="utils-table">'||chr(10)||
'  '||chr(10)||
'  <tr>'||chr(10)||
'    <td colspan="2"><p id="util-l-top">&#160;</p></td>'||chr(10)||
'    <td><p id="util-r-top">&#160;</p></td>'||chr(10)||
'  </tr>'||chr(10)||
'  <tr>'||chr(10)||
'    <td colspan="2" id="toolbar-l-c-cont">&nbsp;</td>'||chr(10)||
'   '||chr(10)||
'  </tr>'||chr(10)||
'  </table>'||chr(10)||
'  <!-- END utils table -->'||chr(10)||
'</td>'||chr(10)||
'</tr>'||chr(10)||
'</table>'||chr(10)||
''||chr(10)||
'<p style="font-size: 18px; font-weight: normal; padding: 3px 5px 3px 13px; color';

c3:=c3||': #923222;">DSM<span style="color:#e44c16"> Overage Guidance Tool</span></p>'||chr(10)||
''||chr(10)||
'<table class="t6Login" align="center" summary="">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t6Body">#BOX_BODY#</td>'||chr(10)||
'</tr>'||chr(10)||
'</table>'||chr(10)||
'<p>dfdf</p>'||chr(10)||
''||chr(10)||
''||chr(10)||
'<div id="footer">'||chr(10)||
'  <script language="JavaScript" type="text/javascript">'||chr(10)||
'    if (window.getFooter) { getFooter(); }'||chr(10)||
'  </script>'||chr(10)||
'</div>'||chr(10)||
''||chr(10)||
'</div>'||chr(10)||
'<!-- END main container -->'||chr(10)||
'<div class="t6messages">#GLOBAL';

c3:=c3||'_NOTIFICATION##SUCCESS_MESSAGE##NOTIFICATION_MESSAGE#</div>'||chr(10)||
'';

wwv_flow_api.create_template(
  p_id=> 9012512808033184 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'Login',
  p_body_title=> '#BODY_TITLE#',
  p_header_template=> c1,
  p_box=> c3,
  p_footer_template=> c2,
  p_success_message=> '',
  p_current_tab=> '',
  p_current_tab_font_attr=> '',
  p_non_current_tab=> '',
  p_non_current_tab_font_attr => '',
  p_top_current_tab=> '',
  p_top_current_tab_font_attr => '',
  p_top_non_curr_tab=> '',
  p_top_non_curr_tab_font_attr=> '',
  p_current_image_tab=> '',
  p_non_current_image_tab=> '',
  p_notification_message=> '<div class="t6notification" id="MESSAGE"><img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''MESSAGE'')"  style="float:right;" class="pb" alt="" />#MESSAGE#</div>',
  p_navigation_bar=> '',
  p_navbar_entry=> '',
  p_app_tab_before_tabs=>'',
  p_app_tab_current_tab=>'',
  p_app_tab_non_current_tab=>'',
  p_app_tab_after_tabs=>'',
  p_region_table_cattributes=> 'width="100%"',
  p_theme_id  => 101,
  p_theme_class_id => 6,
  p_translate_this_template => 'N',
  p_template_comment => '');
end;
 
null;
 
end;
/

--application/shared_components/user_interface/templates/page/no_tabs
prompt  ......Page template 9012716699033187
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
c1:=c1||'<html lang="&BROWSER_LANGUAGE.">'||chr(10)||
'<head>'||chr(10)||
'<title>#TITLE#</title>'||chr(10)||
'<link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_6/theme_3_1.css" type="text/css" />'||chr(10)||
'#HEAD#'||chr(10)||
'</head>'||chr(10)||
'<body #ONLOAD#>#FORM_OPEN#';

c2:=c2||'<table class="t6PageFooter" width="100%" cellpadding="0" cellspacing="0" summary="">'||chr(10)||
'<tr><td align="right">#CUSTOMIZE#</td></tr>'||chr(10)||
'<tr><td class="t6FooterTop">&nbsp;</td></tr>'||chr(10)||
'<tr><td class="t6FooterBottom">&nbsp;</td></tr>'||chr(10)||
'</table>'||chr(10)||
'#REGION_POSITION_05#'||chr(10)||
'#FORM_CLOSE# '||chr(10)||
'</body>'||chr(10)||
'</html>';

c3:=c3||'<table class="t6PageBody" cellpadding="0" cellspacing="0" width="100%" summary="">'||chr(10)||
'<tr>'||chr(10)||
'<td colspan="2" class="t6ApplicationLogo"><table summary="" cellpadding="0" cellspacing="0" border="0" width="100%">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t6ApplicationLogo" valign="top">#LOGO##REGION_POSITION_06#</td>'||chr(10)||
'<td width="100%" valign="top">#REGION_POSITION_07#</td>'||chr(10)||
'<td valign="top">#REGION_POSITION_08#</td>'||chr(10)||
'</tr>'||chr(10)||
'</table>'||chr(10)||
'<';

c3:=c3||'/td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'        <td class="t6UserName">&APP_USER. <span class="t6NavBar">#NAVIGATION_BAR#</span></td>'||chr(10)||
'        <td align="right" valign="bottom"><br /></td>'||chr(10)||
'    </tr>'||chr(10)||
'    <tr>'||chr(10)||
'        <td colspan="2" class="t6VerticalBar"><img src="#IMAGE_PREFIX#themes/theme_6/ParentTabBase.gif" alt="" /></td>'||chr(10)||
'    </tr>'||chr(10)||
'    <tr>'||chr(10)||
'        <td colspan="2">#REGION_POSITION_01#</td>'||chr(10)||
'    </tr>'||chr(10)||
'</table>'||chr(10)||
'<table wid';

c3:=c3||'th="100%" cellpadding="0" cellspacing="0" width="100%" summary="" height="80%">'||chr(10)||
'    <tr>'||chr(10)||
'        <td valign="top" class="t6ContentBody"><div class="t6messages">#GLOBAL_NOTIFICATION##SUCCESS_MESSAGE##NOTIFICATION_MESSAGE#</div>#BOX_BODY##REGION_POSITION_04##REGION_POSITION_02#</td>'||chr(10)||
'        <td align="right" valign="top" class="t6ContentBody">#REGION_POSITION_03#<br /></td>'||chr(10)||
'    </tr>'||chr(10)||
'</table>';

wwv_flow_api.create_template(
  p_id=> 9012716699033187 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'No Tabs',
  p_body_title=> '',
  p_header_template=> c1,
  p_box=> c3,
  p_footer_template=> c2,
  p_success_message=> '<div class="t6success" id="MESSAGE"><img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''MESSAGE'')"  style="float:right;" class="pb" alt="" />#SUCCESS_MESSAGE#</div>',
  p_current_tab=> '',
  p_current_tab_font_attr=> '',
  p_non_current_tab=> '',
  p_non_current_tab_font_attr => '',
  p_top_current_tab=> '',
  p_top_current_tab_font_attr => '',
  p_top_non_curr_tab=> '',
  p_top_non_curr_tab_font_attr=> '',
  p_current_image_tab=> '',
  p_non_current_image_tab=> '',
  p_notification_message=> '<div class="t6notification" id="MESSAGE"><img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''MESSAGE'')"  style="float:right;" class="pb" alt="" />#MESSAGE#</div>',
  p_navigation_bar=> '#BAR_BODY#',
  p_navbar_entry=> '',
  p_app_tab_before_tabs=>'',
  p_app_tab_current_tab=>'',
  p_app_tab_non_current_tab=>'',
  p_app_tab_after_tabs=>'',
  p_region_table_cattributes=> 'width="100%" border="0" cellpadding="0" cellspacing="0" summary="" ',
  p_sidebar_def_reg_pos => 'REGION_POSITION_02',
  p_breadcrumb_def_reg_pos => 'REGION_POSITION_01',
  p_theme_id  => 101,
  p_theme_class_id => 3,
  p_translate_this_template => 'N',
  p_template_comment => '');
end;
 
null;
 
end;
/

--application/shared_components/user_interface/templates/page/no_tabs_with_side_bar
prompt  ......Page template 9013000616033187
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
c1:=c1||'<html lang="&BROWSER_LANGUAGE.">'||chr(10)||
'<head>'||chr(10)||
'<title>#TITLE#</title>'||chr(10)||
'<link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_6/theme_3_1.css" type="text/css" />'||chr(10)||
'#HEAD#'||chr(10)||
'</head>'||chr(10)||
'<body #ONLOAD#>#FORM_OPEN#';

c2:=c2||'<table class="t6PageFooter" width="100%" cellpadding="0" cellspacing="0" summary="">'||chr(10)||
'<tr><td align="right">#CUSTOMIZE#</td></tr>'||chr(10)||
'<tr><td class="t6FooterTop">&nbsp;</td></tr>'||chr(10)||
'<tr><td class="t6FooterBottom">&nbsp;</td></tr>'||chr(10)||
'</table>'||chr(10)||
'#REGION_POSITION_05#'||chr(10)||
'#FORM_CLOSE# '||chr(10)||
'</body>'||chr(10)||
'</html>';

c3:=c3||'<table class="t6PageBody" cellpadding="0" cellspacing="0" width="100%" summary="">'||chr(10)||
'<tr>'||chr(10)||
'<td colspan="2" class="t6ApplicationLogo"><table summary="" cellpadding="0" cellspacing="0" border="0" width="100%">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t6ApplicationLogo" valign="top">#LOGO##REGION_POSITION_06#</td>'||chr(10)||
'<td width="100%" valign="top">#REGION_POSITION_07#</td>'||chr(10)||
'<td valign="top">#REGION_POSITION_08#</td>'||chr(10)||
'</tr>'||chr(10)||
'</table>'||chr(10)||
'<';

c3:=c3||'/td>'||chr(10)||
'</tr>'||chr(10)||
' <tr>'||chr(10)||
'  <td class="t6UserName">&APP_USER. <span class="t6NavBar">#NAVIGATION_BAR#</span></td>'||chr(10)||
'  <td align="right" valign="bottom"><br /></td>'||chr(10)||
' </tr>'||chr(10)||
' <tr>'||chr(10)||
'  <td colspan="2" class="t6VerticalBar"><img src="#IMAGE_PREFIX#themes/theme_6/ParentTabBase.gif" alt="" /></td>'||chr(10)||
' </tr>'||chr(10)||
'</table>'||chr(10)||
'<div>#REGION_POSITION_01#</div>'||chr(10)||
'<table border="0" cellpadding="0" cellspacing="0" class="t6SidebarLayout"';

c3:=c3||' width="100%" summary="" height="80%">'||chr(10)||
' <tr>'||chr(10)||
'   <td valign="top" width="150">'||chr(10)||
'     <table cellpadding="0" cellspacing="0" width="100%" class="t6SidebarColor" summary="">'||chr(10)||
'        <tr>'||chr(10)||
'          <td><br /></td>'||chr(10)||
'          <td width="5" valign="top" background="#IMAGE_PREFIX#themes/theme_6/SidebarRightSide.gif"><img src="#IMAGE_PREFIX#themes/theme_6/SidebarUpperRight.gif"></td>'||chr(10)||
'        </tr>'||chr(10)||
'        <';

c3:=c3||'tr>'||chr(10)||
'         <td valign="top" class="t6SideBarNav">#REGION_POSITION_02#</td>'||chr(10)||
'         <td width="5" background="#IMAGE_PREFIX#themes/theme_6/SidebarRightSide.gif">&nbsp;</td>'||chr(10)||
'       </tr>'||chr(10)||
'       <tr bgcolor="#FFFFFF">'||chr(10)||
'          <td valign="top">'||chr(10)||
'            <img width="100%" height="14" src="#IMAGE_PREFIX#themes/theme_6/SidebarBottomMiddle.gif"></td> '||chr(10)||
'          <td valign="top" width="5"><img src=';

c3:=c3||'"#IMAGE_PREFIX#themes/theme_6/SidebarBottomRight.gif"><br /><br /></td>'||chr(10)||
'       </tr>  '||chr(10)||
'     </table>'||chr(10)||
'   </td>'||chr(10)||
'   <td class="t6ContentBody" valign="top"><div class="t6messages">#GLOBAL_NOTIFICATION##SUCCESS_MESSAGE##NOTIFICATION_MESSAGE#</div>#BOX_BODY##REGION_POSITION_04#</td>'||chr(10)||
'   <td align="right" valign="top" class="t6ContentBody">#REGION_POSITION_03#<br /></td>'||chr(10)||
' </tr>'||chr(10)||
'</table>';

wwv_flow_api.create_template(
  p_id=> 9013000616033187 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'No Tabs with Side Bar',
  p_body_title=> '',
  p_header_template=> c1,
  p_box=> c3,
  p_footer_template=> c2,
  p_success_message=> '<div class="t6success" id="MESSAGE"><img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''MESSAGE'')"  style="float:right;" class="pb" alt="" />#SUCCESS_MESSAGE#</div>',
  p_current_tab=> '',
  p_current_tab_font_attr=> '',
  p_non_current_tab=> '',
  p_non_current_tab_font_attr => '',
  p_top_current_tab=> '',
  p_top_current_tab_font_attr => '',
  p_top_non_curr_tab=> '',
  p_top_non_curr_tab_font_attr=> '',
  p_current_image_tab=> '',
  p_non_current_image_tab=> '',
  p_notification_message=> '<div class="t6notification" id="MESSAGE"><img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''MESSAGE'')"  style="float:right;" class="pb" alt="" />#MESSAGE#</div>',
  p_navigation_bar=> '#BAR_BODY#',
  p_navbar_entry=> '',
  p_app_tab_before_tabs=>'',
  p_app_tab_current_tab=>'',
  p_app_tab_non_current_tab=>'',
  p_app_tab_after_tabs=>'',
  p_region_table_cattributes=> 'width="100%" border="0" cellpadding="0" cellspacing="0" summary="" ',
  p_sidebar_def_reg_pos => 'REGION_POSITION_02',
  p_breadcrumb_def_reg_pos => 'REGION_POSITION_01',
  p_theme_id  => 101,
  p_theme_class_id => 17,
  p_translate_this_template => 'N',
  p_template_comment => '');
end;
 
null;
 
end;
/

--application/shared_components/user_interface/templates/page/one_level_tabs
prompt  ......Page template 9013321601033188
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
c1:=c1||'<html lang="&BROWSER_LANGUAGE.">'||chr(10)||
'<head>'||chr(10)||
'<title>#TITLE#</title>'||chr(10)||
'<link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_6/theme_3_1.css" type="text/css" />'||chr(10)||
'#HEAD#'||chr(10)||
'</head>'||chr(10)||
'<body #ONLOAD#>#FORM_OPEN#';

c2:=c2||'<table class="t6PageFooter" width="100%" cellpadding="0" cellspacing="0" summary="">'||chr(10)||
'<tr><td align="right">#CUSTOMIZE#</td></tr>'||chr(10)||
'<tr><td class="t6FooterTop">&nbsp;</td></tr>'||chr(10)||
'<tr><td class="t6FooterBottom">&nbsp;</td></tr>'||chr(10)||
'</table>'||chr(10)||
'#REGION_POSITION_05#'||chr(10)||
'#FORM_CLOSE# '||chr(10)||
'</body>'||chr(10)||
'</html>';

c3:=c3||'<table class="t6PageBody" cellpadding="0" cellspacing="0" width="100%" summary="">'||chr(10)||
'<tr>'||chr(10)||
'<td colspan="2" class="t6ApplicationLogo"><table summary="" cellpadding="0" cellspacing="0" border="0" width="100%">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t6ApplicationLogo" valign="top">#LOGO##REGION_POSITION_06#</td>'||chr(10)||
'<td width="100%" valign="top">#REGION_POSITION_07#</td>'||chr(10)||
'<td valign="top">#REGION_POSITION_08#</td>'||chr(10)||
'</tr>'||chr(10)||
'</table>'||chr(10)||
'<';

c3:=c3||'/td>'||chr(10)||
'</tr>'||chr(10)||
' <tr>'||chr(10)||
'  <td class="t6UserName">&APP_USER. <span class="t6NavBar">#NAVIGATION_BAR#</span></td>'||chr(10)||
'  <td align="right" valign="bottom"><table cellpadding="0" cellspacing="0" summary=""><tr>#TAB_CELLS#</tr></table></td>'||chr(10)||
' </tr>'||chr(10)||
' <tr>'||chr(10)||
'  <td colspan="2" class="t6VerticalBar"><img src="#IMAGE_PREFIX#themes/theme_6/ParentTabBase.gif" alt="" /></td>'||chr(10)||
' </tr>'||chr(10)||
' <tr>'||chr(10)||
'   <td colspan="2">#REGION_POSITION_';

c3:=c3||'01#</td>'||chr(10)||
' </tr>'||chr(10)||
'</table>'||chr(10)||
'<table width="100%" summary="" height="80%">'||chr(10)||
' <tr>'||chr(10)||
'  <td valign="top" class="t6ContentBody"><div class="t6messages">#GLOBAL_NOTIFICATION##SUCCESS_MESSAGE##NOTIFICATION_MESSAGE#</div>#BOX_BODY##REGION_POSITION_02##REGION_POSITION_04#</td>'||chr(10)||
'  <td align="right" valign="top" class="t6ContentBody">#REGION_POSITION_03#<br /></td>'||chr(10)||
' </tr>'||chr(10)||
'</table>';

wwv_flow_api.create_template(
  p_id=> 9013321601033188 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'One Level Tabs',
  p_body_title=> '',
  p_header_template=> c1,
  p_box=> c3,
  p_footer_template=> c2,
  p_success_message=> '<div class="t6success" id="MESSAGE"><img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''MESSAGE'')"  style="float:right;" class="pb" alt="" />#SUCCESS_MESSAGE#</div>',
  p_current_tab=> '<td><img src="#IMAGE_PREFIX#themes/theme_6/StandardTabCurrentLeft.gif" /></td>'||chr(10)||
'<td style="background-image: url(#IMAGE_PREFIX#themes/theme_6/StandardTabCurrentBackground.gif); background-repeat:repeat;"><span class="t6parenttabcurrent">#TAB_LABEL#</span>#TAB_INLINE_EDIT#</td>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_6/StandardTabCurrentRight.gif" /></td>',
  p_current_tab_font_attr=> '',
  p_non_current_tab=> '<td><img src="#IMAGE_PREFIX#themes/theme_6/StandardTabNonCurrentLeft.gif" alt="" /></td>'||chr(10)||
'<td style="background-image: url(#IMAGE_PREFIX#themes/theme_6/StandardTabNonCurrentBackground.gif); background-repeat:repeat;"><a class="t6parenttabnoncurrent" href="#TAB_LINK#">#TAB_LABEL#</a>#TAB_INLINE_EDIT#</td>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_6/StandardTabNonCurrentRight.gif" alt="" /></td>',
  p_non_current_tab_font_attr => '',
  p_top_current_tab=> '',
  p_top_current_tab_font_attr => '',
  p_top_non_curr_tab=> '',
  p_top_non_curr_tab_font_attr=> '',
  p_current_image_tab=> '',
  p_non_current_image_tab=> '',
  p_notification_message=> '<div class="t6notification" id="MESSAGE"><img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''MESSAGE'')"  style="float:right;" class="pb" alt="" />#MESSAGE#</div>',
  p_navigation_bar=> '#BAR_BODY#',
  p_navbar_entry=> '<a href="#LINK#">#TEXT#</a>#EDIT#&nbsp;&nbsp;',
  p_app_tab_before_tabs=>'',
  p_app_tab_current_tab=>'',
  p_app_tab_non_current_tab=>'',
  p_app_tab_after_tabs=>'',
  p_region_table_cattributes=> 'width="100%" border="0" cellpadding="0" cellspacing="0" summary="" ',
  p_breadcrumb_def_reg_pos => 'REGION_POSITION_01',
  p_theme_id  => 101,
  p_theme_class_id => 1,
  p_translate_this_template => 'N',
  p_template_comment => '');
end;
 
null;
 
end;
/

--application/shared_components/user_interface/templates/page/one_level_tabs_with_side_bar
prompt  ......Page template 9013618535033189
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
c1:=c1||'<html lang="&BROWSER_LANGUAGE.">'||chr(10)||
'<head>'||chr(10)||
'<title>#TITLE#</title>'||chr(10)||
'<link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_6/theme_3_1.css" type="text/css" />'||chr(10)||
'#HEAD#'||chr(10)||
'</head>'||chr(10)||
'<body #ONLOAD#>#FORM_OPEN#';

c2:=c2||'<table class="t6PageFooter" width="100%" cellpadding="0" cellspacing="0" summary="">'||chr(10)||
'<tr><td align="right">#CUSTOMIZE#</td></tr>'||chr(10)||
'<tr><td class="t6FooterTop">&nbsp;</td></tr>'||chr(10)||
'<tr><td class="t6FooterBottom">&nbsp;</td></tr>'||chr(10)||
'</table>'||chr(10)||
'#REGION_POSITION_05#'||chr(10)||
'#FORM_CLOSE# '||chr(10)||
'</body>'||chr(10)||
'</html>';

c3:=c3||'<table class="t6PageBody" cellpadding="0" cellspacing="0" width="100%" summary="">'||chr(10)||
'<tr>'||chr(10)||
'<td colspan="2" class="t6ApplicationLogo"><table summary="" cellpadding="0" cellspacing="0" border="0" width="100%">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t6ApplicationLogo" valign="top">#LOGO##REGION_POSITION_06#</td>'||chr(10)||
'<td width="100%" valign="top">#REGION_POSITION_07#</td>'||chr(10)||
'<td valign="top">#REGION_POSITION_08#</td>'||chr(10)||
'</tr>'||chr(10)||
'</table>'||chr(10)||
'<';

c3:=c3||'/td>'||chr(10)||
'</tr>'||chr(10)||
' <tr>'||chr(10)||
'  <td class="t6UserName">&APP_USER. <span class="t6NavBar">#NAVIGATION_BAR#</span></td>'||chr(10)||
'  <td align="right" valign="bottom"><table cellpadding="0" cellspacing="0" summary=""><tr>#TAB_CELLS#</tr></table></td>'||chr(10)||
' </tr>'||chr(10)||
' <tr>'||chr(10)||
'  <td colspan="2" class="t6VerticalBar"><img src="#IMAGE_PREFIX#themes/theme_6/ParentTabBase.gif" alt="" /></td>'||chr(10)||
' </tr>'||chr(10)||
'</table>'||chr(10)||
'<div>#REGION_POSITION_01#</div>'||chr(10)||
'<';

c3:=c3||'table border="0" cellpadding="0" cellspacing="0" class="t6SidebarLayout" width="100%" summary="" height="70%">'||chr(10)||
'<tr>'||chr(10)||
'  <td valign="top" width="150">'||chr(10)||
'    <table cellpadding="0" cellspacing="0" width="100%" class="t6SidebarColor" summary="">'||chr(10)||
'       <tr>'||chr(10)||
'         <td><br /></td>'||chr(10)||
'         <td width="15" valign="top" background="#IMAGE_PREFIX#themes/theme_6/SidebarRightSide.gif"><img src="#IMAGE_PREFIX#';

c3:=c3||'themes/theme_6/SidebarUpperRight.gif" alt=""></td>'||chr(10)||
'       </tr>'||chr(10)||
'       <tr>'||chr(10)||
'        <td valign="top" class="t6SideBarNav">#REGION_POSITION_02#</td>'||chr(10)||
'        <td width="15" background="#IMAGE_PREFIX#themes/theme_6/SidebarRightSide.gif"><br /></td>'||chr(10)||
'      </tr>'||chr(10)||
'      <tr bgcolor="#FFFFFF">'||chr(10)||
'         <td valign="top"><img width="100%" height="14" src="#IMAGE_PREFIX#themes/theme_6/SidebarBottomMiddle.gif';

c3:=c3||'" alt=""></td> '||chr(10)||
'         <td valign="top" width="15"><img src="#IMAGE_PREFIX#themes/theme_6/SidebarBottomRight.gif" alt=""><br /><br /></td>'||chr(10)||
'      </tr>  '||chr(10)||
'    </table>'||chr(10)||
'  </td>'||chr(10)||
'  <td class="t6ContentBody" valign="top"><div class="t6messages">#GLOBAL_NOTIFICATION##SUCCESS_MESSAGE##NOTIFICATION_MESSAGE#</div>#BOX_BODY##REGION_POSITION_04#</td>'||chr(10)||
'  <td align="right" valign="top" class="t6ContentBody">#R';

c3:=c3||'EGION_POSITION_03#<br /></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>';

wwv_flow_api.create_template(
  p_id=> 9013618535033189 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'One Level Tabs with Side Bar',
  p_body_title=> '',
  p_header_template=> c1,
  p_box=> c3,
  p_footer_template=> c2,
  p_success_message=> '<div class="t6success" id="MESSAGE"><img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''MESSAGE'')"  style="float:right;" class="pb" alt="" />#SUCCESS_MESSAGE#</div>',
  p_current_tab=> '<td><img src="#IMAGE_PREFIX#themes/theme_6/StandardTabCurrentLeft.gif" /></td>'||chr(10)||
'<td style="background-image: url(#IMAGE_PREFIX#themes/theme_6/StandardTabCurrentBackground.gif); background-repeat:repeat;"><span class="t6parenttabcurrent">#TAB_LABEL#</span>#TAB_INLINE_EDIT#</td>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_6/StandardTabCurrentRight.gif" /></td>',
  p_current_tab_font_attr=> '',
  p_non_current_tab=> '<td><img src="#IMAGE_PREFIX#themes/theme_6/StandardTabNonCurrentLeft.gif" alt="LeftNonCurrentTab"></td>'||chr(10)||
'<td style="background-image: url(#IMAGE_PREFIX#themes/theme_6/StandardTabNonCurrentBackground.gif); background-repeat:repeat;"><a class="t6parenttabnoncurrent" href="#TAB_LINK#">#TAB_LABEL#</a>#TAB_INLINE_EDIT#</td>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_6/StandardTabNonCurrentRight.gif" alt="RightNonCurrentTab"></td>',
  p_non_current_tab_font_attr => '',
  p_top_current_tab=> '',
  p_top_current_tab_font_attr => '',
  p_top_non_curr_tab=> '',
  p_top_non_curr_tab_font_attr=> '',
  p_current_image_tab=> '',
  p_non_current_image_tab=> '',
  p_notification_message=> '<div class="t6notification" id="MESSAGE"><img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''MESSAGE'')"  style="float:right;" class="pb" alt="" />#MESSAGE#</div>',
  p_navigation_bar=> '#BAR_BODY#',
  p_navbar_entry=> '',
  p_app_tab_before_tabs=>'',
  p_app_tab_current_tab=>'',
  p_app_tab_non_current_tab=>'',
  p_app_tab_after_tabs=>'',
  p_region_table_cattributes=> 'width="100%" border="0" cellpadding="0" cellspacing="0" summary="" ',
  p_sidebar_def_reg_pos => 'REGION_POSITION_02',
  p_breadcrumb_def_reg_pos => 'REGION_POSITION_01',
  p_theme_id  => 101,
  p_theme_class_id => 16,
  p_translate_this_template => 'N',
  p_template_comment => '');
end;
 
null;
 
end;
/

--application/shared_components/user_interface/templates/page/popup
prompt  ......Page template 9013902585033190
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
c1:=c1||'<html lang="&BROWSER_LANGUAGE.">'||chr(10)||
'<head>'||chr(10)||
'<title>#TITLE#</title>'||chr(10)||
'<link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_6/theme_3_1.css" type="text/css" />'||chr(10)||
'#HEAD#'||chr(10)||
'</head>'||chr(10)||
'<body #ONLOAD#>#FORM_OPEN#';

c2:=c2||'#FORM_CLOSE#'||chr(10)||
'</body>'||chr(10)||
'</html>';

c3:=c3||'<br />#BOX_BODY#';

wwv_flow_api.create_template(
  p_id=> 9013902585033190 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'Popup',
  p_body_title=> '',
  p_header_template=> c1,
  p_box=> c3,
  p_footer_template=> c2,
  p_success_message=> '<div class="t6success" id="MESSAGE"><img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''MESSAGE'')"  style="float:right;" class="pb" alt="" /><img src="#IMAGE_PREFIX#themes/theme_6/success_w.gif" width="24" height="23" alt="" class="success" />#SUCCESS_MESSAGE#</div>',
  p_current_tab=> '',
  p_current_tab_font_attr=> '',
  p_non_current_tab=> '',
  p_non_current_tab_font_attr => '',
  p_top_current_tab=> '',
  p_top_current_tab_font_attr => '',
  p_top_non_curr_tab=> '',
  p_top_non_curr_tab_font_attr=> '',
  p_current_image_tab=> '',
  p_non_current_image_tab=> '',
  p_notification_message=> '<div class="t6notification" id="MESSAGE"><img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''MESSAGE'')"  style="float:right;" class="pb" alt="" />#MESSAGE#</div>',
  p_navigation_bar=> '<table cellpadding="0" cellspacing="0" border="0">'||chr(10)||
'<tr><td>&nbsp;&nbsp;</td>'||chr(10)||
'#BAR_BODY#'||chr(10)||
'</tr>'||chr(10)||
'</table>',
  p_navbar_entry=> '',
  p_app_tab_before_tabs=>'',
  p_app_tab_current_tab=>'',
  p_app_tab_non_current_tab=>'',
  p_app_tab_after_tabs=>'',
  p_region_table_cattributes=> 'width="100%"',
  p_theme_id  => 101,
  p_theme_class_id => 4,
  p_translate_this_template => 'N',
  p_template_comment => '');
end;
 
null;
 
end;
/

--application/shared_components/user_interface/templates/page/printer_friendly
prompt  ......Page template 9014214682033191
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
c1:=c1||'<html lang="&BROWSER_LANGUAGE.">'||chr(10)||
'<head>'||chr(10)||
'<title>#TITLE#</title>'||chr(10)||
'<link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_6/theme_3_1.css" type="text/css" />'||chr(10)||
'#HEAD#'||chr(10)||
'</head>'||chr(10)||
'<body #ONLOAD#>#FORM_OPEN#';

c2:=c2||'#FORM_CLOSE#</body>'||chr(10)||
'</html>';

c3:=c3||'<table summary="" cellpadding="0" width="100%" cellspacing="0" border="0">'||chr(10)||
'<tr>'||chr(10)||
'<td valign="top">#LOGO##REGION_POSITION_06#</td>'||chr(10)||
'<td width="100%" valign="top">#REGION_POSITION_07#</td>'||chr(10)||
'<td valign="top">#REGION_POSITION_08#</td>'||chr(10)||
'</table>'||chr(10)||
'<table summary="" cellpadding="0" width="100%" cellspacing="0" border="0">'||chr(10)||
'<tr>'||chr(10)||
'<td width="100%" valign="top">'||chr(10)||
'<div style="border:1px solid black;">#SUCCESS_MESSAG';

c3:=c3||'E##NOTIFICATION_MESSAGE#</div>'||chr(10)||
'#BOX_BODY##REGION_POSITION_04#</td>'||chr(10)||
'<td valign="top">#REGION_POSITION_03#<br /></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>'||chr(10)||
'#REGION_POSITION_05#';

wwv_flow_api.create_template(
  p_id=> 9014214682033191 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'Printer Friendly',
  p_body_title=> '',
  p_header_template=> c1,
  p_box=> c3,
  p_footer_template=> c2,
  p_success_message=> '<div class="success"><img src="#IMAGE_PREFIX#themes/theme_6/success_w.gif" width="24" height="23" alt="" class="t6success" />#SUCCESS_MESSAGE#</div>',
  p_current_tab=> '',
  p_current_tab_font_attr=> '',
  p_non_current_tab=> '',
  p_non_current_tab_font_attr => '',
  p_top_current_tab=> '',
  p_top_current_tab_font_attr => '',
  p_top_non_curr_tab=> '',
  p_top_non_curr_tab_font_attr=> '',
  p_current_image_tab=> '',
  p_non_current_image_tab=> '',
  p_notification_message=> '<div class="t6notification" id="MESSAGE"><img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''MESSAGE'')"  style="float:right;" class="pb" alt="" />#MESSAGE#</div>',
  p_navigation_bar=> '<table cellpadding="0" cellspacing="0" border="0">'||chr(10)||
'<tr><td>&nbsp;&nbsp;</td>'||chr(10)||
'#BAR_BODY#'||chr(10)||
'</tr>'||chr(10)||
'</table>',
  p_navbar_entry=> '',
  p_app_tab_before_tabs=>'',
  p_app_tab_current_tab=>'',
  p_app_tab_non_current_tab=>'',
  p_app_tab_after_tabs=>'',
  p_region_table_cattributes=> 'width="100%"',
  p_theme_id  => 101,
  p_theme_class_id => 5,
  p_translate_this_template => 'N',
  p_template_comment => '3');
end;
 
null;
 
end;
/

--application/shared_components/user_interface/templates/page/two_level_tabs
prompt  ......Page template 9014525939033192
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
c1:=c1||'<html lang="&BROWSER_LANGUAGE.">'||chr(10)||
'<head>'||chr(10)||
'<title>#TITLE#</title>'||chr(10)||
'<link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_6/theme_3_1.css" type="text/css" />'||chr(10)||
'#HEAD#'||chr(10)||
'</head>'||chr(10)||
'<body #ONLOAD#>#FORM_OPEN#';

c2:=c2||'<table class="t6PageFooter" width="100%" cellpadding="0" cellspacing="0" summary="">'||chr(10)||
'<tr><td align="right">#CUSTOMIZE#</td></tr>'||chr(10)||
'<tr><td class="t6FooterTop">&nbsp;</td></tr>'||chr(10)||
'<tr><td class="t6FooterBottom">&nbsp;</td></tr>'||chr(10)||
'</table>'||chr(10)||
'#REGION_POSITION_05#'||chr(10)||
'#FORM_CLOSE# '||chr(10)||
'</body>'||chr(10)||
'</html>';

c3:=c3||'<table class="t6PageBody" cellpadding="0" cellspacing="0" width="100%" summary="">'||chr(10)||
'<tr>'||chr(10)||
'<td colspan="2" class="t6ApplicationLogo"><table summary="" cellpadding="0" cellspacing="0" border="0" width="100%">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t6ApplicationLogo" valign="top">#LOGO##REGION_POSITION_06#</td>'||chr(10)||
'<td width="100%" valign="top">#REGION_POSITION_07#</td>'||chr(10)||
'<td valign="top">#REGION_POSITION_08#</td>'||chr(10)||
'</tr>'||chr(10)||
'</table>'||chr(10)||
'<';

c3:=c3||'/td>'||chr(10)||
'</tr>'||chr(10)||
' <tr>'||chr(10)||
'  <td class="t6UserName">&APP_USER. <span class="t6NavBar">#NAVIGATION_BAR#</span></td>'||chr(10)||
'  <td align="right" valign="bottom"><table cellpadding="0" cellspacing="0" summary=""><tr>#PARENT_TAB_CELLS#</tr></table>'||chr(10)||
'  </td>'||chr(10)||
' </tr>'||chr(10)||
' <tr>'||chr(10)||
'  <td colspan="2" class="t6Tabs"><table cellpadding="0" cellspacing="0" summary=""><tr>#TAB_CELLS#</tr></table></td>'||chr(10)||
' </tr>'||chr(10)||
' <tr><td colspan="2">#REGION';

c3:=c3||'_POSITION_01#</td></tr> '||chr(10)||
'</table>'||chr(10)||
'<table width="100%" summary="" height="70%">'||chr(10)||
' <tr>'||chr(10)||
'  <td class="t6ContentBody" valign="top">#SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##BOX_BODY##REGION_POSITION_02##REGION_POSITION_04#</td>'||chr(10)||
'  <td align="right" valign="top" class="t6ContentBody">#REGION_POSITION_03#<br /></td>'||chr(10)||
' </tr>'||chr(10)||
'</table>';

wwv_flow_api.create_template(
  p_id=> 9014525939033192 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'Two Level Tabs',
  p_body_title=> '',
  p_header_template=> c1,
  p_box=> c3,
  p_footer_template=> c2,
  p_success_message=> '<div class="t6success" id="MESSAGE"><img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''MESSAGE'')"  style="float:right;" class="pb" alt="" />#SUCCESS_MESSAGE#</div>',
  p_current_tab=> '<td><span class="t6standardtabcurrent">#TAB_LABEL#</span>#TAB_INLINE_EDIT#</td>',
  p_current_tab_font_attr=> '',
  p_non_current_tab=> '<td><a href="#TAB_LINK#" class="t6standardtabnoncurrent">#TAB_LABEL#</a>#TAB_INLINE_EDIT#</td>',
  p_non_current_tab_font_attr => '',
  p_top_current_tab=> '<td><img src="#IMAGE_PREFIX#themes/theme_6/StandardTabCurrentLeft.gif" alt=""></td>'||chr(10)||
'<td style="background-image: url(#IMAGE_PREFIX#themes/theme_6/StandardTabCurrentBackground.gif); background-repeat:repeat;"><span class="t6standardtabcurrent">#TAB_LABEL#</span>#TAB_INLINE_EDIT#</td>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_6/StandardTabCurrentRight.gif" alt="RightCurrentTab"></td>'||chr(10)||
'',
  p_top_current_tab_font_attr => '',
  p_top_non_curr_tab=> '<td><img src="#IMAGE_PREFIX#themes/theme_6/StandardTabNonCurrentLeft.gif" alt=""></td>'||chr(10)||
'<td style="background-image: url(#IMAGE_PREFIX#themes/theme_6/StandardTabNonCurrentBackground.gif); background-repeat:repeat;"><a class="t6standardtabnoncurrent" href="#TAB_LINK#">#TAB_LABEL#</a>#TAB_INLINE_EDIT#</td>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_6/StandardTabNonCurrentRight.gif" alt=""></td>',
  p_top_non_curr_tab_font_attr=> '',
  p_current_image_tab=> '',
  p_non_current_image_tab=> '',
  p_notification_message=> '<div class="t6notification" id="MESSAGE"><img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''MESSAGE'')"  style="float:right;" class="pb" alt="" />#MESSAGE#</div>',
  p_navigation_bar=> '#BAR_BODY#',
  p_navbar_entry=> '',
  p_app_tab_before_tabs=>'',
  p_app_tab_current_tab=>'',
  p_app_tab_non_current_tab=>'',
  p_app_tab_after_tabs=>'',
  p_region_table_cattributes=> 'width="100%" border="0" cellpadding="0" cellspacing="0" summary="" ',
  p_breadcrumb_def_reg_pos => 'REGION_POSITION_01',
  p_theme_id  => 101,
  p_theme_class_id => 2,
  p_translate_this_template => 'N',
  p_template_comment => '8');
end;
 
null;
 
end;
/

--application/shared_components/user_interface/templates/page/two_level_tabs_with_side_bar
prompt  ......Page template 9014823895033192
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
c1:=c1||'<html lang="&BROWSER_LANGUAGE.">'||chr(10)||
'<head>'||chr(10)||
'<title>#TITLE#</title>'||chr(10)||
'<link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_6/theme_3_1.css" type="text/css" />'||chr(10)||
'#HEAD#'||chr(10)||
'</head>'||chr(10)||
'<body #ONLOAD#>#FORM_OPEN#';

c2:=c2||'<table class="t6PageFooter" width="100%" cellpadding="0" cellspacing="0" summary="">'||chr(10)||
'<tr><td align="right">#CUSTOMIZE#</td></tr>'||chr(10)||
'<tr><td class="t6FooterTop">&nbsp;</td></tr>'||chr(10)||
'<tr><td class="t6FooterBottom">&nbsp;</td></tr>'||chr(10)||
'</table>'||chr(10)||
'#REGION_POSITION_05#'||chr(10)||
'#FORM_CLOSE# '||chr(10)||
'</body>'||chr(10)||
'</html>';

c3:=c3||'<table class="t6PageBody" cellpadding="0" cellspacing="0" width="100%" summary="">'||chr(10)||
'<tr>'||chr(10)||
'<td colspan="2" class="t6ApplicationLogo"><table summary="" cellpadding="0" cellspacing="0" border="0" width="100%">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t6ApplicationLogo" valign="top">#LOGO##REGION_POSITION_06#</td>'||chr(10)||
'<td width="100%" valign="top">#REGION_POSITION_07#</td>'||chr(10)||
'<td valign="top">#REGION_POSITION_08#</td>'||chr(10)||
'</tr>'||chr(10)||
'</table>'||chr(10)||
'<';

c3:=c3||'/td>'||chr(10)||
'</tr>'||chr(10)||
' <tr>'||chr(10)||
'  <td class="t6UserName">&APP_USER. <span class="t6NavBar">#NAVIGATION_BAR#</span></td>'||chr(10)||
'  <td align="right" valign="bottom"><table cellpadding="0" cellspacing="0" summary=""><tr>#PARENT_TAB_CELLS#</tr></table>'||chr(10)||
'  </td>'||chr(10)||
' </tr>'||chr(10)||
' <tr>'||chr(10)||
'  <td colspan="2" class="t6Tabs"><table cellpadding="0" cellspacing="0" summary=""><tr>#TAB_CELLS#</tr></table></td>'||chr(10)||
' </tr>'||chr(10)||
'</table>'||chr(10)||
'<div>#REGION_POSITI';

c3:=c3||'ON_01#</div>'||chr(10)||
'<table border="0" cellpadding="0" cellspacing="0" class="t6SidebarLayout" width="100%" summary="" height="70%">'||chr(10)||
' <tr>'||chr(10)||
'   <td valign="top" width="150">'||chr(10)||
'     <table cellpadding="0" cellspacing="0" width="100%" class="t6SidebarColor" summary="">'||chr(10)||
'        <tr>'||chr(10)||
'          <td><br /></td>'||chr(10)||
'          <td width="5" valign="top" background="#IMAGE_PREFIX#themes/theme_6/SidebarRightSide.gif"><img ';

c3:=c3||'src="#IMAGE_PREFIX#themes/theme_6/SidebarUpperRight.gif" alt="" /></td>'||chr(10)||
'        </tr>'||chr(10)||
'        <tr>'||chr(10)||
'         <td valign="top" class="t6SideBarNav">#REGION_POSITION_02#</td>'||chr(10)||
'         <td width="5" background="#IMAGE_PREFIX#themes/theme_6/SidebarRightSide.gif"><br /></td>'||chr(10)||
'       </tr>'||chr(10)||
'       <tr bgcolor="#FFFFFF">'||chr(10)||
'          <td valign="top"><img width="100%" height="14" src="#IMAGE_PREFIX#themes/them';

c3:=c3||'e_6/SidebarBottomMiddle.gif" alt="" /></td> '||chr(10)||
'          <td valign="top" width="5"><img src="#IMAGE_PREFIX#themes/theme_6/SidebarBottomRight.gif" alt="" /><br /><br /></td>'||chr(10)||
'       </tr>  '||chr(10)||
'     </table>'||chr(10)||
'   </td>'||chr(10)||
'   <td class="t6ContentBody" valign="top">#SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##BOX_BODY##REGION_POSITION_04#</td>'||chr(10)||
'  <td align="right" valign="top" class="t6ContentBody">#REGION_POSITION_0';

c3:=c3||'3#<br /></td>'||chr(10)||
' </tr>'||chr(10)||
'</table>';

wwv_flow_api.create_template(
  p_id=> 9014823895033192 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'Two Level Tabs with Side Bar',
  p_body_title=> '',
  p_header_template=> c1,
  p_box=> c3,
  p_footer_template=> c2,
  p_success_message=> '<div class="t6success" id="MESSAGE"><img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''MESSAGE'')"  style="float:right;" class="pb" alt="" />#SUCCESS_MESSAGE#</div>',
  p_current_tab=> '<td><span class="t6standardtabcurrent">#TAB_LABEL#</span>#TAB_INLINE_EDIT#</td>',
  p_current_tab_font_attr=> '',
  p_non_current_tab=> '<td><a href="#TAB_LINK#" class="t6standardtabnoncurrent">#TAB_LABEL#</a>#TAB_INLINE_EDIT#</td>',
  p_non_current_tab_font_attr => '',
  p_top_current_tab=> '<td><img src="#IMAGE_PREFIX#themes/theme_6/StandardTabCurrentLeft.gif" alt=""></td>'||chr(10)||
'<td style="background-image: url(#IMAGE_PREFIX#themes/theme_6/StandardTabCurrentBackground.gif); background-repeat:repeat;"><span class="t6standardtabcurrent">#TAB_LABEL#</span>#TAB_INLINE_EDIT#</td>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_6/StandardTabCurrentRight.gif" alt="RightCurrentTab"></td>',
  p_top_current_tab_font_attr => '',
  p_top_non_curr_tab=> '<td><img src="#IMAGE_PREFIX#themes/theme_6/StandardTabNonCurrentLeft.gif" alt="" /></td>'||chr(10)||
'<td style="background-image: url(#IMAGE_PREFIX#themes/theme_6/StandardTabNonCurrentBackground.gif); background-repeat:repeat;"><a class="t6parenttabnoncurrent" href="#TAB_LINK#">#TAB_LABEL#</a>#TAB_INLINE_EDIT#</td>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_6/StandardTabNonCurrentRight.gif" alt="" /></td>',
  p_top_non_curr_tab_font_attr=> '',
  p_current_image_tab=> '',
  p_non_current_image_tab=> '',
  p_notification_message=> '<div class="t6notification" id="MESSAGE"><img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''MESSAGE'')"  style="float:right;" class="pb" alt="" />#MESSAGE#</div>',
  p_navigation_bar=> '#BAR_BODY#',
  p_navbar_entry=> '<a href="#LINK#">#TEXT#</a>#EDIT#&nbsp;&nbsp;',
  p_app_tab_before_tabs=>'',
  p_app_tab_current_tab=>'',
  p_app_tab_non_current_tab=>'',
  p_app_tab_after_tabs=>'',
  p_region_table_cattributes=> 'width="100%" border="0" cellpadding="0" cellspacing="0" summary="" ',
  p_sidebar_def_reg_pos => 'REGION_POSITION_02',
  p_breadcrumb_def_reg_pos => 'REGION_POSITION_01',
  p_theme_id  => 101,
  p_theme_class_id => 18,
  p_translate_this_template => 'N',
  p_template_comment => '');
end;
 
null;
 
end;
/

--application/shared_components/user_interface/templates/page/flex_page_template
prompt  ......Page template 9033103430153418
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
c1:=c1||'<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">'||chr(10)||
'<head>'||chr(10)||
'#HEAD#'||chr(10)||
''||chr(10)||
'<body onload="init();" onunload="uninit();">';

c2 := null;
c3:=c3||'#BOX_BODY#'||chr(10)||
'<div id="main-container">'||chr(10)||
''||chr(10)||
'  <table cellspacing="0" id="main-table">'||chr(10)||
'    <tr><td>'||chr(10)||
''||chr(10)||
'    '||chr(10)||
'  '||chr(10)||
''||chr(10)||
'  '||chr(10)||
'  	<table cellspacing="0" id="links-logo-table">'||chr(10)||
'		<tr>'||chr(10)||
'  		    <td colspan="2"><img id="page-dimensions-image" src="http://www.cma.novartis.intra/cma/v4/i/b.gif" width="1" height="1" border="0" alt="" /></td>'||chr(10)||
'		</tr>'||chr(10)||
'		<tr>'||chr(10)||
'		<td>'||chr(10)||
'		<script language="JavaScript" type="text/javascript">'||chr(10)||
'			if ';

c3:=c3||'(window.getHeaderUtils) { getHeaderUtils(); }'||chr(10)||
'		</script></td>'||chr(10)||
'		<td rowspan="2" class="rt">'||chr(10)||
'		<script language="JavaScript" type="text/javascript">'||chr(10)||
'			if (window.getHeaderCompanyLogo) { getHeaderCompanyLogo(); }'||chr(10)||
'		</script></td>'||chr(10)||
'		</tr>'||chr(10)||
'		<tr>'||chr(10)||
'		<td>'||chr(10)||
'		<script language="JavaScript" type="text/javascript">'||chr(10)||
'			if (window.getHeaderDivisionLogo) { getHeaderDivisionLogo(); }'||chr(10)||
'		</script></td>'||chr(10)||
'		</tr>'||chr(10)||
'	';

c3:=c3||'</table>'||chr(10)||
''||chr(10)||
'  <!-- BEGIN utils table -->'||chr(10)||
'  <table cellspacing="0" id="utils-table">'||chr(10)||
'  '||chr(10)||
'  <tr>'||chr(10)||
'    <td colspan="2"><p id="util-l-top">&#160;</p></td>'||chr(10)||
'    <td><p id="util-r-top">&#160;</p></td>'||chr(10)||
'  </tr>'||chr(10)||
'  <tr>'||chr(10)||
'    <td colspan="2" id="toolbar-l-c-cont">&nbsp;</td>'||chr(10)||
'   '||chr(10)||
'  </tr>'||chr(10)||
'  </table>'||chr(10)||
'  <!-- END utils table -->'||chr(10)||
'</td>'||chr(10)||
'</tr>'||chr(10)||
'</table>'||chr(10)||
''||chr(10)||
'<p style="font-size: 18px; font-weight: normal; padding: 3px 5px 3px ';

c3:=c3||'13px; color: #923222;">DSM<span style="color:#e44c16">OverageGuidanceTool</span></p>'||chr(10)||
''||chr(10)||
'<p>dfdf</p>'||chr(10)||
''||chr(10)||
''||chr(10)||
'<div id="footer">'||chr(10)||
'  <script language="JavaScript" type="text/javascript">'||chr(10)||
'    if (window.getFooter) { getFooter(); }'||chr(10)||
'  </script>'||chr(10)||
'</div>'||chr(10)||
''||chr(10)||
'</div>'||chr(10)||
'<!-- END main container -->';

wwv_flow_api.create_template(
  p_id=> 9033103430153418 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'flex_page_template',
  p_body_title=> '',
  p_header_template=> c1,
  p_box=> c3,
  p_footer_template=> c2,
  p_success_message=> '',
  p_current_tab=> '',
  p_current_tab_font_attr=> '',
  p_non_current_tab=> '',
  p_non_current_tab_font_attr => '',
  p_top_current_tab=> '',
  p_top_current_tab_font_attr => '',
  p_top_non_curr_tab=> '',
  p_top_non_curr_tab_font_attr=> '',
  p_current_image_tab=> '',
  p_non_current_image_tab=> '',
  p_notification_message=> '',
  p_navigation_bar=> '',
  p_navbar_entry=> '',
  p_app_tab_before_tabs=>'',
  p_app_tab_current_tab=>'',
  p_app_tab_non_current_tab=>'',
  p_app_tab_after_tabs=>'',
  p_region_table_cattributes=> '',
  p_theme_id  => 101,
  p_theme_class_id => 8,
  p_translate_this_template => 'N',
  p_template_comment => '');
end;
 
null;
 
end;
/

--application/shared_components/user_interface/templates/page/sb_testpagetemplate
prompt  ......Page template 9088417314910994
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
c1:=c1||'<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">'||chr(10)||
''||chr(10)||
'<html lang="en">'||chr(10)||
''||chr(10)||
'<head>'||chr(10)||
''||chr(10)||
'<title>DSM Overage Guidance Tool</title>'||chr(10)||
''||chr(10)||
'  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">'||chr(10)||
'  <meta name="description" content="DSM Overage Guidance Tool">'||chr(10)||
'  <meta name="keywords" content="DSM Overage Guidance Tool">'||chr(10)||
'  <meta name="audience" content="PUB">'||chr(10)||
'  <meta name="sector" content="ph';

c1:=c1||'armaceutical ">'||chr(10)||
'  '||chr(10)||
'  '||chr(10)||
'  <meta name="date" content="14-06-2010">'||chr(10)||
'  <meta http-equiv="content-language" content="en">'||chr(10)||
'  <meta name="copyright" content="Novartis Pharma AG 2010">'||chr(10)||
''||chr(10)||
'<script type="text/javascript">'||chr(10)||
'//Site specific variables'||chr(10)||
'	var copyrightLabel = ''Novartis Pharma AG'';'||chr(10)||
'	var author         = ''Claude Geyer'';'||chr(10)||
'	var authorEmail    = ''claude.geyer@novartis.com'';'||chr(10)||
'	var owner          = ''Nadia Lao';

c1:=c1||'uar'';'||chr(10)||
'	var ownerEmail     = ''nadia.laouar@novartis.com'';'||chr(10)||
'	var lastUpdated = ''10-06-2010'';'||chr(10)||
''||chr(10)||
'	var country        = ''global'';'||chr(10)||
'	var division       = ''pharma'';'||chr(10)||
'	var companyLogo    = ''novartis'';'||chr(10)||
'	var lang        = ''en'';          // all options are: en, de, es, it, etc.'||chr(10)||
'</script>'||chr(10)||
''||chr(10)||
''||chr(10)||
''||chr(10)||
'<!-- JavaScript -->'||chr(10)||
'<script type="text/javascript" src="http://www.cma.novartis.intra/cma/v4/js/utils.js"></script>'||chr(10)||
'<script';

c1:=c1||' type="text/javascript" src="http://www.cma.novartis.intra/cma/v4/js/language.js"></script>'||chr(10)||
'<script type="text/javascript" src="http://www.cma.novartis.intra/cma/v4/js/header.js"></script>'||chr(10)||
'<script type="text/javascript" src="http://www.cma.novartis.intra/cma/v4/js/footer.js"></script>'||chr(10)||
''||chr(10)||
'<script type="text/javascript" src="http://www.cma.novartis.intra/cma/v4/js/init.js"></script>'||chr(10)||
''||chr(10)||
'<script type="tex';

c1:=c1||'t/javascript" src="http://www.cma.novartis.intra/cma/v4/js/global-index.js"></script>'||chr(10)||
'<script src="http://search.novartis.intra/utils.js" language="JavaScript"></script>'||chr(10)||
''||chr(10)||
''||chr(10)||
'</head>'||chr(10)||
'#HEAD#'||chr(10)||
''||chr(10)||
'<!-- main stylesheet -->'||chr(10)||
''||chr(10)||
'<link rel="stylesheet" href="#WORKSPACE_IMAGES#dsmtheme_v3.css" type="text/css"/>'||chr(10)||
''||chr(10)||
''||chr(10)||
'<body onload="init();" onunload="uninit();#ONLOAD#">#FORM_OPEN#'||chr(10)||
''||chr(10)||
'';

c2:=c2||' <div id="footer">'||chr(10)||
'  <script language="JavaScript" type="text/javascript">'||chr(10)||
'    if (window.getFooter) { getFooter(); }'||chr(10)||
'  </script>'||chr(10)||
'</div>'||chr(10)||
''||chr(10)||
'</div>'||chr(10)||
'<img src="http://www.cma.novartis.intra/cma/v4/i/b.gif" width="1" height="1" border="0" alt="I am CMA v4 compliant" />'||chr(10)||
'<!-- END main container -->'||chr(10)||
''||chr(10)||
''||chr(10)||
''||chr(10)||
'</body>'||chr(10)||
''||chr(10)||
'</html>';

c3:=c3||'<!-- BEGIN main container -->'||chr(10)||
'<div id="main-container">'||chr(10)||
''||chr(10)||
'  <table cellspacing="0" id="main-table">'||chr(10)||
'    <tr><td>'||chr(10)||
''||chr(10)||
'<table cellspacing="0" id="links-logo-table">'||chr(10)||
'		<tr>'||chr(10)||
'  		    <td colspan="2"><img id="page-dimensions-image" src="http://www.cma.novartis.intra/cma/v4/i/b.gif" width="1" height="1" border="0" alt="" /></td>'||chr(10)||
'		</tr>'||chr(10)||
'		<tr>'||chr(10)||
'		<td>'||chr(10)||
'		<script language="JavaScript" type="text/javascript">'||chr(10)||
'		';

c3:=c3||'	if (window.getHeaderUtils) { getHeaderUtils(); }'||chr(10)||
'		</script></td>'||chr(10)||
'		<td rowspan="2" class="rt">'||chr(10)||
'		<script language="JavaScript" type="text/javascript">'||chr(10)||
'			if (window.getHeaderCompanyLogo) { getHeaderCompanyLogo(); }'||chr(10)||
'		</script></td>'||chr(10)||
'		</tr>'||chr(10)||
'		<tr>'||chr(10)||
'		<td>'||chr(10)||
'		<script language="JavaScript" type="text/javascript">'||chr(10)||
'			if (window.getHeaderDivisionLogo) { getHeaderDivisionLogo(); }'||chr(10)||
'		</script></td>'||chr(10)||
'		</t';

c3:=c3||'r>'||chr(10)||
'	</table>'||chr(10)||
''||chr(10)||
'  <!-- BEGIN utils table -->'||chr(10)||
'  <table cellspacing="0" id="utils-table">'||chr(10)||
'  '||chr(10)||
'  <tr>'||chr(10)||
'    <td colspan="2"><p id="util-l-top">&#160;</p></td>'||chr(10)||
'    <td><p id="util-r-top">&#160;</p></td>'||chr(10)||
'  </tr>'||chr(10)||
'  <tr>'||chr(10)||
'    <td colspan="2" id="toolbar-l-c-cont">'||chr(10)||
'      <table cellspacing="0">'||chr(10)||
'        '||chr(10)||
'        <tr>'||chr(10)||
'</tr>'||chr(10)||
'        <tr>'||chr(10)||
'          <td colspan="3" id="sb-ql-lang-cont">'||chr(10)||
'                    </td>'||chr(10)||
'   ';

c3:=c3||'     </tr>'||chr(10)||
'      </table>'||chr(10)||
'    </td>'||chr(10)||
''||chr(10)||
'  </tr>'||chr(10)||
'  </table>'||chr(10)||
'  <!-- END utils table -->'||chr(10)||
''||chr(10)||
'   <!-- BEGIN content table -->'||chr(10)||
'  <table cellspacing="0" id="content-table">'||chr(10)||
'    <tr>'||chr(10)||
'      <!-- BEGIN left content -->'||chr(10)||
'      <!-- END left content -->'||chr(10)||
''||chr(10)||
'      <!-- BEGIN center content -->'||chr(10)||
'      <td id="content-c"><p class="clearit">&#160;</p>  '||chr(10)||
'      <p style="font-size: 18px; font-weight: normal; padding: 3px 0px';

c3:=c3||' 23px; color: #923222;">DSM<span style="color:#e44c16">OverageGuidanceTool</span></p> '||chr(10)||
'      <p class="clearit">&#160;</p>  '||chr(10)||
''||chr(10)||
'#BOX_BODY# '||chr(10)||
''||chr(10)||
''||chr(10)||
'<img src="#APP_IMAGES#DSMtool_selectCriteria.jpg">'||chr(10)||
'<p>#REGION_POSITION_01#</p>  '||chr(10)||
''||chr(10)||
''||chr(10)||
'<p class="clearit">&#160;</p> '||chr(10)||
'<img src="#APP_IMAGES#DSMtool_resultingGuidance.jpg">  '||chr(10)||
'<p>#REGION_POSITION_02#</p>'||chr(10)||
'        '||chr(10)||
'    <p class="clearit">&#160;</p>'||chr(10)||
'            </div>'||chr(10)||
'';

c3:=c3||'            <p class="clearit">&#160;</p>'||chr(10)||
'  '||chr(10)||
'    <p class="clearit">&#160;</p>'||chr(10)||
'            '||chr(10)||
'            </td>'||chr(10)||
'      <!-- END center content -->'||chr(10)||
''||chr(10)||
'      '||chr(10)||
'      <!-- BEGIN right content -->'||chr(10)||
'      <td id="content-r">'||chr(10)||
'   '||chr(10)||
'  '||chr(10)||
'    <div class="callout-r">'||chr(10)||
''||chr(10)||
'  <h3>GENERAL INFORMATION</h3>'||chr(10)||
'     '||chr(10)||
'        <div>'||chr(10)||
'       '||chr(10)||
'  <div class="rich-content"><p>#REGION_POSITION_04#</p>'||chr(10)||
'<p>DSM Overage Guidance tool release';

c3:=c3||'d for beta testing</p></div>'||chr(10)||
'      '||chr(10)||
'          <p>Visit the           '||chr(10)||
'  <a href="http://iws-pharma.na.novartis.net/portal/server.pt?open=514&objID=730079&parentname=CommunityPage&parentid=3&mode=2" target="_blank">DSM website</a> </p>'||chr(10)||
'      </div>'||chr(10)||
'    </div>'||chr(10)||
'  '||chr(10)||
'    <div class="callout-r">'||chr(10)||
''||chr(10)||
'  <h3>Contact</h3>'||chr(10)||
'   '||chr(10)||
'        <div>'||chr(10)||
'     '||chr(10)||
'          <p>For any questions or support, please contact <a href=';

c3:=c3||'"mailto:nadia.laour@novartis.com">Nadia Laouar</a></p>'||chr(10)||
'  <div class="rich-content"><p>#REGION_POSITION_05#</p>'||chr(10)||
'</div>           '||chr(10)||
''||chr(10)||
'      </div>'||chr(10)||
'    </div>'||chr(10)||
'      </td>'||chr(10)||
'      <!-- END right content -->'||chr(10)||
'    </tr>'||chr(10)||
'  </table>'||chr(10)||
'  <!-- END content table -->'||chr(10)||
''||chr(10)||
'  </td>'||chr(10)||
'  </tr>'||chr(10)||
''||chr(10)||
'  </table>'||chr(10)||
''||chr(10)||
'  <!-- END main table -->'||chr(10)||
''||chr(10)||
'  <!-- END main content -->'||chr(10)||
''||chr(10)||
' ';

wwv_flow_api.create_template(
  p_id=> 9088417314910994 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'sb_TestPageTemplate',
  p_body_title=> '',
  p_header_template=> c1,
  p_box=> c3,
  p_footer_template=> c2,
  p_success_message=> '',
  p_current_tab=> '',
  p_current_tab_font_attr=> '',
  p_non_current_tab=> '',
  p_non_current_tab_font_attr => '',
  p_top_current_tab=> '',
  p_top_current_tab_font_attr => '',
  p_top_non_curr_tab=> '',
  p_top_non_curr_tab_font_attr=> '',
  p_current_image_tab=> '',
  p_non_current_image_tab=> '',
  p_notification_message=> '',
  p_navigation_bar=> '',
  p_navbar_entry=> '',
  p_app_tab_before_tabs=>'',
  p_app_tab_current_tab=>'',
  p_app_tab_non_current_tab=>'',
  p_app_tab_after_tabs=>'',
  p_region_table_cattributes=> '',
  p_theme_id  => 101,
  p_theme_class_id => 8,
  p_translate_this_template => 'N',
  p_template_comment => '');
end;
 
null;
 
end;
/

prompt  ...button templates
--
--application/shared_components/user_interface/templates/button/button
prompt  ......Button Template 6515101628583077
declare
  t varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
t:=t||'<table class="t1Button" cellspacing="0" cellpadding="0" border="0"  summary="">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t1L"><a href="#LINK#"><img src="#IMAGE_PREFIX#themes/theme_1/button_left.gif" alt="" width="4" height="24" /></a></td>'||chr(10)||
'<td class="t1C"><a href="#LINK#">#LABEL#</a></td>'||chr(10)||
'<td class="t1R"><a href="#LINK#"><img src="#IMAGE_PREFIX#themes/theme_1/button_right.gif" width="4" height="24" alt="" /></a></td>'||chr(10)||
'</tr';

t:=t||'>'||chr(10)||
'</table>';

wwv_flow_api.create_button_templates (
  p_id=>6515101628583077 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_template=>t,
  p_template_name=> 'Button',
  p_translate_this_template => 'N',
  p_theme_id  => 1,
  p_theme_class_id => 1,
  p_template_comment       => '');
end;
/
--application/shared_components/user_interface/templates/button/button_alternative_1
prompt  ......Button Template 6515226020583088
declare
  t varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
t:=t||'<table class="t1ButtonAlternative1" cellspacing="0" cellpadding="0" border="0"  summary="">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t1L"><a href="#LINK#"><img src="#IMAGE_PREFIX#themes/theme_1/button_alt1_left.gif" alt="" width="11" height="20" /></a></td>'||chr(10)||
'<td class="t1C"><a href="#LINK#">#LABEL#</a></td>'||chr(10)||
'<td class="t1R"><a href="#LINK#"><img src="#IMAGE_PREFIX#themes/theme_1/button_alt1_right.gif" width="11" height="20"';

t:=t||' alt="" /></a></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>';

wwv_flow_api.create_button_templates (
  p_id=>6515226020583088 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_template=>t,
  p_template_name=> 'Button, Alternative 1',
  p_translate_this_template => 'N',
  p_theme_id  => 1,
  p_theme_class_id => 4,
  p_template_comment       => '');
end;
/
--application/shared_components/user_interface/templates/button/button_alternative_2
prompt  ......Button Template 6515301901583088
declare
  t varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
t:=t||'<table class="t1ButtonAlternative2" cellspacing="0" cellpadding="0" border="0"  summary="">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t1L"><a href="#LINK#"><img src="#IMAGE_PREFIX#themes/theme_1/button_alt2_left.gif" alt="" width="11" height="20" /></a></td>'||chr(10)||
'<td class="t1C"><a href="#LINK#">#LABEL#</a></td>'||chr(10)||
'<td class="t1R"><a href="#LINK#"><img src="#IMAGE_PREFIX#themes/theme_1/button_alt2_right.gif" width="11" height="20"';

t:=t||' alt="" /></a></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>';

wwv_flow_api.create_button_templates (
  p_id=>6515301901583088 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_template=>t,
  p_template_name=> 'Button, Alternative 2',
  p_translate_this_template => 'N',
  p_theme_id  => 1,
  p_theme_class_id => 5,
  p_template_comment       => 'XP Square FFFFFF');
end;
/
--application/shared_components/user_interface/templates/button/button_alternative_3
prompt  ......Button Template 6515422923583088
declare
  t varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
t:=t||'<table class="t1ButtonAlternative3" cellspacing="0" cellpadding="0" border="0"  summary="">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t1L"><a href="#LINK#"><img src="#IMAGE_PREFIX#themes/theme_1/button_alt3_left.gif" alt="" width="6" height="25" /></a></td>'||chr(10)||
'<td class="t1C"><a href="#LINK#">#LABEL#</a></td>'||chr(10)||
'<td class="t1R"><a href="#LINK#"><img src="#IMAGE_PREFIX#themes/theme_1/button_alt3_right.gif" width="6" height="25" a';

t:=t||'lt="" /></a></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>';

wwv_flow_api.create_button_templates (
  p_id=>6515422923583088 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_template=>t,
  p_template_name=> 'Button, Alternative 3',
  p_translate_this_template => 'N',
  p_theme_id  => 1,
  p_theme_class_id => 2,
  p_template_comment       => 'Standard Button');
end;
/
--application/shared_components/user_interface/templates/button/button
prompt  ......Button Template 9029432560033223
declare
  t varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
t:=t||'<a href="#LINK#" class="t6Button">#LABEL#</a>';

wwv_flow_api.create_button_templates (
  p_id=>9029432560033223 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_template=>t,
  p_template_name=> 'Button',
  p_translate_this_template => 'N',
  p_theme_id  => 101,
  p_theme_class_id => 1,
  p_template_comment       => '');
end;
/
--application/shared_components/user_interface/templates/button/button_alternative_1
prompt  ......Button Template 9029626498033224
declare
  t varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
t:=t||'<a href="#LINK#" class="t6ButtonAlternative1">#LABEL#</a>';

wwv_flow_api.create_button_templates (
  p_id=>9029626498033224 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_template=>t,
  p_template_name=> 'Button, Alternative 1',
  p_translate_this_template => 'N',
  p_theme_id  => 101,
  p_theme_class_id => 4,
  p_template_comment       => '');
end;
/
--application/shared_components/user_interface/templates/button/button_alternative_2
prompt  ......Button Template 9029819910033224
declare
  t varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
t:=t||'<a href="#LINK#" class="t6ButtonAlternative2">#LABEL#</a>';

wwv_flow_api.create_button_templates (
  p_id=>9029819910033224 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_template=>t,
  p_template_name=> 'Button, Alternative 2',
  p_translate_this_template => 'N',
  p_theme_id  => 101,
  p_theme_class_id => 5,
  p_template_comment       => '');
end;
/
--application/shared_components/user_interface/templates/button/button_alternative_3
prompt  ......Button Template 9030023314033224
declare
  t varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
t:=t||'<table cellpadding="0" cellspacing="0" border="0" class="t6ButtonAlternative3" summary="">'||chr(10)||
' <tr>'||chr(10)||
'  <td class="t6ButtonAlternative3Left" width="3"></td>'||chr(10)||
'  <td style="padding-left: 10px; padding-right: 10px;"><a href="#LINK#">#LABEL#</a></td>'||chr(10)||
'  <td class="t6ButtonAlternative3Right" width="3"></td>'||chr(10)||
' </tr>'||chr(10)||
'</table>'||chr(10)||
'';

wwv_flow_api.create_button_templates (
  p_id=>9030023314033224 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_template=>t,
  p_template_name=> 'Button, Alternative 3',
  p_translate_this_template => 'N',
  p_theme_id  => 101,
  p_theme_class_id => 2,
  p_template_comment       => '');
end;
/
---------------------------------------
prompt  ...region templates
--
--application/shared_components/user_interface/templates/region/borderless_region
prompt  ......region template 6515513669583089
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table cellpadding="0" cellspacing="0" border="0" summary="" class="t1BorderlessRegion" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t1RegionHeader">#TITLE#</td>'||chr(10)||
'<td class="t1ButtonHolder">#CLOSE#&nbsp;&nbsp;&nbsp;#PREVIOUS##NEXT##DELETE##EDIT##CHANGE##COPY##CREATE##CREATE2##EXPAND##HELP#</td>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t1Body" colspan="2">#BODY#</td>'||chr(10)||
'</tr>'||chr(10)||
'</table>';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 6515513669583089 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Borderless Region',
  p_plug_table_bgcolor     => '',
  p_theme_id  => 1,
  p_theme_class_id => 7,
  p_plug_heading_bgcolor => '',
  p_plug_font_size => '',
  p_translate_this_template => 'N',
  p_template_comment       => 'Use this region template when you want to contain content without a border.'||chr(10)||
''||chr(10)||
'TITLE=YES'||chr(10)||
'BUTTONS=YES'||chr(10)||
'100% WIDTH=NO');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 6515513669583089 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/region/bracketed_region
prompt  ......region template 6515600383583099
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table cellpadding="0" cellspacing="0" border="0" summary="" class="t1BracketedRegion" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t1RegionHeader">#TITLE#</td>'||chr(10)||
'<td class="t1ButtonHolder">#CLOSE#&nbsp;&nbsp;&nbsp;#PREVIOUS##NEXT##DELETE##EDIT##CHANGE##COPY##CREATE##CREATE2##EXPAND##HELP#</td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td colspan="2"><table cellpadding="0" cellspacing="0" border="0" summary="" wi';

t:=t||'dth="100%">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t1bracket"><img src="" height="5" width="1" alt="#IMAGE_PREFIX#themes/theme_1/1px_trans.gif" /></td>'||chr(10)||
'<td rowspan="3" class="t1Body">#BODY#</td>'||chr(10)||
'<td class="t1bracket"><img src="" height="5" width="1" alt="#IMAGE_PREFIX#themes/theme_1/1px_trans.gif" /></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_1/1px_trans.gif" height="1" width="1" alt="" /></td>'||chr(10)||
'<td><img sr';

t:=t||'c="#IMAGE_PREFIX#themes/theme_1/1px_trans.gif" height="1" width="1" alt="" /></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t1bracket"><img src="" height="5" width="1" alt="#IMAGE_PREFIX#themes/theme_1/1px_trans.gif" /></td>'||chr(10)||
'<td class="t1bracket"><img src="" height="5" width="1" alt="#IMAGE_PREFIX#themes/theme_1/1px_trans.gif" /></td>'||chr(10)||
'</tr>'||chr(10)||
'</table></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 6515600383583099 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Bracketed Region',
  p_plug_table_bgcolor     => '',
  p_theme_id  => 1,
  p_theme_class_id => 18,
  p_plug_heading_bgcolor => '',
  p_plug_font_size => '',
  p_translate_this_template => 'N',
  p_template_comment       => 'Use this region template when you want to contain content with a bracket UI.'||chr(10)||
''||chr(10)||
'TITLE=YES'||chr(10)||
'BUTTONS=YES'||chr(10)||
'100% WIDTH=NO');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 6515600383583099 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/region/breadcrumb_region
prompt  ......region template 6515703632583099
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<div class="t1BreadcrumbRegion" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>#BODY#</div>';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 6515703632583099 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Breadcrumb Region',
  p_plug_table_bgcolor     => '',
  p_theme_id  => 1,
  p_theme_class_id => 6,
  p_plug_heading_bgcolor => '',
  p_plug_font_size => '',
  p_translate_this_template => 'N',
  p_template_comment       => 'Use this region template to contain breadcrumb menus.  Breadcrumb menus are implemented using breadcrumbs.  Breadcrumb menus are designed to displayed in #REGION_POSITION_01#');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 6515703632583099 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/region/button_region_with_title
prompt  ......region template 6515817923583099
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table cellpadding="0" cellspacing="0" border="0" summary="" class="t1ButtonRegionwithTitle" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>'||chr(10)||
'<tr><td class="t1RegionHeader">#TITLE#</td></tr>'||chr(10)||
'<tr><td class="t1ButtonHolder">#CLOSE#&nbsp;&nbsp;&nbsp;#PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##COPY##EXPAND##HELP#<img src="#IMAGE_PREFIX#/themes/theme_1/1px_trans.gif" height="1" width="600" styl';

t:=t||'e="display:block;" alt="" /></td></tr>'||chr(10)||
'</table>#BODY#'||chr(10)||
'';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 6515817923583099 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Button Region with Title',
  p_plug_table_bgcolor     => '',
  p_theme_id  => 1,
  p_theme_class_id => 4,
  p_plug_heading_bgcolor => '',
  p_plug_font_size => '',
  p_translate_this_template => 'N',
  p_template_comment       => '');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 6515817923583099 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/region/button_region_without_title
prompt  ......region template 6515927785583100
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table cellpadding="0" cellspacing="0" border="0" summary="" class="t1ButtonRegionwithoutTitle" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>'||chr(10)||
'<tr><td class="t1ButtonHolder">#CLOSE#&nbsp;&nbsp;&nbsp;#PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##HELP#<img src="#IMAGE_PREFIX#/themes/theme_1/1px_trans.gif" height="1" width="600" style="display:block;" alt="" /></td></tr>'||chr(10)||
'</table>'||chr(10)||
'#BODY#';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 6515927785583100 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Button Region without Title',
  p_plug_table_bgcolor     => '',
  p_theme_id  => 1,
  p_theme_class_id => 17,
  p_plug_heading_bgcolor => '',
  p_plug_font_size => '',
  p_translate_this_template => 'N',
  p_template_comment       => '');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 6515927785583100 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/region/chart_list
prompt  ......region template 6516011713583100
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table cellpadding="0" cellspacing="0" border="0" summary="" class="t1ListRegionwithIcon" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t1RegionHeader">#TITLE#</td>'||chr(10)||
'<td class="t1ButtonHolder">#CLOSE#&nbsp;&nbsp;&nbsp;#PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##HELP#</td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t1Body" colspan="2"><table cellpadding="0" cellspacing="0" border="0" summary="" ><tr><t';

t:=t||'d valign="top"><img src="#IMAGE_PREFIX#themes/theme_1/chart.gif" alt=""/></td>'||chr(10)||
'<td>#BODY#</td></tr></table></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 6516011713583100 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Chart List',
  p_plug_table_bgcolor     => '#ffffff',
  p_theme_id  => 1,
  p_theme_class_id => 29,
  p_plug_heading_bgcolor => '#ffffff',
  p_plug_font_size => '-1',
  p_translate_this_template => 'N',
  p_template_comment       => 'Red Theme');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 6516011713583100 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/region/chart_region
prompt  ......region template 6516117765583100
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table cellpadding="0" cellspacing="0" border="0" summary="" class="t1ChartRegion" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>'||chr(10)||
'<tr>'||chr(10)||
'<td><table width="100%" cellpadding="0" cellspacing="0" border="0" summary="">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t1RegionHeader">#TITLE#</td>'||chr(10)||
'<td class="t1ButtonHolder">#CLOSE#&nbsp;&nbsp;&nbsp;#PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##HELP#</td>'||chr(10)||
'</tr>'||chr(10)||
'</table></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<t';

t:=t||'d class="t1Body">#BODY#</td>'||chr(10)||
'</tr>'||chr(10)||
'</table>';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 6516117765583100 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Chart Region',
  p_plug_table_bgcolor     => '#ffffff',
  p_theme_id  => 1,
  p_theme_class_id => 30,
  p_plug_heading_bgcolor => '#ffffff',
  p_plug_font_size => '-1',
  p_translate_this_template => 'N',
  p_template_comment       => 'Red Theme');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 6516117765583100 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/region/form_region
prompt  ......region template 6516232166583100
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table cellpadding="0" cellspacing="0" border="0" summary="" class="t1FormRegion" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>'||chr(10)||
'<tr>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_1/1px_trans.gif" height="1" width="400" alt="" /><table width="100%" cellpadding="0" cellspacing="0" border="0" summary="">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t1RegionHeader">#TITLE#</td>'||chr(10)||
'<td class="t1ButtonHolder">#CLOSE#&nbsp;&nbsp;&nbsp;#PREVI';

t:=t||'OUS##NEXT##DELETE##EDIT##CHANGE##CREATE##HELP#</td>'||chr(10)||
'</tr>'||chr(10)||
'</table></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t1Body">#BODY#<img src="#IMAGE_PREFIX#/themes/theme_1/1px_trans.gif" height="1" width="600" style="display:block;" alt="" /></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 6516232166583100 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Form Region',
  p_plug_table_bgcolor     => '#f7f7e7',
  p_theme_id  => 1,
  p_theme_class_id => 8,
  p_plug_heading_bgcolor => '#f7f7e7',
  p_plug_font_size => '-1',
  p_translate_this_template => 'N',
  p_template_comment       => 'Red Theme');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 6516232166583100 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/region/hide_and_show_region
prompt  ......region template 6516312147583101
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table cellpadding="0" cellspacing="0" border="0" summary="" class="t1HideandShowRegion" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>'||chr(10)||
'<tr>'||chr(10)||
'<td><table width="100%" cellpadding="0" cellspacing="0" border="0" summary="">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t1RegionHeader">#TITLE#<a style="margin-left:5px;" href="javascript:hideShow(''region#REGION_SEQUENCE_ID#'',''shIMG#REGION_SEQUENCE_ID#'',''#IMAGE_PREFIX#themes/theme_1/ro';

t:=t||'llup_plus_dgray.gif'',''#IMAGE_PREFIX#themes/theme_1/rollup_minus_dgray.gif'');" class="t1HideandShowRegionLink"><img src="#IMAGE_PREFIX#themes/theme_1/rollup_plus_dgray.gif" '||chr(10)||
'  id="shIMG#REGION_SEQUENCE_ID#" alt="" /></a></td>'||chr(10)||
'<td class="t1ButtonHolder">#CLOSE#&nbsp;&nbsp;&nbsp;#PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##HELP#</td>'||chr(10)||
'</tr>'||chr(10)||
'</table></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t1Body"><div class="t1H';

t:=t||'ide" id="region#REGION_SEQUENCE_ID#">#BODY#</div></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 6516312147583101 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Hide and Show Region',
  p_plug_table_bgcolor     => '',
  p_theme_id  => 1,
  p_theme_class_id => 1,
  p_plug_heading_bgcolor => '',
  p_plug_font_size => '',
  p_translate_this_template => 'N',
  p_template_comment       => 'Gray Head, white body');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 6516312147583101 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/region/navigation_region
prompt  ......region template 6516412817583101
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<div class="t1NavigationRegion" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>#BODY#</div>';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 6516412817583101 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Navigation Region',
  p_plug_table_bgcolor     => '',
  p_theme_id  => 1,
  p_theme_class_id => 5,
  p_plug_heading_bgcolor => '',
  p_plug_font_size => '',
  p_translate_this_template => 'N',
  p_template_comment       => '');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 6516412817583101 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/region/navigation_region_alternative_1
prompt  ......region template 6516505995583102
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table cellpadding="0" cellspacing="0" border="0" summary="" class="t1NavigationRegionAlternative1" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t1RegionHeader">#TITLE#</td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t1Body">#BODY#</td>'||chr(10)||
'</tr>'||chr(10)||
'</table>';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 6516505995583102 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Navigation Region, Alternative 1',
  p_plug_table_bgcolor     => '',
  p_theme_id  => 1,
  p_theme_class_id => 16,
  p_plug_heading_bgcolor => '',
  p_plug_font_size => '',
  p_translate_this_template => 'N',
  p_template_comment       => '');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 6516505995583102 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/region/region_without_buttons_and_titles
prompt  ......region template 6516606081583102
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table summary="" cellpadding="0" cellspacing="0" border="0" class="t1RegionwithoutButtonsandTitles" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t1Body">#BODY#</td>'||chr(10)||
'</tr>'||chr(10)||
'</table>'||chr(10)||
''||chr(10)||
'';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 6516606081583102 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Region without Buttons and Titles',
  p_plug_table_bgcolor     => '',
  p_theme_id  => 1,
  p_theme_class_id => 19,
  p_plug_heading_bgcolor => '',
  p_plug_font_size => '',
  p_translate_this_template => 'N',
  p_template_comment       => '');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 6516606081583102 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/region/region_without_title
prompt  ......region template 6516721856583102
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table cellpadding="0" cellspacing="0" border="0" summary="" class="t1RegionwithoutTitle" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t1ButtonHolder">#CLOSE#&nbsp;&nbsp;&nbsp;#PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##HELP#</td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t1Body">#BODY#</td>'||chr(10)||
'</tr>'||chr(10)||
'</table>';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 6516721856583102 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Region without Title',
  p_plug_table_bgcolor     => '',
  p_theme_id  => 1,
  p_theme_class_id => 11,
  p_plug_heading_bgcolor => '',
  p_plug_font_size => '',
  p_translate_this_template => 'N',
  p_template_comment       => '');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 6516721856583102 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/region/report_filter_single_row
prompt  ......region template 6516807546583102
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table class="apex_finderbar" cellpadding="0" cellspacing="0" border="0" summary="" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>'||chr(10)||
'<tbody>'||chr(10)||
'<tr>'||chr(10)||
'<td class="apex_finderbar_left_top" valign="top"><img src="#IMAGE_PREFIX#1px_trans.gif" width="10" height="8" alt=""  class="spacer" alt="" /></td>'||chr(10)||
'<td class="apex_finderbar_middle" rowspan="3" valign="middle"><img src="#IMAGE_PREFIX#htmldb/builder/builder_f';

t:=t||'ind.png" /></td>'||chr(10)||
'<td class="apex_finderbar_middle" rowspan="3" valign="middle" style="">#BODY#</td>'||chr(10)||
'<td class="apex_finderbar_left" rowspan="3" width="10"><br /></td>'||chr(10)||
'<td class="apex_finderbar_buttons" rowspan="3" valign="middle" nowrap="nowrap"><span class="apex_close">#CLOSE#</span><span>#EDIT##CHANGE##DELETE##CREATE##CREATE2##COPY##PREVIOUS##NEXT##EXPAND##HELP#</span></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr><td class="';

t:=t||'apex_finderbar_left_middle"><br /></td></tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="apex_finderbar_left_bottom" valign="bottom"><img src="#IMAGE_PREFIX#1px_trans.gif" width="10" height="8"  class="spacer" alt="" /></td>'||chr(10)||
'</tr>'||chr(10)||
'</tbody>'||chr(10)||
'</table>';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 6516807546583102 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Report Filter - Single Row',
  p_plug_table_bgcolor     => '',
  p_theme_id  => 1,
  p_theme_class_id => 31,
  p_plug_heading_bgcolor => '',
  p_plug_font_size => '',
  p_translate_this_template => 'N',
  p_template_comment       => '');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 6516807546583102 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/region/report_list
prompt  ......region template 6516924144583102
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table cellpadding="0" cellspacing="0" border="0" summary="" class="t1ListRegionwithIcon" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t1RegionHeader">#TITLE#</td>'||chr(10)||
'<td class="t1ButtonHolder">#CLOSE#&nbsp;&nbsp;&nbsp;#PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##HELP#</td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t1Body" colspan="2"><table cellpadding="0" cellspacing="0" border="0" summary="" ><tr>'||chr(10)||
'<';

t:=t||'td valign="top"><img src="#IMAGE_PREFIX#themes/theme_1/report.gif" alt=""/></td>'||chr(10)||
'<td>#BODY#</td></tr></table></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 6516924144583102 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Report List',
  p_plug_table_bgcolor     => '#ffffff',
  p_theme_id  => 1,
  p_theme_class_id => 29,
  p_plug_heading_bgcolor => '#ffffff',
  p_plug_font_size => '-1',
  p_translate_this_template => 'N',
  p_template_comment       => 'Red Theme');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 6516924144583102 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/region/reports_region
prompt  ......region template 6517030617583102
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table cellpadding="0" cellspacing="0" border="0" summary="" class="t1ReportsRegion" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t1RegionHeader">#TITLE#</td>'||chr(10)||
'<td class="t1ButtonHolder">#CLOSE#&nbsp;&nbsp;&nbsp;#PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##HELP#</td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t1Body" colspan="2">#BODY#</td>'||chr(10)||
'</tr>'||chr(10)||
'</table>';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 6517030617583102 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Reports Region',
  p_plug_table_bgcolor     => '#ffffff',
  p_theme_id  => 1,
  p_theme_class_id => 9,
  p_plug_heading_bgcolor => '#ffffff',
  p_plug_font_size => '-1',
  p_translate_this_template => 'N',
  p_template_comment       => 'Red Theme');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 6517030617583102 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/region/reports_region_100_width
prompt  ......region template 6517123202583102
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table cellpadding="0" cellspacing="0" border="0" summary="" class="t1ReportsRegion100Width" width="100%" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t1RegionHeader">#TITLE#</td>'||chr(10)||
'<td class="t1ButtonHolder">#CLOSE#&nbsp;&nbsp;&nbsp;#PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##HELP#</td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t1Body" colspan="2">#BODY#</td>'||chr(10)||
'</tr>'||chr(10)||
'</table>';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 6517123202583102 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Reports Region 100% Width',
  p_plug_table_bgcolor     => '#ffffff',
  p_theme_id  => 1,
  p_theme_class_id => 13,
  p_plug_heading_bgcolor => '#ffffff',
  p_plug_font_size => '-1',
  p_translate_this_template => 'N',
  p_template_comment       => 'Red Theme');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 6517123202583102 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/region/reports_region_alternative_1
prompt  ......region template 6517227929583102
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table cellpadding="0" cellspacing="0" border="0" summary="" class="t1ReportsRegionAlternative1" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t1RegionHeader">#TITLE#</td>'||chr(10)||
'<td class="t1ButtonHolder">#CLOSE#&nbsp;&nbsp;&nbsp;#PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##HELP#</td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t1Body" colspan="2">#BODY#</td>'||chr(10)||
'</tr>'||chr(10)||
'</table>';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 6517227929583102 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Reports Region, Alternative 1',
  p_plug_table_bgcolor     => '#ffffff',
  p_theme_id  => 1,
  p_theme_class_id => 10,
  p_plug_heading_bgcolor => '#ffffff',
  p_plug_font_size => '-1',
  p_translate_this_template => 'N',
  p_template_comment       => 'Red Theme');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 6517227929583102 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/region/sidebar_region
prompt  ......region template 6517319813583104
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table cellspacing="0" cellpadding="0" border="0" class="t1SidebarRegion" summary="" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES# align="right">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t1EndCaps" valign="top"><img src="#IMAGE_PREFIX#themes/theme_1/left_curve.gif" width="10" height="20" alt="" /></td>'||chr(10)||
'<td class="t1RegionHeader">#TITLE#</td>'||chr(10)||
'<td class="t1EndCaps" valign="top"><img src="#IMAGE_PREFIX#themes/theme_1/right_cur';

t:=t||'ve.gif" width="10" height="20" alt="" /></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td colspan="3" class="t1Body">#BODY#</td>'||chr(10)||
'</tr>'||chr(10)||
'</table><br />';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 6517319813583104 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Sidebar Region',
  p_plug_table_bgcolor     => '#f7f7e7',
  p_theme_id  => 1,
  p_theme_class_id => 2,
  p_plug_heading_bgcolor => '#f7f7e7',
  p_plug_font_size => '-1',
  p_translate_this_template => 'N',
  p_template_comment       => '<table border="0" cellpadding="0" cellspacing="0">'||chr(10)||
'        <tr>'||chr(10)||
'          <td rowspan="2" valign="top" width="4" bgcolor="#FF0000"><img src="#IMAGE_PREFIX#tl_img.gif" border="0" width="4" height="18" alt="" /></td>'||chr(10)||
'          <td bgcolor="#000000" height="1"><img src="#IMAGE_PREFIX#stretch.gif" width="142" height="1" border="0" alt="" /></td>'||chr(10)||
'          <td rowspan="2" valign="top" width="4" bgcolor="#FF0000"><img src="#IMAGE_PREFIX#tr_img.gif" border="0" width="4" height="18" alt="" /></td>'||chr(10)||
'        </tr>'||chr(10)||
'        <tr>'||chr(10)||
'          <td bgcolor="#FF0000" height="16">'||chr(10)||
'            <table border="0" cellpadding="0" cellspacing="0" width="100%">'||chr(10)||
'              <tr>'||chr(10)||
'                <td align=middle valign="top">'||chr(10)||
'                  <div align="center">'||chr(10)||
'                     <font color="#ffffff" face="Arial, Helvetica, sans-serif" size="1">'||chr(10)||
'                      <b>#TITLE# </b></font></div>'||chr(10)||
'                </td>'||chr(10)||
'              </tr>'||chr(10)||
'            </table>'||chr(10)||
'          </td>'||chr(10)||
'        </tr>'||chr(10)||
'</table>'||chr(10)||
'<table border="0" cellpadding="0" cellspacing="0">'||chr(10)||
'   <tr>'||chr(10)||
'   <td bgcolor="#000000" width="1" height="96"><img src="#IMAGE_PREFIX#stretch.gif" width="1" height="1" border="0" alt="" /></td>'||chr(10)||
'   <td valign="top" height="96"><img src="#IMAGE_PREFIX#stretch.gif" width="146" height="1" border="0" alt="" /><br />'||chr(10)||
'            <table border="0" cellpadding="1" cellspacing="0" width="146" summary="">'||chr(10)||
'              <tr>'||chr(10)||
'                <td colspan="2">'||chr(10)||
'                  <table border="0" cellpadding="2" cellspacing="0" width="124" summary="">'||chr(10)||
'                    <tr>'||chr(10)||
'                      <td>&nbsp;</td>'||chr(10)||
'                      <td valign="top" width="106">'||chr(10)||
'                        <P><FONT face="arial, helvetica" size="1">'||chr(10)||
'                            #BODY#'||chr(10)||
'                           </font>'||chr(10)||
'                        </P>'||chr(10)||
'                      </td>'||chr(10)||
'                    </tr>'||chr(10)||
'                  </table>'||chr(10)||
'            </table>'||chr(10)||
'          </td>'||chr(10)||
'          <td bgcolor="#000000" width="1" height="96"><img src="#IMAGE_PREFIX#stretch.gif" width="1" height="1" border="0" alt="" /></td>'||chr(10)||
'          <td bgcolor="#9a9c9a" width="1" height="96"><img src="#IMAGE_PREFIX#stretch.gif" width="1" height="1" border="0" alt="" /></td>'||chr(10)||
'          <td bgcolor="#b3b4b3" width="1" height="96"><img src="#IMAGE_PREFIX#stretch.gif" width="1" height="1" border="0" alt="" /></td>'||chr(10)||
'        </tr>'||chr(10)||
'      </table>'||chr(10)||
'      <table border="0" cellpadding="0" cellspacing="0">'||chr(10)||
'        <tr>'||chr(10)||
'          <td rowspan="4" valign="top" width="4"><img src="#IMAGE_PREFIX#bl_img.gif" border="0" width="4" height="6" alt="" /></td>'||chr(10)||
'          <td bgcolor="#ffffff" height="2"><img src="#IMAGE_PREFIX#stretch.gif" width="142" height="1" border="0" alt="" /></td>'||chr(10)||
'          <td rowspan="4" valign="top" width="4"><img src="#IMAGE_PREFIX#br_img.gif" border="0" width="4" height="6" alt="" /></td>'||chr(10)||
'        </tr>'||chr(10)||
'        <tr>'||chr(10)||
'          <td bgcolor="#000000" width="1"><img src="#IMAGE_PREFIX#stretch.gif" width="1" height="1" border="0" alt="" /></td>'||chr(10)||
'        </tr>'||chr(10)||
'        <tr>'||chr(10)||
'          <td bgcolor="#9a9c9a" width="1"><img src="#IMAGE_PREFIX#stretch.gif" width="1" height="1" border="0" alt="" /></td>'||chr(10)||
'        </tr>'||chr(10)||
'        <tr>'||chr(10)||
'          <td bgcolor="#b3b4b3" width="1" height="2"><img src="#IMAGE_PREFIX#stretch.gif" width="1" height="1" border="0" alt="" /></td>'||chr(10)||
'        </tr>'||chr(10)||
'</table>'||chr(10)||
'');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 6517319813583104 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/region/sidebar_region_alternative_1
prompt  ......region template 6517412720583104
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table cellspacing="0" cellpadding="0" border="0" class="t1SidebarRegionAlternative1" summary="" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES# align="right">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t1EndCaps" valign="top"><img src="#IMAGE_PREFIX#themes/theme_1/left_curve.gif" width="10" height="20" alt="" /></td>'||chr(10)||
'<td class="t1RegionHeader">#TITLE#</td>'||chr(10)||
'<td class="t1EndCaps" valign="top"><img src="#IMAGE_PREFIX#themes/theme';

t:=t||'_1/right_curve.gif" width="10" height="20" alt="" /></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td colspan="3" class="t1Body">#BODY#</td>'||chr(10)||
'</tr>'||chr(10)||
'</table><br />';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 6517412720583104 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Sidebar Region, Alternative 1',
  p_plug_table_bgcolor     => '#f7f7e7',
  p_theme_id  => 1,
  p_theme_class_id => 3,
  p_plug_heading_bgcolor => '#f7f7e7',
  p_plug_font_size => '-1',
  p_translate_this_template => 'N',
  p_template_comment       => '');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 6517412720583104 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/region/wizard_region
prompt  ......region template 6517500342583104
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table cellpadding="0" cellspacing="0" border="0" summary="" class="t1WizardRegion" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t1RegionHeader">#TITLE#</td>'||chr(10)||
'<td class="t1ButtonHolder">#CLOSE#&nbsp;&nbsp;&nbsp;#PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##HELP#</td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t1Body" colspan="2">#BODY#</td>'||chr(10)||
'</tr>'||chr(10)||
'</table>';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 6517500342583104 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Wizard Region',
  p_plug_table_bgcolor     => '',
  p_theme_id  => 1,
  p_theme_class_id => 12,
  p_plug_heading_bgcolor => '',
  p_plug_font_size => '',
  p_translate_this_template => 'N',
  p_template_comment       => '');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 6517500342583104 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/region/wizard_region_with_icon
prompt  ......region template 6517606923583104
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table cellpadding="0" cellspacing="0" border="0" summary="" class="t1WizardRegionwithIcon" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t1RegionHeader">#TITLE#</td>'||chr(10)||
'<td class="t1ButtonHolder">#CLOSE#&nbsp;&nbsp;&nbsp;#PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##HELP#</td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t1Body" colspan="2"><table summary="" cellpadding="0" cellspacing="0" border="0">'||chr(10)||
'<tr>';

t:=t||''||chr(10)||
'<td valign="top"><img src="#IMAGE_PREFIX#themes/theme_1/wizard_icon.gif" alt=""/></td>'||chr(10)||
'<td width="100%" valign="top">#BODY#</td>'||chr(10)||
'</tr>'||chr(10)||
'</table></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 6517606923583104 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Wizard Region with Icon',
  p_plug_table_bgcolor     => '',
  p_theme_id  => 1,
  p_theme_class_id => 20,
  p_plug_heading_bgcolor => '',
  p_plug_font_size => '',
  p_translate_this_template => 'N',
  p_template_comment       => '');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 6517606923583104 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/region/borderless_region
prompt  ......region template 9015115240033194
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table class="t6BorderlessRegion" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES# summary="">'||chr(10)||
'<tr><td><div class="regionHeader">#TITLE#</div></td></tr>'||chr(10)||
''||chr(10)||
'<tr><td class="t6Body">#BODY#</td></tr>'||chr(10)||
'</table>';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 9015115240033194 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Borderless Region',
  p_plug_table_bgcolor     => '#f7f7e7',
  p_theme_id  => 101,
  p_theme_class_id => 7,
  p_plug_heading_bgcolor => '#f7f7e7',
  p_plug_font_size => '-1',
  p_translate_this_template => 'N',
  p_template_comment       => 'Red Theme');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 9015115240033194 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/region/bracketed_region
prompt  ......region template 9015416224033195
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table class="t6BracketedRegion" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES# summary="">'||chr(10)||
'<tr><td class="t6Header">#TITLE#</td></tr>'||chr(10)||
'<tr><td align="center" style="border:1px solid black;border-bottom:none;">&nbsp;</td></tr>'||chr(10)||
'<tr><td class="t6Body">#BODY#</td></tr>'||chr(10)||
'<tr><td class="t6Body">#CLOSE#&nbsp;&nbsp;&nbsp;#PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#</td></tr>'||chr(10)||
'</t';

t:=t||'able>';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 9015416224033195 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Bracketed Region',
  p_plug_table_bgcolor     => '#ffffff',
  p_theme_id  => 101,
  p_theme_class_id => 18,
  p_plug_heading_bgcolor => '#ffffff',
  p_plug_font_size => '-1',
  p_translate_this_template => 'N',
  p_template_comment       => 'Red Theme');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 9015416224033195 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/region/breadcrumb_region
prompt  ......region template 9015703988033195
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<div class="t6BreadcrumbRegion" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>#BODY#</div>';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 9015703988033195 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Breadcrumb Region',
  p_plug_table_bgcolor     => '',
  p_theme_id  => 101,
  p_theme_class_id => 6,
  p_plug_heading_bgcolor => '',
  p_plug_font_size => '',
  p_translate_this_template => 'N',
  p_template_comment       => '');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 9015703988033195 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/region/button_region_with_title
prompt  ......region template 9016024258033196
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table class="t6ButtonRegionWithTitle" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES# summary="">'||chr(10)||
'<tr><td class="t6Header">#TITLE#</td></tr>'||chr(10)||
'<tr><td class="t6ButtonHolder">#CLOSE#&nbsp;&nbsp;&nbsp;#PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#</td></tr>'||chr(10)||
'<tr><td class="t6Body">#BODY#</td></tr>'||chr(10)||
'</table>';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 9016024258033196 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Button Region with Title',
  p_plug_table_bgcolor     => '',
  p_theme_id  => 101,
  p_theme_class_id => 4,
  p_plug_heading_bgcolor => '',
  p_plug_font_size => '',
  p_translate_this_template => 'N',
  p_template_comment       => '');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 9016024258033196 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/region/button_region_without_title
prompt  ......region template 9016308414033196
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table class="t6ButtonRegionWithoutTitle" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES# summary="">'||chr(10)||
'<tr><td class="t6ButtonHolder">#CLOSE#&nbsp;&nbsp;&nbsp;#PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#</td></tr>'||chr(10)||
'<tr><td class="t6Body">#BODY#</td></tr>'||chr(10)||
'</table>';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 9016308414033196 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Button Region without Title',
  p_plug_table_bgcolor     => '#ffffff',
  p_theme_id  => 101,
  p_theme_class_id => 17,
  p_plug_heading_bgcolor => '#ffffff',
  p_plug_font_size => '-1',
  p_translate_this_template => 'N',
  p_template_comment       => 'Red Theme');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 9016308414033196 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/region/chart_list
prompt  ......region template 9016609011033196
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table class="t6ListRegionWithIcon" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES# summary="">'||chr(10)||
'<tr><td colspan="2" class="t6Header">#TITLE#</td></tr>'||chr(10)||
'<tr><td colspan="2" class="t6ButtonHolder">#CLOSE#&nbsp;&nbsp;&nbsp;#PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#</td></tr>'||chr(10)||
'<tr>'||chr(10)||
'  <td valign="top"><img src="#IMAGE_PREFIX#themes/theme_6/ChartList.gif" alt="" />&nbsp;</td>'||chr(10)||
'';

t:=t||'  <td valign="top" class="t6Body">#BODY#</td>'||chr(10)||
'</tr>'||chr(10)||
'</table>';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 9016609011033196 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Chart List',
  p_plug_table_bgcolor     => '#ffffff',
  p_theme_id  => 101,
  p_theme_class_id => 29,
  p_plug_heading_bgcolor => '#ffffff',
  p_plug_font_size => '-1',
  p_translate_this_template => 'N',
  p_template_comment       => '');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 9016609011033196 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/region/chart_region
prompt  ......region template 9016904943033196
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table class="t6ChartRegion" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES# summary="">'||chr(10)||
' <tr>'||chr(10)||
'  <td class="t6Header">#TITLE#</td>'||chr(10)||
' </tr>'||chr(10)||
' <tr>'||chr(10)||
'  <td class="t6ButtonHolder">#CLOSE#&nbsp;&nbsp;&nbsp;#PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#</td>'||chr(10)||
' </tr>'||chr(10)||
' <tr>'||chr(10)||
'  <td class="t6Body">#BODY#</td>'||chr(10)||
' </tr>'||chr(10)||
'</table>'||chr(10)||
'';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 9016904943033196 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Chart Region',
  p_plug_table_bgcolor     => '#ffffff',
  p_theme_id  => 101,
  p_theme_class_id => 30,
  p_plug_heading_bgcolor => '#ffffff',
  p_plug_font_size => '-1',
  p_translate_this_template => 'N',
  p_template_comment       => '');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 9016904943033196 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/region/form_region
prompt  ......region template 9017212434033196
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table class="t6FormRegion" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES# summary="">'||chr(10)||
'<tr><td class="t6Header">#TITLE#</td></tr>'||chr(10)||
'<tr><td class="t6ButtonHolder">#CLOSE#&nbsp;&nbsp;&nbsp;#PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#</td></tr>'||chr(10)||
'<tr><td class="t6Body">#BODY#</td></tr>'||chr(10)||
'<tr><td><img src="#IMAGE_PREFIX#themes/theme_6/t.gif" width="400" height="1" alt="" /></td>';

t:=t||'</tr>'||chr(10)||
'</table>';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 9017212434033196 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Form Region',
  p_plug_table_bgcolor     => '#f7f7e7',
  p_theme_id  => 101,
  p_theme_class_id => 8,
  p_plug_heading_bgcolor => '#f7f7e7',
  p_plug_font_size => '-1',
  p_translate_this_template => 'N',
  p_template_comment       => '');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 9017212434033196 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/region/hide_and_show_region
prompt  ......region template 9017514534033197
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table width="100%" cellpadding="0" cellspacing="0" border="0"  class="t6HideAndShowRegion" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES# summary="">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t6Header">#TITLE#<a href="javascript:hideShow(''region#REGION_SEQUENCE_ID#'',''shIMG#REGION_SEQUENCE_ID#'',''#IMAGE_PREFIX#htmldb/builder/rollup_plus_dgray.gif'',''#IMAGE_PREFIX#htmldb/builder/rollup_minus_dgray.gif'');" class="htmldbHideShowMi';

t:=t||'nLink"><img src="#IMAGE_PREFIX#htmldb/builder/rollup_plus_dgray.gif" id="shIMG#REGION_SEQUENCE_ID#" alt="" /></a></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td><div class="t6Hide" id="region#REGION_SEQUENCE_ID#">'||chr(10)||
'<div class="t6ButtonHolder">#CLOSE#&nbsp;&nbsp;&nbsp;#PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#</div>'||chr(10)||
'<div class="t6Body">#BODY#</div>'||chr(10)||
'</div></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 9017514534033197 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Hide and Show Region',
  p_plug_table_bgcolor     => '#ffffff',
  p_theme_id  => 101,
  p_theme_class_id => 1,
  p_plug_heading_bgcolor => '#ffffff',
  p_plug_font_size => '-1',
  p_translate_this_template => 'N',
  p_template_comment       => '');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 9017514534033197 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/region/list_region_with_icon
prompt  ......region template 9017830805033197
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table class="t6ListRegionWithIcon" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES# summary="">'||chr(10)||
' <tr><td class="t6Header">#TITLE#</td></tr>'||chr(10)||
' <tr><td class="t6ButtonHolder">#CLOSE#&nbsp;&nbsp;&nbsp;#PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#</td></tr>'||chr(10)||
' <td><td class="t6Body"><img src="#IMAGE_PREFIX#themes/theme_6/provisioning_reports.gif" alt="" />#BODY#</td></tr>'||chr(10)||
'</tabl';

t:=t||'e>';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 9017830805033197 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'List Region with Icon',
  p_plug_table_bgcolor     => '#ffffff',
  p_theme_id  => 101,
  p_theme_class_id => 29,
  p_plug_heading_bgcolor => '#ffffff',
  p_plug_font_size => '-1',
  p_translate_this_template => 'N',
  p_template_comment       => '');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 9017830805033197 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/region/navigation_region
prompt  ......region template 9018118180033198
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table class="t6NavigationRegion" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES# summary="">'||chr(10)||
' <tr><td class="t6ButtonHolder">#CLOSE#&nbsp;&nbsp;&nbsp;#PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#</td></tr>'||chr(10)||
' <tr><td class="t6Body">#BODY#</td></tr>'||chr(10)||
'</table>';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 9018118180033198 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Navigation Region',
  p_plug_table_bgcolor     => '',
  p_theme_id  => 101,
  p_theme_class_id => 5,
  p_plug_heading_bgcolor => '',
  p_plug_font_size => '',
  p_translate_this_template => 'N',
  p_template_comment       => '');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 9018118180033198 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/region/navigation_region_alternative_1
prompt  ......region template 9018407692033198
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table class="t6NavigationRegionAlternative1" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES# summary="">'||chr(10)||
' <tr><td class="t6Header">#TITLE#</td></tr>'||chr(10)||
' <tr><td class="t6Body">#BODY#</td></tr>'||chr(10)||
'</table>';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 9018407692033198 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Navigation Region, Alternative 1',
  p_plug_table_bgcolor     => '',
  p_theme_id  => 101,
  p_theme_class_id => 16,
  p_plug_heading_bgcolor => '',
  p_plug_font_size => '',
  p_translate_this_template => 'N',
  p_template_comment       => '');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 9018407692033198 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/region/region_without_buttons_and_title
prompt  ......region template 9018713648033198
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table class="t6RegionWithoutButtonsAndTitle" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES# summary="">'||chr(10)||
' <tr><td class="t6Body">#BODY#</td></tr>'||chr(10)||
'</table>'||chr(10)||
'';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 9018713648033198 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Region without Buttons and Title',
  p_plug_table_bgcolor     => '',
  p_theme_id  => 101,
  p_theme_class_id => 19,
  p_plug_heading_bgcolor => '',
  p_plug_font_size => '',
  p_translate_this_template => 'N',
  p_template_comment       => '');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 9018713648033198 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/region/region_without_title
prompt  ......region template 9019000389033198
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table class="t6RegionWithoutTitle" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES# summary="">'||chr(10)||
'<tr><td class="t6ButtonHolder">#CLOSE#&nbsp;&nbsp;&nbsp;#PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#</td></tr>'||chr(10)||
'<tr><td class="t6Body">#BODY#</td></tr>'||chr(10)||
'</table>'||chr(10)||
'';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 9019000389033198 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Region without Title',
  p_plug_table_bgcolor     => '',
  p_theme_id  => 101,
  p_theme_class_id => 11,
  p_plug_heading_bgcolor => '',
  p_plug_font_size => '',
  p_translate_this_template => 'N',
  p_template_comment       => '');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 9019000389033198 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/region/report_filter_single_row
prompt  ......region template 9019311063033199
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table class="apex_finderbar" cellpadding="0" cellspacing="0" border="0" summary="" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>'||chr(10)||
'<tbody>'||chr(10)||
'<tr>'||chr(10)||
'<td class="apex_finderbar_left_top" valign="top"><img src="#IMAGE_PREFIX#1px_trans.gif" width="10" height="8" alt=""  class="spacer" alt="" /></td>'||chr(10)||
'<td class="apex_finderbar_middle" rowspan="3" valign="middle"><img src="#IMAGE_PREFIX#htmldb/builder/builder_f';

t:=t||'ind.png" /></td>'||chr(10)||
'<td class="apex_finderbar_middle" rowspan="3" valign="middle" style="">#BODY#</td>'||chr(10)||
'<td class="apex_finderbar_left" rowspan="3" width="10"><br /></td>'||chr(10)||
'<td class="apex_finderbar_buttons" rowspan="3" valign="middle" nowrap="nowrap"><span class="apex_close">#CLOSE#</span><span>#EDIT##CHANGE##DELETE##CREATE##CREATE2##COPY##PREVIOUS##NEXT##EXPAND##HELP#</span></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr><td class="';

t:=t||'apex_finderbar_left_middle"><br /></td></tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="apex_finderbar_left_bottom" valign="bottom"><img src="#IMAGE_PREFIX#1px_trans.gif" width="10" height="8"  class="spacer" alt="" /></td>'||chr(10)||
'</tr>'||chr(10)||
'</tbody>'||chr(10)||
'</table>';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 9019311063033199 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Report Filter - Single Row',
  p_plug_table_bgcolor     => '',
  p_theme_id  => 101,
  p_theme_class_id => 31,
  p_plug_heading_bgcolor => '',
  p_plug_font_size => '',
  p_translate_this_template => 'N',
  p_template_comment       => '');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 9019311063033199 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/region/report_list
prompt  ......region template 9019621612033199
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table class="t6ListRegionWithIcon" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES# summary="">'||chr(10)||
'<tr><td colspan="2" class="t6Header">#TITLE#</td></tr>'||chr(10)||
'<tr><td colspan="2" class="t6ButtonHolder">#CLOSE#&nbsp;&nbsp;&nbsp;#PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#</td></tr>'||chr(10)||
'<tr>'||chr(10)||
'  <td valign="top"><img src="#IMAGE_PREFIX#themes/theme_6/ReportList.gif" alt="Reports" /></td';

t:=t||'>'||chr(10)||
'  <td valign="top" class="t6Body">#BODY#</td>'||chr(10)||
'</tr>'||chr(10)||
'</table>';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 9019621612033199 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Report List',
  p_plug_table_bgcolor     => '#ffffff',
  p_theme_id  => 101,
  p_theme_class_id => 29,
  p_plug_heading_bgcolor => '#ffffff',
  p_plug_font_size => '-1',
  p_translate_this_template => 'N',
  p_template_comment       => '');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 9019621612033199 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/region/reports_region
prompt  ......region template 9019926172033199
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table class="t6ReportsRegion" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES# summary="">'||chr(10)||
'<tr><td><div class="reportsRegionHeader">#TITLE#</div><p class="h-divider">&#160;</p></td></tr>'||chr(10)||
''||chr(10)||
'<tr><td class="t6Body">#BODY#</td></tr>'||chr(10)||
'</table>'||chr(10)||
'';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 9019926172033199 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Reports Region',
  p_plug_table_bgcolor     => '#ffffff',
  p_theme_id  => 101,
  p_theme_class_id => 9,
  p_plug_heading_bgcolor => '#ffffff',
  p_plug_font_size => '-1',
  p_translate_this_template => 'N',
  p_template_comment       => '');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 9019926172033199 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/region/reports_region_100_width
prompt  ......region template 9020223170033200
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table class="t6ReportsRegion100PercentWidth" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES# summary="">'||chr(10)||
' <tr><td class="t6Header">#TITLE#</td></tr>'||chr(10)||
' <tr><td class="t6ButtonHolder">#CLOSE#&nbsp;&nbsp;&nbsp;#PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#</td></tr>'||chr(10)||
' <tr><td class="t6Body">#BODY#</td></tr>'||chr(10)||
'</table>'||chr(10)||
''||chr(10)||
'';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 9020223170033200 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Reports Region 100% Width',
  p_plug_table_bgcolor     => '#ffffff',
  p_theme_id  => 101,
  p_theme_class_id => 13,
  p_plug_heading_bgcolor => '#ffffff',
  p_plug_font_size => '-1',
  p_translate_this_template => 'N',
  p_template_comment       => '');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 9020223170033200 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/region/reports_region_alternative_1
prompt  ......region template 9020522103033200
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table class="t6ReportsRegionAlternative1" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES# summary="">'||chr(10)||
'<tr><td class="t6Header">#TITLE#</td></tr>'||chr(10)||
'<tr><td class="t6ButtonHolder">#CLOSE#&nbsp;&nbsp;&nbsp;#PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#</td></tr>'||chr(10)||
'<tr><td class="t6Body">#BODY#</td></tr>'||chr(10)||
'</table>'||chr(10)||
'';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 9020522103033200 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Reports Region, Alternative 1',
  p_plug_table_bgcolor     => '#ffffff',
  p_theme_id  => 101,
  p_theme_class_id => 10,
  p_plug_heading_bgcolor => '#ffffff',
  p_plug_font_size => '-1',
  p_translate_this_template => 'N',
  p_template_comment       => '');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 9020522103033200 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/region/sidebar_region
prompt  ......region template 9020808898033200
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table class="t6SidebarRegion" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES# summary="">'||chr(10)||
' <tr><td class="t6Header">#TITLE#</td></tr>'||chr(10)||
' <tr><td class="t6Body">#BODY#</td></tr>'||chr(10)||
' <tr><td class="t6ButtonHolder">#CLOSE#&nbsp;&nbsp;&nbsp;#PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#</td></tr>'||chr(10)||
'</table>';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 9020808898033200 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Sidebar Region',
  p_plug_table_bgcolor     => '#f7f7e7',
  p_theme_id  => 101,
  p_theme_class_id => 2,
  p_plug_heading_bgcolor => '#f7f7e7',
  p_plug_font_size => '-1',
  p_translate_this_template => 'N',
  p_template_comment       => '');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 9020808898033200 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/region/sidebar_region_alternative_1
prompt  ......region template 9021131111033200
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table class="t6SidebarRegionAlternative1" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES# summary="">'||chr(10)||
' <tr><td class="t6Header">#TITLE#</td></tr>'||chr(10)||
' <tr><td class="t6Body">#BODY#</td></tr>'||chr(10)||
' <tr><td class="t6ButtonHolder">#CLOSE#&nbsp;&nbsp;&nbsp;#PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#</td></tr>'||chr(10)||
'</table>'||chr(10)||
'';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 9021131111033200 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Sidebar Region, Alternative 1',
  p_plug_table_bgcolor     => '#f7f7e7',
  p_theme_id  => 101,
  p_theme_class_id => 3,
  p_plug_heading_bgcolor => '#f7f7e7',
  p_plug_font_size => '-1',
  p_translate_this_template => 'N',
  p_template_comment       => '');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 9021131111033200 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/region/wizard_region
prompt  ......region template 9021432005033201
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table class="t6WizardRegion" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES# summary="">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t6Header">#TITLE#</td>'||chr(10)||
'<td class="t6ButtonHolder">#CLOSE#&nbsp;&nbsp;&nbsp;#PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#</td>'||chr(10)||
'</tr>'||chr(10)||
'<tr><td colspan="2" class="t6Body">#BODY#</td></tr>'||chr(10)||
'</table>'||chr(10)||
'';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 9021432005033201 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Wizard Region',
  p_plug_table_bgcolor     => '',
  p_theme_id  => 101,
  p_theme_class_id => 12,
  p_plug_heading_bgcolor => '',
  p_plug_font_size => '',
  p_translate_this_template => 'N',
  p_template_comment       => '');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 9021432005033201 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/region/wizard_region_with_icon
prompt  ......region template 9021717649033201
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table class="t6WizardRegionWithIcon" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES# summary="">'||chr(10)||
'<tr>'||chr(10)||
'  <td class="t6Header">#TITLE#</td>'||chr(10)||
'  <td class="t6ButtonHolder">#CLOSE#&nbsp;&nbsp;&nbsp;#PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#</td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
' <td colspan="2" class="t6Body">'||chr(10)||
'  <table width="100%" summary="">'||chr(10)||
'    <tr><td><img src="#IMAGE_PREFIX#themes/theme_6/W';

t:=t||'izardIcon.gif" alt="" />&nbsp;</td><td>#BODY#</td></tr>'||chr(10)||
'  </table>'||chr(10)||
' </td>'||chr(10)||
'</tr>'||chr(10)||
'</table>';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 9021717649033201 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Wizard Region with Icon',
  p_plug_table_bgcolor     => '',
  p_theme_id  => 101,
  p_theme_class_id => 20,
  p_plug_heading_bgcolor => '',
  p_plug_font_size => '',
  p_translate_this_template => 'N',
  p_template_comment       => '');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 9021717649033201 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

prompt  ...List Templates
--
--application/shared_components/user_interface/templates/list/button_list
prompt  ......list template 6517728705583106
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<table class="t1ButtonList" cellspacing="0" cellpadding="0" border="0" summary="">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t1L"><img src="#IMAGE_PREFIX#/themes/theme_1/list_button_left_hl.gif" alt="" /></td>'||chr(10)||
'<td class="t1C"><a href="#LINK#" style="color:#FFFFFF;">#TEXT#</a></td>'||chr(10)||
'<td class="t1R"><img src="#IMAGE_PREFIX#/themes/theme_1/list_button_right_hl.gif" alt="" /></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>';

t2:=t2||'<table class="t1ButtonList" cellspacing="0" cellpadding="0" border="0" summary="">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t1L"><img src="#IMAGE_PREFIX#/themes/theme_1/list_button_left.gif" alt="" /></td>'||chr(10)||
'<td class="t1NC"><a href="#LINK#">#TEXT#</a></td>'||chr(10)||
'<td class="t1R"><img src="#IMAGE_PREFIX#/themes/theme_1/list_button_right.gif" alt="" /></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>6517728705583106 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Button List',
  p_theme_id  => 1,
  p_theme_class_id => 6,
  p_list_template_before_rows=>'<div class="t1ButtonList">',
  p_list_template_after_rows=>'</div>',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/hierarchical_expanded
prompt  ......list template 6517822358583119
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<li><a href="#LINK#">#TEXT#</a></li>';

t2:=t2||'<li><a href="#LINK#">#TEXT#</a></li>';

t3:=t3||'<li><a href="#LINK#">#TEXT#</a></li>';

t4:=t4||'<li><a href="#LINK#">#TEXT#</a></li>';

t5:=t5||'<li><a href="#LINK#">#TEXT#</a></li>';

t6:=t6||'<li><a href="#LINK#">#TEXT#</a></li>';

t7:=t7||'<li><a href="#LINK#">#TEXT#</a></li>';

t8:=t8||'<li><a href="#LINK#">#TEXT#</a></li>';

wwv_flow_api.create_list_template (
  p_id=>6517822358583119 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Hierarchical Expanded',
  p_theme_id  => 1,
  p_theme_class_id => 23,
  p_list_template_before_rows=>'<ul class="dhtmlTree">',
  p_list_template_after_rows=>'</ul><br style="clear:both;"/><br style="clear:both;"/>',
  p_before_sub_list=>'<ul id="#PARENT_LIST_ITEM_ID#" htmldb:listlevel="#LEVEL#">',
  p_after_sub_list=>'</ul>',
  p_sub_list_item_current=> t3,
  p_sub_list_item_noncurrent=> t4,
  p_item_templ_curr_w_child=> t5,
  p_item_templ_noncurr_w_child=> t6,
  p_sub_templ_curr_w_child=> t7,
  p_sub_templ_noncurr_w_child=> t8,
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/hierarchical_expanding
prompt  ......list template 6517907522583119
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<li><img src="#IMAGE_PREFIX#themes/theme_13/node.gif" align="middle" alt="" /><a href="#LINK#">#TEXT#</a></li>';

t2:=t2||'<li><img src="#IMAGE_PREFIX#themes/theme_13/node.gif" align="middle"  alt="" /><a href="#LINK#">#TEXT#</a></li>';

t3:=t3||'<li><img src="#IMAGE_PREFIX#themes/theme_13/node.gif" align="middle"  alt="" /><a href="#LINK#">#TEXT#</a></li>';

t4:=t4||'<li><img src="#IMAGE_PREFIX#themes/theme_13/node.gif"  align="middle" alt="" /><a href="#LINK#">#TEXT#</a></li>';

t5:=t5||'<li><img src="#IMAGE_PREFIX#themes/theme_13/plus.gif" align="middle"  onclick="htmldb_ToggleWithImage(this,''#LIST_ITEM_ID#'')" class="pseudoButtonInactive" alt="" /><a href="#LINK#">#TEXT#</a></li>';

t6:=t6||'<li><img src="#IMAGE_PREFIX#themes/theme_13/plus.gif" align="middle"  onclick="htmldb_ToggleWithImage(this,''#LIST_ITEM_ID#'')" class="pseudoButtonInactive" alt="" /><a href="#LINK#">#TEXT#</a></li>';

t7:=t7||'<li><img src="#IMAGE_PREFIX#themes/theme_13/plus.gif" onclick="htmldb_ToggleWithImage(this,''#LIST_ITEM_ID#'')" align="middle" class="pseudoButtonInactive" alt="" /><a href="#LINK#">#TEXT#</a></li>';

t8:=t8||'<li><img src="#IMAGE_PREFIX#themes/theme_13/plus.gif" onclick="htmldb_ToggleWithImage(this,''#LIST_ITEM_ID#'')" align="middle" class="pseudoButtonInactive" alt="" /><a href="#LINK#">#TEXT#</a></li>';

wwv_flow_api.create_list_template (
  p_id=>6517907522583119 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Hierarchical Expanding',
  p_theme_id  => 1,
  p_theme_class_id => 22,
  p_list_template_before_rows=>'<ul class="dhtmlTree">',
  p_list_template_after_rows=>'</ul><br style="clear:both;"/><br style="clear:both;"/>',
  p_before_sub_list=>'<ul id="#PARENT_LIST_ITEM_ID#" htmldb:listlevel="#LEVEL#" style="display:none;" class="dhtmlTree">',
  p_after_sub_list=>'</ul>',
  p_sub_list_item_current=> t3,
  p_sub_list_item_noncurrent=> t4,
  p_item_templ_curr_w_child=> t5,
  p_item_templ_noncurr_w_child=> t6,
  p_sub_templ_curr_w_child=> t7,
  p_sub_templ_noncurr_w_child=> t8,
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/horizontal_images_with_label_list
prompt  ......list template 6518008597583119
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<td class="t1current"><img src="#IMAGE_PREFIX##IMAGE#" #IMAGE_ATTR# alt="" / ><br />#TEXT#</td>';

t2:=t2||'<td><a href="#LINK#"><img src="#IMAGE_PREFIX##IMAGE#" #IMAGE_ATTR# alt="" / ></a><br /><a href="#LINK#">#TEXT#</a></td>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>6518008597583119 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Horizontal Images with Label List',
  p_theme_id  => 1,
  p_theme_class_id => 4,
  p_list_template_before_rows=>'<table cellspacing="0" cellpadding="0" border="0" class="t1HorizontalImageswithLabelList" summary=""><tr>',
  p_list_template_after_rows=>'</tr></table>',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/horizontal_links_list
prompt  ......list template 6518114907583120
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<a href="#LINK#" class="t1current">#TEXT#</a>';

t2:=t2||'<a href="#LINK#">#TEXT#</a>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>6518114907583120 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Horizontal Links List',
  p_theme_id  => 1,
  p_theme_class_id => 3,
  p_list_template_before_rows=>'<div class="t1HorizontalLinksList">',
  p_list_template_after_rows=>'</div>',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/pull_down_menu
prompt  ......list template 6518221620583120
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<li class="dhtmlMenuItem"><a href="#LINK#">#TEXT#</a></li>';

t2:=t2||'<li class="dhtmlMenuItem"><a href="#LINK#">#TEXT#</a></li>';

t3:=t3||'<li class="dhtmlMenuSep2"><img src="#IMAGE_PREFIX#themes/theme_13/1px_trans.gif"  width="1" height="1" alt="" class="dhtmlMenuSep2" /></li>';

t4:=t4||'<li><a href="#LINK#" class="dhtmlSubMenuN" onmouseover="dhtml_CloseAllSubMenusL(this)">#TEXT#</a></li>';

t5:=t5||'<li class="dhtmlMenuItem1"><a href="#LINK#">#TEXT#</a><img src="#IMAGE_PREFIX#themes/theme_13/menu_small.gif" alt="Expand" onclick="app_AppMenuMultiOpenBottom2(this,''#LIST_ITEM_ID#'',false)" /></li>';

t6:=t6||'<li class="dhtmlMenuItem1"><a href="#LINK#">#TEXT#</a><img src="#IMAGE_PREFIX#themes/theme_13/menu_small.gif" alt="Expand" onclick="app_AppMenuMultiOpenBottom2(this,''#LIST_ITEM_ID#'',false)" /></li>';

t7:=t7||'<li class="dhtmlSubMenuS"><a href="#LINK#" class="dhtmlSubMenuS" onmouseover="dhtml_MenuOpen(this,''#LIST_ITEM_ID#'',true,''Left'')"><span style="float:left;">#TEXT#</span><img class="t13MIMG" src="#IMAGE_PREFIX#menu_open_right2.gif" alt="" /></a></li>';

t8:=t8||'<li class="dhtmlSubMenuS"><a href="#LINK#" class="dhtmlSubMenuS" onmouseover="dhtml_MenuOpen(this,''#LIST_ITEM_ID#'',true,''Left'')"><span style="float:left;">#TEXT#</span><img class="t13MIMG" src="#IMAGE_PREFIX#menu_open_right2.gif" alt="" / ></a></li>';

wwv_flow_api.create_list_template (
  p_id=>6518221620583120 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Pull Down Menu',
  p_theme_id  => 1,
  p_theme_class_id => 20,
  p_list_template_before_rows=>'<ul class="dhtmlMenuLG2">',
  p_list_template_after_rows=>'</ul><br style="clear:both;"/><br style="clear:both;"/>',
  p_before_sub_list=>'<ul id="#PARENT_LIST_ITEM_ID#" htmldb:listlevel="#LEVEL#" class="dhtmlSubMenu2" style="display:none;">',
  p_after_sub_list=>'</ul>',
  p_sub_list_item_current=> t3,
  p_sub_list_item_noncurrent=> t4,
  p_item_templ_curr_w_child=> t5,
  p_item_templ_noncurr_w_child=> t6,
  p_sub_templ_curr_w_child=> t7,
  p_sub_templ_noncurr_w_child=> t8,
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/pull_down_menu_with_image
prompt  ......list template 6518310161583120
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<div class="dhtmlMenuItem"><a href="#LINK#"><img src="#IMAGE_PREFIX##IMAGE#" #IMAGE_ATTR# /></a><img src="#IMAGE_PREFIX#menu/drop_down_nochild.png" width="20" height="128" alt="" /><a href="#LINK#" class="dhtmlBottom">#TEXT#</a></div>';

t2:=t2||'<div class="dhtmlMenuItem"><a href="#LINK#"><img src="#IMAGE_PREFIX##IMAGE#" #IMAGE_ATTR# /></a><img src="#IMAGE_PREFIX#menu/drop_down_nochild.png" width="20" height="128" alt=""  /><a href="#LINK#" class="dhtmlBottom">#TEXT#</a></div>';

t3:=t3||'<li class="dhtmlMenuSep"><img src="#IMAGE_PREFIX#themes/theme_13/1px_trans.gif"  width="1" height="1" alt=""  class="dhtmlMenuSep" /></li>';

t4:=t4||'<li><a href="#LINK#" class="dhtmlSubMenuN" onmouseover="dhtml_CloseAllSubMenusL(this)">#TEXT#</a></li>';

t5:=t5||'<div class="dhtmlMenuItem"><a href="#LINK#"><img src="#IMAGE_PREFIX##IMAGE#" #IMAGE_ATTR# /></a><img src="#IMAGE_PREFIX#menu/drop_down.png" width="20" height="128" alt=""  class="dhtmlMenu" onclick="app_AppMenuMultiOpenBottom(this,''#LIST_ITEM_ID#'',false)" /><a href="#LINK#" class="dhtmlBottom">#TEXT#</a></div>';

t6:=t6||'<div class="dhtmlMenuItem"><a href="#LINK#"><img src="#IMAGE_PREFIX##IMAGE#" #IMAGE_ATTR# /></a><img src="#IMAGE_PREFIX#menu/drop_down.png" width="20" height="128" alt=""  class="dhtmlMenu" onclick="app_AppMenuMultiOpenBottom(this,''#LIST_ITEM_ID#'',false)" /><a href="#LINK#" class="dhtmlBottom">#TEXT#</a></div>';

t7:=t7||'<li class="dhtmlSubMenuS"><a href="#LINK#" class="dhtmlSubMenuS" onmouseover="dhtml_MenuOpen(this,''#LIST_ITEM_ID#'',true,''Left'')"><span style="float:left;">#TEXT#</span><img class="t13MIMG" src="#IMAGE_PREFIX#menu_open_right2.gif" /></a></li>';

t8:=t8||'<li class="dhtmlSubMenuS"><a href="#LINK#" class="dhtmlSubMenuS" onmouseover="dhtml_MenuOpen(this,''#LIST_ITEM_ID#'',true,''Left'')"><span style="float:left;">#TEXT#</span><img class="t13MIMG" src="#IMAGE_PREFIX#menu_open_right2.gif" /></a></li>';

wwv_flow_api.create_list_template (
  p_id=>6518310161583120 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Pull Down Menu with Image',
  p_theme_id  => 1,
  p_theme_class_id => 21,
  p_list_template_before_rows=>'<div class="dhtmlMenuLG">',
  p_list_template_after_rows=>'</div><br style="clear:both;"/><br style="clear:both;"/>',
  p_before_sub_list=>'<ul id="#PARENT_LIST_ITEM_ID#" htmldb:listlevel="#LEVEL#" class="dhtmlSubMenu2" style="display:none;"><li class="dhtmlSubMenuP" onmouseover="dhtml_CloseAllSubMenusL(this)">#PARENT_TEXT#</li>',
  p_after_sub_list=>'</ul>',
  p_sub_list_item_current=> t3,
  p_sub_list_item_noncurrent=> t4,
  p_item_templ_curr_w_child=> t5,
  p_item_templ_noncurr_w_child=> t6,
  p_sub_templ_curr_w_child=> t7,
  p_sub_templ_noncurr_w_child=> t8,
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/pull_down_menu_with_image_custom_1
prompt  ......list template 6518416021583120
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<div class="dhtmlMenuItem"><a href="#LINK#"><img src="#IMAGE_PREFIX#themes/generic_list.gif" #IMAGE_ATTR# /></a><img src="#IMAGE_PREFIX#themes/generic_nochild.gif" width="22" height="75" /><a href="#LINK#" class="dhtmlBottom">#TEXT#</a></div>';

t2:=t2||'<div class="dhtmlMenuItem"><a href="#LINK#"><img src="#IMAGE_PREFIX#themes/generic_list.gif" #IMAGE_ATTR# /></a><img src="#IMAGE_PREFIX#themes/generic_nochild.gif" width="22" height="75" /><a href="#LINK#" class="dhtmlBottom">#TEXT#</a></div>';

t3:=t3||'<li class="dhtmlMenuSep"><img src="#IMAGE_PREFIX#themes/theme_13/1px_trans.gif"  width="1" height="1" alt=""  class="dhtmlMenuSep" /></li>';

t4:=t4||'<li><a href="#LINK#" class="dhtmlSubMenuN" onmouseover="dhtml_CloseAllSubMenusL(this)">#TEXT#</a></li>';

t5:=t5||'<div class="dhtmlMenuItem"><a href="#LINK#"><img src="#IMAGE_PREFIX#themes/generic_list.gif" #IMAGE_ATTR# /></a><img src="#IMAGE_PREFIX#themes/generic_open.gif" width="22" height="75" class="dhtmlMenu" onclick="app_AppMenuMultiOpenBottom(this,''#LIST_ITEM_ID#'',false)" /><a href="#LINK#" class="dhtmlBottom">#TEXT#</a></div>';

t6:=t6||'<div class="dhtmlMenuItem"><a href="#LINK#"><img src="#IMAGE_PREFIX#themes/generic_list.gif" #IMAGE_ATTR# /></a><img src="#IMAGE_PREFIX#themes/generic_open.gif" width="22" height="75" class="dhtmlMenu" onclick="app_AppMenuMultiOpenBottom(this,''#LIST_ITEM_ID#'',false)" /><a href="#LINK#" class="dhtmlBottom">#TEXT#</a></div>';

t7:=t7||'<li class="dhtmlSubMenuS"><a href="#LINK#" class="dhtmlSubMenuS" onmouseover="dhtml_MenuOpen(this,''#LIST_ITEM_ID#'',true,''Left'')"><span style="float:left;">#TEXT#</span><img class="t13MIMG" src="#IMAGE_PREFIX#menu_open_right2.gif" /></a></li>';

t8:=t8||'<li class="dhtmlSubMenuS"><a href="#LINK#" class="dhtmlSubMenuS" onmouseover="dhtml_MenuOpen(this,''#LIST_ITEM_ID#'',true,''Left'')"><span style="float:left;">#TEXT#</span><img class="t13MIMG" src="#IMAGE_PREFIX#menu_open_right2.gif" /></a></li>';

wwv_flow_api.create_list_template (
  p_id=>6518416021583120 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Pull Down Menu with Image (Custom 1)',
  p_theme_id  => 1,
  p_theme_class_id => 9,
  p_list_template_before_rows=>'<div class="dhtmlMenuLG">',
  p_list_template_after_rows=>'</div><br style="clear:both;"/><br style="clear:both;"/>',
  p_before_sub_list=>'<ul id="#PARENT_LIST_ITEM_ID#" htmldb:listlevel="#LEVEL#" class="dhtmlSubMenu2" style="display:none;"><li class="dhtmlSubMenuP" onmouseover="dhtml_CloseAllSubMenusL(this)">#PARENT_TEXT#</li>',
  p_after_sub_list=>'</ul>',
  p_sub_list_item_current=> t3,
  p_sub_list_item_noncurrent=> t4,
  p_item_templ_curr_w_child=> t5,
  p_item_templ_noncurr_w_child=> t6,
  p_sub_templ_curr_w_child=> t7,
  p_sub_templ_noncurr_w_child=> t8,
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/tabbed_navigation_list
prompt  ......list template 6518525859583120
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<li><a class="t1current" href="#LINK#">#TEXT#</a></li>';

t2:=t2||'<li><a href="#LINK#">#TEXT#</a></li>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>6518525859583120 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Tabbed Navigation List',
  p_theme_id  => 1,
  p_theme_class_id => 7,
  p_list_template_before_rows=>'<ul class="t1TabbedNavigationList">',
  p_list_template_after_rows=>'</ul>',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/vertical_images_list
prompt  ......list template 6518619349583120
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<tr><td class="t1current"><img src="#IMAGE_PREFIX##IMAGE#" #IMAGE_ATTR# alt="" / >#TEXT#</td></tr>';

t2:=t2||'<tr><td><a href="#LINK#"><img src="#IMAGE_PREFIX##IMAGE#" #IMAGE_ATTR# alt="" / >#TEXT#</a></td></tr>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>6518619349583120 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Vertical Images List',
  p_theme_id  => 1,
  p_theme_class_id => 5,
  p_list_template_before_rows=>'<table cellpadding="0" cellspacing="0" border="0" summary="0" class="t1VerticalImagesList">',
  p_list_template_after_rows=>'</table>',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/vertical_images_list_custom_2
prompt  ......list template 6518729874583120
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<tr><td align="left"><img src="#IMAGE_PREFIX##IMAGE#" #IMAGE_ATTR# /></td><td align="left"><a href="#LINK#">#TEXT#</a></td></tr>'||chr(10)||
'';

t2:=t2||'<tr><td align="left"><img src="#IMAGE_PREFIX##IMAGE#" #IMAGE_ATTR# /></td><td align="left"><a href="#LINK#">#TEXT#</a></td></tr>'||chr(10)||
'';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>6518729874583120 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Vertical Images List (Custom 2)',
  p_theme_id  => 1,
  p_theme_class_id => 10,
  p_list_template_before_rows=>'<table border="0" cellpadding="0" cellspacing="5" summary="" >',
  p_list_template_after_rows=>'</table>'||chr(10)||
'',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/vertical_ordered_list
prompt  ......list template 6518800810583120
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<li class="t1current">#TEXT#</li>';

t2:=t2||'<li><a href="#LINK#">#TEXT#</a></li>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>6518800810583120 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Vertical Ordered List',
  p_theme_id  => 1,
  p_theme_class_id => 2,
  p_list_template_before_rows=>'<ol class="t1VerticalOrderedList">',
  p_list_template_after_rows=>'</ol>',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/vertical_sidebar_list
prompt  ......list template 6518905634583121
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<a href="#LINK#" class="t1navcurrent">#TEXT#</a>';

t2:=t2||'<a href="#LINK#" class="t1nav">#TEXT#</a>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>6518905634583121 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Vertical Sidebar List',
  p_theme_id  => 1,
  p_theme_class_id => 19,
  p_list_template_before_rows=>'<div class="t1VerticalSidebarList">',
  p_list_template_after_rows=>'</div>',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/vertical_unordered_list_with_bullets
prompt  ......list template 6519007221583121
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<li class="t1current">#TEXT#</li>';

t2:=t2||'<li><a href="#LINK#">#TEXT#</a></li>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>6519007221583121 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Vertical Unordered List with Bullets',
  p_theme_id  => 1,
  p_theme_class_id => 1,
  p_list_template_before_rows=>'<ul class="t1VerticalUnorderedListwithBullets">',
  p_list_template_after_rows=>'</ul>',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/vertical_unordered_list_without_bullet
prompt  ......list template 6519110767583121
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<li class="t1current">#TEXT#</li>';

t2:=t2||'<li><a href="#LINK#">#TEXT#</a></li>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>6519110767583121 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Vertical Unordered List without Bullet',
  p_theme_id  => 1,
  p_theme_class_id => 18,
  p_list_template_before_rows=>'<ul class="t1VerticalUnorderedListwithoutBullet">',
  p_list_template_after_rows=>'</ul>',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/wizard_progress_list
prompt  ......list template 6519231648583121
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<tr><td><div class="t1current">#TEXT#</div><img src="#IMAGE_PREFIX#themes/theme_1/arrow_down.gif" alt="Down" /></td></tr>';

t2:=t2||'<tr><td><div>#TEXT#</div><img src="#IMAGE_PREFIX#themes/theme_1/arrow_down.gif" alt="Down" /></td></tr>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>6519231648583121 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Wizard Progress List',
  p_theme_id  => 1,
  p_theme_class_id => 17,
  p_list_template_before_rows=>'<table cellpadding="0" border="0" cellspacing="0" summary="" class="t1WizardProgressList">',
  p_list_template_after_rows=>'<tr><td>&DONE.</td></tr>'||chr(10)||
'</table>',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/button_list
prompt  ......list template 9024107177033205
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<a href="#LINK#" class="t6Button">#TEXT#</a>';

t2:=t2||'<a href="#LINK#" class="t6Button">#TEXT#</a>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>9024107177033205 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Button List',
  p_theme_id  => 101,
  p_theme_class_id => 6,
  p_list_template_before_rows=>'<div class="t6ButtonList">',
  p_list_template_after_rows=>'</div><br />',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/dhtml_menu_with_sublist
prompt  ......list template 9024412173033207
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<li class="dhtmlMenuItem"><a href="#LINK#">#TEXT#</a></li>';

t2:=t2||'<li class="dhtmlMenuItem"><a href="#LINK#">#TEXT#</a></li>';

t3:=t3||'<li class="dhtmlMenuSep2"><img src="#IMAGE_PREFIX#themes/theme_13/1px_trans.gif"  width="1" height="1" alt="" class="dhtmlMenuSep2" /></li>';

t4:=t4||'<li><a href="#LINK#" class="dhtmlSubMenuN" onmouseover="dhtml_CloseAllSubMenusL(this)">#TEXT#</a></li>';

t5:=t5||'<li class="dhtmlMenuItem1"><a href="#LINK#">#TEXT#</a><img src="#IMAGE_PREFIX#themes/theme_13/menu_small.gif" alt="Expand" onclick="app_AppMenuMultiOpenBottom2(this,''#LIST_ITEM_ID#'',false)" /></li>';

t6:=t6||'<li class="dhtmlMenuItem1"><a href="#LINK#">#TEXT#</a><img src="#IMAGE_PREFIX#themes/theme_13/menu_small.gif" alt="Expand" onclick="app_AppMenuMultiOpenBottom2(this,''#LIST_ITEM_ID#'',false)" /></li>';

t7:=t7||'<li class="dhtmlSubMenuS"><a href="#LINK#" class="dhtmlSubMenuS" onmouseover="dhtml_MenuOpen(this,''#LIST_ITEM_ID#'',true,''Left'')"><span style="float:left;">#TEXT#</span><img class="t13MIMG" src="#IMAGE_PREFIX#menu_open_right2.gif" alt="" /></a></li>';

t8:=t8||'<li class="dhtmlSubMenuS"><a href="#LINK#" class="dhtmlSubMenuS" onmouseover="dhtml_MenuOpen(this,''#LIST_ITEM_ID#'',true,''Left'')"><span style="float:left;">#TEXT#</span><img class="t13MIMG" src="#IMAGE_PREFIX#menu_open_right2.gif" alt="" /></a></li>';

wwv_flow_api.create_list_template (
  p_id=>9024412173033207 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'DHTML Menu with Sublist',
  p_theme_id  => 101,
  p_theme_class_id => 20,
  p_list_template_before_rows=>'<ul class="dhtmlMenuLG2">',
  p_list_template_after_rows=>'</ul><br style="clear:both;"/><br style="clear:both;"/>',
  p_before_sub_list=>'<ul id="#PARENT_LIST_ITEM_ID#" htmldb:listlevel="#LEVEL#" class="dhtmlSubMenu2" style="display:none;">',
  p_after_sub_list=>'</ul>',
  p_sub_list_item_current=> t3,
  p_sub_list_item_noncurrent=> t4,
  p_item_templ_curr_w_child=> t5,
  p_item_templ_noncurr_w_child=> t6,
  p_sub_templ_curr_w_child=> t7,
  p_sub_templ_noncurr_w_child=> t8,
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/dhtml_tree
prompt  ......list template 9024732136033207
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<li><img src="#IMAGE_PREFIX#themes/theme_13/node.gif" align="middle" alt="" /><a href="#LINK#">#TEXT#</a></li>';

t2:=t2||'<li><img src="#IMAGE_PREFIX#themes/theme_13/node.gif" align="middle"  alt="" /><a href="#LINK#">#TEXT#</a></li>';

t3:=t3||'<li><img src="#IMAGE_PREFIX#themes/theme_13/node.gif" align="middle"  alt="" /><a href="#LINK#">#TEXT#</a></li>';

t4:=t4||'<li><img src="#IMAGE_PREFIX#themes/theme_13/node.gif"  align="middle" alt="" /><a href="#LINK#">#TEXT#</a></li>';

t5:=t5||'<li><img src="#IMAGE_PREFIX#themes/theme_13/plus.gif" align="middle"  onclick="htmldb_ToggleWithImage(this,''#LIST_ITEM_ID#'')" class="pseudoButtonInactive" alt="" /><a href="#LINK#">#TEXT#</a></li>';

t6:=t6||'<li><img src="#IMAGE_PREFIX#themes/theme_13/plus.gif" align="middle"  onclick="htmldb_ToggleWithImage(this,''#LIST_ITEM_ID#'')" class="pseudoButtonInactive" alt="" /><a href="#LINK#">#TEXT#</a></li>';

t7:=t7||'<li><img src="#IMAGE_PREFIX#themes/theme_13/plus.gif" onclick="htmldb_ToggleWithImage(this,''#LIST_ITEM_ID#'')" align="middle" class="pseudoButtonInactive" alt="" /><a href="#LINK#">#TEXT#</a></li>';

t8:=t8||'<li><img src="#IMAGE_PREFIX#themes/theme_13/plus.gif" onclick="htmldb_ToggleWithImage(this,''#LIST_ITEM_ID#'')" align="middle" class="pseudoButtonInactive" alt="" /><a href="#LINK#">#TEXT#</a></li>';

wwv_flow_api.create_list_template (
  p_id=>9024732136033207 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'DHTML Tree',
  p_theme_id  => 101,
  p_theme_class_id => 22,
  p_list_template_before_rows=>'<ul class="dhtmlTree">',
  p_list_template_after_rows=>'</ul><br style="clear:both;"/><br style="clear:both;"/>',
  p_before_sub_list=>'<ul id="#PARENT_LIST_ITEM_ID#" htmldb:listlevel="#LEVEL#" style="display:none;" class="dhtmlTree">',
  p_after_sub_list=>'</ul>',
  p_sub_list_item_current=> t3,
  p_sub_list_item_noncurrent=> t4,
  p_item_templ_curr_w_child=> t5,
  p_item_templ_noncurr_w_child=> t6,
  p_sub_templ_curr_w_child=> t7,
  p_sub_templ_noncurr_w_child=> t8,
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/horizontal_images_with_label_list
prompt  ......list template 9025029724033208
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<td class="t6current"><a href="#LINK#"><img src="#IMAGE_PREFIX##IMAGE#" border="0" #IMAGE_ATTR#/></a><br /><a href="#LINK#">#TEXT#</a></td>';

t2:=t2||'<td class="t6noncurrent"><a href="#LINK#"><img src="#IMAGE_PREFIX##IMAGE#" border="0" #IMAGE_ATTR#/></a><br /><a href="#LINK#">#TEXT#</a></td>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>9025029724033208 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Horizontal Images with Label List',
  p_theme_id  => 101,
  p_theme_class_id => 4,
  p_list_template_before_rows=>'<table class="t6HorozontalImagesWithLabelList" summary=""><tr>',
  p_list_template_after_rows=>'</tr></table>',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/horizontal_links_list
prompt  ......list template 9025331021033209
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<td class="t6current"><a href="#LINK#" class="t6current">#TEXT#</a></td>';

t2:=t2||'<td class="t6noncurrent"><a href="#LINK#">#TEXT#</a></td>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>9025331021033209 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Horizontal Links List',
  p_theme_id  => 101,
  p_theme_class_id => 3,
  p_list_template_before_rows=>'<table class="t6HorizontalLinksList" summary=""><tr>',
  p_list_template_after_rows=>'</tr></table>',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/pull_down_menu_with_image
prompt  ......list template 9025610730033209
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<div class="dhtmlMenuItem"><a href="#LINK#"><img src="#IMAGE_PREFIX#menu/brush_bx_128x128.png" #IMAGE_ATTR# /></a><img src="#IMAGE_PREFIX#menu/drop_down_nochild.png" width="20" height="128" alt="" /><a href="#LINK#" class="dhtmlBottom">#TEXT#</a></div>';

t2:=t2||'<div class="dhtmlMenuItem"><a href="#LINK#"><img src="#IMAGE_PREFIX#menu/brush_bx_128x128.png" #IMAGE_ATTR# /></a><img src="#IMAGE_PREFIX#menu/drop_down_nochild.png" width="20" height="128" alt=""  /><a href="#LINK#" class="dhtmlBottom">#TEXT#</a></div>';

t3:=t3||'<li class="dhtmlMenuSep"><img src="#IMAGE_PREFIX#themes/theme_13/1px_trans.gif"  width="1" height="1" alt=""  class="dhtmlMenuSep" /></li>';

t4:=t4||'<li><a href="#LINK#" class="dhtmlSubMenuN" onmouseover="dhtml_CloseAllSubMenusL(this)">#TEXT#</a></li>';

t5:=t5||'<div class="dhtmlMenuItem"><a href="#LINK#"><img src="#IMAGE_PREFIX#menu/brush_bx_128x128.png" #IMAGE_ATTR# /></a><img src="#IMAGE_PREFIX#menu/drop_down.png" width="20" height="128" alt=""  class="dhtmlMenu" onclick="app_AppMenuMultiOpenBottom(this,''#LIST_ITEM_ID#'',false)" /><a href="#LINK#" class="dhtmlBottom">#TEXT#</a></div>';

t6:=t6||'<div class="dhtmlMenuItem"><a href="#LINK#"><img src="#IMAGE_PREFIX#menu/brush_bx_128x128.png" #IMAGE_ATTR# /></a><img src="#IMAGE_PREFIX#menu/drop_down.png" width="20" height="128" alt=""  class="dhtmlMenu" onclick="app_AppMenuMultiOpenBottom(this,''#LIST_ITEM_ID#'',false)" /><a href="#LINK#" class="dhtmlBottom">#TEXT#</a></div>';

t7:=t7||'<li class="dhtmlSubMenuS"><a href="#LINK#" class="dhtmlSubMenuS" onmouseover="dhtml_MenuOpen(this,''#LIST_ITEM_ID#'',true,''Left'')"><span style="float:left;">#TEXT#</span><img class="t13MIMG" src="#IMAGE_PREFIX#menu_open_right2.gif" /></a></li>';

t8:=t8||'<li class="dhtmlSubMenuS"><a href="#LINK#" class="dhtmlSubMenuS" onmouseover="dhtml_MenuOpen(this,''#LIST_ITEM_ID#'',true,''Left'')"><span style="float:left;">#TEXT#</span><img class="t13MIMG" src="#IMAGE_PREFIX#menu_open_right2.gif" /></a></li>';

wwv_flow_api.create_list_template (
  p_id=>9025610730033209 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Pull Down Menu with Image',
  p_theme_id  => 101,
  p_theme_class_id => 21,
  p_list_template_before_rows=>'<div class="dhtmlMenuLG">',
  p_list_template_after_rows=>'</div><br style="clear:both;"/><br style="clear:both;"/>',
  p_before_sub_list=>'<ul id="#PARENT_LIST_ITEM_ID#" htmldb:listlevel="#LEVEL#" class="dhtmlSubMenu2" style="display:none;"><li class="dhtmlSubMenuP" onmouseover="dhtml_CloseAllSubMenusL(this)">#PARENT_TEXT#</li>',
  p_after_sub_list=>'</ul>',
  p_sub_list_item_current=> t3,
  p_sub_list_item_noncurrent=> t4,
  p_item_templ_curr_w_child=> t5,
  p_item_templ_noncurr_w_child=> t6,
  p_sub_templ_curr_w_child=> t7,
  p_sub_templ_noncurr_w_child=> t8,
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/pull_down_menu_with_image_custom_1
prompt  ......list template 9025925608033212
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<div class="dhtmlMenuItem"><a href="#LINK#"><img src="#IMAGE_PREFIX#themes/generic_list.gif" #IMAGE_ATTR# /></a><img src="#IMAGE_PREFIX#themes/generic_nochild.gif" width="22" height="75" alt="" /><a href="#LINK#" class="dhtmlBottom">#TEXT#</a></div>';

t2:=t2||'<div class="dhtmlMenuItem"><a href="#LINK#"><img src="#IMAGE_PREFIX#themes/generic_list.gif" #IMAGE_ATTR# /></a><img src="#IMAGE_PREFIX#themes/generic_nochild.gif" width="22" height="75" alt="" /><a href="#LINK#" class="dhtmlBottom">#TEXT#</a></div>';

t3:=t3||'<li class="dhtmlMenuSep"><img src="#IMAGE_PREFIX#themes/theme_13/1px_trans.gif"  width="1" height="1" alt=""  class="dhtmlMenuSep" /></li>';

t4:=t4||'<li><a href="#LINK#" class="dhtmlSubMenuN" onmouseover="dhtml_CloseAllSubMenusL(this)">#TEXT#</a></li>';

t5:=t5||'<div class="dhtmlMenuItem"><a href="#LINK#"><img src="#IMAGE_PREFIX#themes/generic_list.gif" #IMAGE_ATTR# /></a><img src="#IMAGE_PREFIX#themes/generic_open.gif" width="22" height="75" class="dhtmlMenu" onclick="app_AppMenuMultiOpenBottom(this,''#LIST_ITEM_ID#'',false)" alt="" /><a href="#LINK#" class="dhtmlBottom">#TEXT#</a></div>';

t6:=t6||'<div class="dhtmlMenuItem"><a href="#LINK#"><img src="#IMAGE_PREFIX#themes/generic_list.gif" #IMAGE_ATTR# /></a><img src="#IMAGE_PREFIX#themes/generic_open.gif" width="22" height="75" class="dhtmlMenu" onclick="app_AppMenuMultiOpenBottom(this,''#LIST_ITEM_ID#'',false)" alt="" /><a href="#LINK#" class="dhtmlBottom">#TEXT#</a></div>';

t7:=t7||'<li class="dhtmlSubMenuS"><a href="#LINK#" class="dhtmlSubMenuS" onmouseover="dhtml_MenuOpen(this,''#LIST_ITEM_ID#'',true,''Left'')"><span style="float:left;">#TEXT#</span><img class="t13MIMG" src="#IMAGE_PREFIX#menu_open_right2.gif" alt="" /></a></li>';

t8:=t8||'<li class="dhtmlSubMenuS"><a href="#LINK#" class="dhtmlSubMenuS" onmouseover="dhtml_MenuOpen(this,''#LIST_ITEM_ID#'',true,''Left'')"><span style="float:left;">#TEXT#</span><img class="t13MIMG" src="#IMAGE_PREFIX#menu_open_right2.gif" alt="" /></a></li>';

wwv_flow_api.create_list_template (
  p_id=>9025925608033212 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Pull Down Menu with Image (Custom 1)',
  p_theme_id  => 101,
  p_theme_class_id => 9,
  p_list_template_before_rows=>'<div class="dhtmlMenuLG">',
  p_list_template_after_rows=>'</div><br style="clear:both;"/><br style="clear:both;"/>',
  p_before_sub_list=>'<ul id="#PARENT_LIST_ITEM_ID#" htmldb:listlevel="#LEVEL#" class="dhtmlSubMenu2" style="display:none;"><li class="dhtmlSubMenuP" onmouseover="dhtml_CloseAllSubMenusL(this)">#PARENT_TEXT#</li>',
  p_after_sub_list=>'</ul>',
  p_sub_list_item_current=> t3,
  p_sub_list_item_noncurrent=> t4,
  p_item_templ_curr_w_child=> t5,
  p_item_templ_noncurr_w_child=> t6,
  p_sub_templ_curr_w_child=> t7,
  p_sub_templ_noncurr_w_child=> t8,
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/tabbed_navigation_list
prompt  ......list template 9026210699033215
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<td><img src="#IMAGE_PREFIX#themes/theme_6/ListTabCurrentLeft.gif" alt="LeftCurrentTab"></td>'||chr(10)||
'<td style="background-image: url(#IMAGE_PREFIX#themes/theme_6/ListTabCurrentBackground.gif); background-repeat:repeat;"><a class="t6current" href="#LINK#">#TEXT#</a></td>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_6/ListTabCurrentRight.gif" alt="RightCurrentTab"></td>';

t2:=t2||'<td><img src="#IMAGE_PREFIX#themes/theme_6/ListTabNonCurrentLeft.gif" alt="LeftNonCurrentTab"></td>'||chr(10)||
'<td style="background-image: url(#IMAGE_PREFIX#themes/theme_6/ListTabNonCurrentBackground.gif); background-repeat:repeat;"><a class="t6noncurrent" href="#LINK#">#TEXT#</a></td>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_6/ListTabNonCurrentRight.gif" alt="RightNonCurrentTab"></td>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>9026210699033215 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Tabbed Navigation List',
  p_theme_id  => 101,
  p_theme_class_id => 7,
  p_list_template_before_rows=>'<table class="t6TabbedNavigationList" cellspacing="0" cellpadding="0" summary=""><tr>',
  p_list_template_after_rows=>'</tr></table>',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/tree_list
prompt  ......list template 9026508494033215
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<li><a href="#LINK#">#TEXT#</a></li>';

t2:=t2||'<li><a href="#LINK#">#TEXT#</a></li>';

t3:=t3||'<li><a href="#LINK#">#TEXT#</a></li>';

t4:=t4||'<li><a href="#LINK#">#TEXT#</a></li>';

t5:=t5||'<li><a href="#LINK#">#TEXT#</a></li>';

t6:=t6||'<li><a href="#LINK#">#TEXT#</a></li>';

t7:=t7||'<li><a href="#LINK#">#TEXT#</a></li>';

t8:=t8||'<li><a href="#LINK#">#TEXT#</a></li>';

wwv_flow_api.create_list_template (
  p_id=>9026508494033215 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Tree List',
  p_theme_id  => 101,
  p_theme_class_id => 23,
  p_list_template_before_rows=>'<ul class="htmlTree">',
  p_list_template_after_rows=>'</ul><br style="clear:both;"/><br style="clear:both;"/>',
  p_before_sub_list=>'<ul id="#PARENT_LIST_ITEM_ID#" htmldb:listlevel="#LEVEL#">',
  p_after_sub_list=>'</ul>',
  p_sub_list_item_current=> t3,
  p_sub_list_item_noncurrent=> t4,
  p_item_templ_curr_w_child=> t5,
  p_item_templ_noncurr_w_child=> t6,
  p_sub_templ_curr_w_child=> t7,
  p_sub_templ_noncurr_w_child=> t8,
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/vertical_images_list
prompt  ......list template 9026830078033219
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<tr><td align="center" class="t6current"><a href="#LINK#"><img src="#IMAGE_PREFIX##IMAGE#" #IMAGE_ATTR# /></a></td></tr>';

t2:=t2||'<tr><td align="center"><a href="#LINK#"><img src="#IMAGE_PREFIX##IMAGE#" #IMAGE_ATTR# /></a></td></tr>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>9026830078033219 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Vertical Images List',
  p_theme_id  => 101,
  p_theme_class_id => 5,
  p_list_template_before_rows=>'<table class="t6VerticalImagesList" summary="">',
  p_list_template_after_rows=>'</table>',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/vertical_images_list_custom_2
prompt  ......list template 9027110498033219
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<tr><td align="left"><img src="#IMAGE_PREFIX##IMAGE#" #IMAGE_ATTR# /></td><td align="left"><a href="#LINK#">#TEXT#</a></td></tr>'||chr(10)||
'';

t2:=t2||'<tr><td align="left"><img src="#IMAGE_PREFIX##IMAGE#" #IMAGE_ATTR# /></td><td align="left"><a href="#LINK#">#TEXT#</a></td></tr>'||chr(10)||
'';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>9027110498033219 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Vertical Images List (Custom 2)',
  p_theme_id  => 101,
  p_theme_class_id => 10,
  p_list_template_before_rows=>'<table border="0" cellpadding="0" cellspacing="5" summary="" >',
  p_list_template_after_rows=>'</table>'||chr(10)||
'',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/vertical_ordered_list
prompt  ......list template 9027429988033219
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<li><a class="t6current" href="#LINK#">#TEXT#</a></li>';

t2:=t2||'<li><a href="#LINK#">#TEXT#</a></li>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>9027429988033219 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Vertical Ordered List',
  p_theme_id  => 101,
  p_theme_class_id => 2,
  p_list_template_before_rows=>'<ol class="t6VerticalOrderedList">',
  p_list_template_after_rows=>'</ol>',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/vertical_sidebar_list
prompt  ......list template 9027715983033220
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<tr><td><a class="t6current" href="#LINK#">#TEXT#</a></td></tr>';

t2:=t2||'<tr><td><a href="#LINK#">#TEXT#</a></td></tr>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>9027715983033220 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Vertical Sidebar List',
  p_theme_id  => 101,
  p_theme_class_id => 19,
  p_list_template_before_rows=>'<table class="t6VerticalSidebarList" cellpadding="0" cellspacing="0" width="100%" summary="">',
  p_list_template_after_rows=>'</table>',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/vertical_unordered_list_with_bullets
prompt  ......list template 9028005977033220
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<li><a class="t6current" href="#LINK#">#TEXT#</a></li>';

t2:=t2||'<li><a class="t6noncurrent" href="#LINK#">#TEXT#</a></li>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>9028005977033220 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Vertical Unordered List with Bullets',
  p_theme_id  => 101,
  p_theme_class_id => 1,
  p_list_template_before_rows=>'<ul class="t6VerticalUnorderedListWithBullets">',
  p_list_template_after_rows=>'</ul>',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/vertical_unordered_list_without_bullets
prompt  ......list template 9028300345033220
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<tr><td><a class="t6current" href="#LINK#">#TEXT#</a></td></tr>';

t2:=t2||'<tr><td><a href="#LINK#">#TEXT#</a></td></tr>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>9028300345033220 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Vertical Unordered List without Bullets',
  p_theme_id  => 101,
  p_theme_class_id => 18,
  p_list_template_before_rows=>'<table class="t6VerticalUnorderedListWithoutBullets" summary="">',
  p_list_template_after_rows=>'</table>',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/wizard_progress_list
prompt  ......list template 9028610850033220
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<img src="#IMAGE_PREFIX#themes/theme_6/WizardDownArrow.gif" width="7" height="12" alt="Down" /><br />'||chr(10)||
'<div class="current">#TEXT#</div>';

t2:=t2||'<img src="#IMAGE_PREFIX#themes/theme_6/WizardDownArrow.gif" width="7" height="12" alt="Down" /><br />'||chr(10)||
'<div class="noncurrent">#TEXT#</div>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>9028610850033220 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Wizard Progress List',
  p_theme_id  => 101,
  p_theme_class_id => 17,
  p_list_template_before_rows=>'<div class="t6WizardProgressList">'||chr(10)||
'<div class="noncurrent">Start</div>',
  p_list_template_after_rows=>'<div>&DONE.</div>'||chr(10)||
'</div>',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

prompt  ...report templates
--
--application/shared_components/user_interface/templates/report/borderless
prompt  ......report template 6519302771583121
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  c4 varchar2(32767) := null;
begin
c1:=c1||'<td#ALIGNMENT# headers="#COLUMN_HEADER_NAME#" class="t1data">#COLUMN_VALUE#</td>';

c2 := null;
c3 := null;
c4 := null;
wwv_flow_api.create_row_template (
  p_id=> 6519302771583121 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_row_template_name=> 'Borderless',
  p_row_template1=> c1,
  p_row_template_condition1=> '',
  p_row_template2=> c2,
  p_row_template_condition2=> '',
  p_row_template3=> c3,
  p_row_template_condition3=> '',
  p_row_template4=> c4,
  p_row_template_condition4=> '',
  p_row_template_before_rows=>'<table cellpadding="0" border="0" cellspacing="0" summary="" #REPORT_ATTRIBUTES# id="report_#REGION_STATIC_ID#">#TOP_PAGINATION#<tr>'||chr(10)||
'<td><table class="t1borderless" cellpadding="0" border="0" cellspacing="0" summary="">',
  p_row_template_after_rows =>'</table><div class="t1CVS">#EXTERNAL_LINK##CSV_LINK#</div></td>'||chr(10)||
'</tr>'||chr(10)||
'#PAGINATION#'||chr(10)||
'</table>',
  p_row_template_table_attr =>'',
  p_row_template_type =>'GENERIC_COLUMNS',
  p_column_heading_template=>'<th class="t1header"#ALIGNMENT# id="#COLUMN_HEADER_NAME#">#COLUMN_HEADER#</th>',
  p_row_template_display_cond1=>'0',
  p_row_template_display_cond2=>'0',
  p_row_template_display_cond3=>'0',
  p_row_template_display_cond4=>'0',
  p_next_page_template=>'<a href="#LINK#" class="t1pagination">#PAGINATION_NEXT#<img src="#IMAGE_PREFIX#themes/theme_1/paginate_next.gif" alt="Next"></a>',
  p_previous_page_template=>'<a href="#LINK#" class="t1pagination"><img src="#IMAGE_PREFIX#themes/theme_1/paginate_prev.gif" alt="Previous">#PAGINATION_PREVIOUS#</a>',
  p_next_set_template=>'<a href="#LINK#" class="t1pagination">#PAGINATION_NEXT_SET#<img src="#IMAGE_PREFIX#themes/theme_1/paginate_next.gif" alt="Next"></a>',
  p_previous_set_template=>'<a href="#LINK#" class="t1pagination"><img src="#IMAGE_PREFIX#themes/theme_1/paginate_prev.gif" alt="Previous">#PAGINATION_PREVIOUS_SET#</a>',
  p_row_style_checked=>'#ccc',
  p_theme_id  => 1,
  p_theme_class_id => 1,
  p_translate_this_template => 'N',
  p_row_template_comment=> '');
end;
null;
 
end;
/

 
begin
 
begin
wwv_flow_api.create_row_template_patch (
  p_id => 6519302771583121 + wwv_flow_api.g_id_offset,
  p_row_template_before_first =>'<tr #HIGHLIGHT_ROW#>',
  p_row_template_after_last =>'</tr>');
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/report/horizontal_border
prompt  ......report template 6519432590583133
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  c4 varchar2(32767) := null;
begin
c1:=c1||'<td#ALIGNMENT# headers="#COLUMN_HEADER_NAME#" class="t1data">#COLUMN_VALUE#</td>';

c2 := null;
c3 := null;
c4 := null;
wwv_flow_api.create_row_template (
  p_id=> 6519432590583133 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_row_template_name=> 'Horizontal Border',
  p_row_template1=> c1,
  p_row_template_condition1=> '',
  p_row_template2=> c2,
  p_row_template_condition2=> '',
  p_row_template3=> c3,
  p_row_template_condition3=> '',
  p_row_template4=> c4,
  p_row_template_condition4=> '',
  p_row_template_before_rows=>'<table cellpadding="0" border="0" cellspacing="0" summary="" #REPORT_ATTRIBUTES# id="report_#REGION_STATIC_ID#">#TOP_PAGINATION#'||chr(10)||
'<tr>'||chr(10)||
'<td><table cellpadding="0" cellspacing="0" border="0" class="t1HorizontalBorder" summary="">',
  p_row_template_after_rows =>'</table><div class="t1CVS">#EXTERNAL_LINK##CSV_LINK#</div></td>'||chr(10)||
'</tr>'||chr(10)||
'#PAGINATION#'||chr(10)||
'</table>',
  p_row_template_table_attr =>'',
  p_row_template_type =>'GENERIC_COLUMNS',
  p_column_heading_template=>'<th#ALIGNMENT# id="#COLUMN_HEADER_NAME#" class="t1header">#COLUMN_HEADER#</th>',
  p_row_template_display_cond1=>'0',
  p_row_template_display_cond2=>'0',
  p_row_template_display_cond3=>'0',
  p_row_template_display_cond4=>'0',
  p_next_page_template=>'<a href="#LINK#" class="t1pagination">#PAGINATION_NEXT#<img src="#IMAGE_PREFIX#themes/theme_1/paginate_next.gif" alt="Next"></a>'||chr(10)||
'',
  p_previous_page_template=>'<a href="#LINK#" class="t1pagination"><img src="#IMAGE_PREFIX#themes/theme_1/paginate_prev.gif" alt="Previous">#PAGINATION_PREVIOUS#</a>',
  p_next_set_template=>'<a href="#LINK#" class="t1pagination">#PAGINATION_NEXT_SET#<img src="#IMAGE_PREFIX#themes/theme_1/paginate_next.gif" alt="Next"></a>',
  p_previous_set_template=>'<a href="#LINK#" class="t1pagination"><img src="#IMAGE_PREFIX#themes/theme_1/paginate_prev.gif" alt="Previous">#PAGINATION_PREVIOUS_SET#</a>',
  p_row_style_checked=>'#ccc',
  p_theme_id  => 1,
  p_theme_class_id => 2,
  p_translate_this_template => 'N',
  p_row_template_comment=> '');
end;
null;
 
end;
/

 
begin
 
begin
wwv_flow_api.create_row_template_patch (
  p_id => 6519432590583133 + wwv_flow_api.g_id_offset,
  p_row_template_before_first =>'<tr #HIGHLIGHT_ROW#>',
  p_row_template_after_last =>'</tr>');
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/report/one_column_unordered_list
prompt  ......report template 6519520395583133
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  c4 varchar2(32767) := null;
begin
c1:=c1||'<li>#COLUMN_VALUE#</li>';

c2 := null;
c3 := null;
c4 := null;
wwv_flow_api.create_row_template (
  p_id=> 6519520395583133 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_row_template_name=> 'One Column Unordered List',
  p_row_template1=> c1,
  p_row_template_condition1=> '',
  p_row_template2=> c2,
  p_row_template_condition2=> '',
  p_row_template3=> c3,
  p_row_template_condition3=> '',
  p_row_template4=> c4,
  p_row_template_condition4=> '',
  p_row_template_before_rows=>'<table cellpadding="0" cellspacing="0" summary="" #REPORT_ATTRIBUTES# id="report_#REGION_STATIC_ID#">'||chr(10)||
'#TOP_PAGINATION#'||chr(10)||
'<tr><td><ul class="t1OneColumnUnorderedList">',
  p_row_template_after_rows =>'</ul><div class="t1CVS">#EXTERNAL_LINK##CSV_LINK#</div></td></tr>'||chr(10)||
'#PAGINATION#'||chr(10)||
'</table>',
  p_row_template_table_attr =>'OMIT',
  p_row_template_type =>'GENERIC_COLUMNS',
  p_column_heading_template=>'',
  p_row_template_display_cond1=>'NOT_CONDITIONAL',
  p_row_template_display_cond2=>'NOT_CONDITIONAL',
  p_row_template_display_cond3=>'NOT_CONDITIONAL',
  p_row_template_display_cond4=>'NOT_CONDITIONAL',
  p_next_page_template=>'<a href="#LINK#" class="t1pagination">#PAGINATION_NEXT#<img src="#IMAGE_PREFIX#themes/theme_1/paginate_next.gif" alt="Next"></a>',
  p_previous_page_template=>'<a href="#LINK#" class="t1pagination"><img src="#IMAGE_PREFIX#themes/theme_1/paginate_prev.gif" alt="Previous">#PAGINATION_PREVIOUS#</a>',
  p_next_set_template=>'<a href="#LINK#" class="t1pagination">#PAGINATION_NEXT_SET#<img src="#IMAGE_PREFIX#themes/theme_1/paginate_next.gif" alt="Next"></a>',
  p_previous_set_template=>'<a href="#LINK#" class="t1pagination"><img src="#IMAGE_PREFIX#themes/theme_1/paginate_prev.gif" alt="Previous">#PAGINATION_PREVIOUS_SET#</a>',
  p_theme_id  => 1,
  p_theme_class_id => 3,
  p_translate_this_template => 'N',
  p_row_template_comment=> '');
end;
null;
 
end;
/

 
begin
 
begin
wwv_flow_api.create_row_template_patch (
  p_id => 6519520395583133 + wwv_flow_api.g_id_offset,
  p_row_template_before_first =>'OMIT',
  p_row_template_after_last =>'OMIT');
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/report/standard
prompt  ......report template 6519631646583133
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  c4 varchar2(32767) := null;
begin
c1:=c1||'<td#ALIGNMENT# headers="#COLUMN_HEADER_NAME#" class="t1data">#COLUMN_VALUE#</td>';

c2 := null;
c3 := null;
c4 := null;
wwv_flow_api.create_row_template (
  p_id=> 6519631646583133 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_row_template_name=> 'Standard',
  p_row_template1=> c1,
  p_row_template_condition1=> '',
  p_row_template2=> c2,
  p_row_template_condition2=> '',
  p_row_template3=> c3,
  p_row_template_condition3=> '',
  p_row_template4=> c4,
  p_row_template_condition4=> '',
  p_row_template_before_rows=>'<table cellpadding="0" border="0" cellspacing="0" summary="" #REPORT_ATTRIBUTES# id="report_#REGION_STATIC_ID#">#TOP_PAGINATION#'||chr(10)||
'<tr>'||chr(10)||
'<td><table cellpadding="0" border="0" cellspacing="0" summary="" class="t1standard">',
  p_row_template_after_rows =>'</table><div class="t1CVS">#EXTERNAL_LINK##CSV_LINK#</div></td>'||chr(10)||
'</tr>'||chr(10)||
'#PAGINATION#'||chr(10)||
'</table>',
  p_row_template_table_attr =>'',
  p_row_template_type =>'GENERIC_COLUMNS',
  p_column_heading_template=>'<th#ALIGNMENT# id="#COLUMN_HEADER_NAME#" class="t1header">#COLUMN_HEADER#</th>',
  p_row_template_display_cond1=>'0',
  p_row_template_display_cond2=>'0',
  p_row_template_display_cond3=>'0',
  p_row_template_display_cond4=>'0',
  p_next_page_template=>'<a href="#LINK#" class="t1pagination">#PAGINATION_NEXT#<img src="#IMAGE_PREFIX#themes/theme_1/paginate_next.gif" alt="Next"></a>',
  p_previous_page_template=>'<a href="#LINK#" class="t1pagination"><img src="#IMAGE_PREFIX#themes/theme_1/paginate_prev.gif" alt="Previous">#PAGINATION_PREVIOUS#</a>',
  p_next_set_template=>'<a href="#LINK#" class="t1pagination">#PAGINATION_NEXT_SET#<img src="#IMAGE_PREFIX#themes/theme_1/paginate_next.gif" alt="Next"></a>',
  p_previous_set_template=>'<a href="#LINK#" class="t1pagination"><img src="#IMAGE_PREFIX#themes/theme_1/paginate_prev.gif" alt="Previous">#PAGINATION_PREVIOUS_SET#</a>',
  p_row_style_checked=>'#ccc',
  p_theme_id  => 1,
  p_theme_class_id => 4,
  p_translate_this_template => 'N',
  p_row_template_comment=> '');
end;
null;
 
end;
/

 
begin
 
begin
wwv_flow_api.create_row_template_patch (
  p_id => 6519631646583133 + wwv_flow_api.g_id_offset,
  p_row_template_before_first =>'<tr #HIGHLIGHT_ROW#>',
  p_row_template_after_last =>'</tr>');
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/report/standard_ppr
prompt  ......report template 6519717984583133
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  c4 varchar2(32767) := null;
begin
c1:=c1||'<td#ALIGNMENT# headers="#COLUMN_HEADER_NAME#" class="t1data">#COLUMN_VALUE#</td>';

c2 := null;
c3 := null;
c4 := null;
wwv_flow_api.create_row_template (
  p_id=> 6519717984583133 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_row_template_name=> 'Standard (PPR)',
  p_row_template1=> c1,
  p_row_template_condition1=> '',
  p_row_template2=> c2,
  p_row_template_condition2=> '',
  p_row_template3=> c3,
  p_row_template_condition3=> '',
  p_row_template4=> c4,
  p_row_template_condition4=> '',
  p_row_template_before_rows=>'<div id="report#REGION_ID#"><htmldb:#REGION_ID#><table cellpadding="0" border="0" cellspacing="0" summary="">#TOP_PAGINATION#'||chr(10)||
'<tr>'||chr(10)||
'<td><table cellpadding="0" border="0" cellspacing="0" summary="" class="t1standard">',
  p_row_template_after_rows =>'</table><div class="t1CVS">#EXTERNAL_LINK##CSV_LINK#</div></td>'||chr(10)||
'</tr>'||chr(10)||
'#PAGINATION#'||chr(10)||
'</table>'||chr(10)||
'<script language=JavaScript type=text/javascript>'||chr(10)||
'<!--'||chr(10)||
'init_htmlPPRReport(''#REGION_ID#'');'||chr(10)||
''||chr(10)||
'//-->'||chr(10)||
'</script>'||chr(10)||
'</htmldb:#REGION_ID#>'||chr(10)||
'</div>',
  p_row_template_table_attr =>'',
  p_row_template_type =>'GENERIC_COLUMNS',
  p_column_heading_template=>'<th#ALIGNMENT# id="#COLUMN_HEADER_NAME#" class="t1header">#COLUMN_HEADER#</th>',
  p_row_template_display_cond1=>'0',
  p_row_template_display_cond2=>'0',
  p_row_template_display_cond3=>'0',
  p_row_template_display_cond4=>'0',
  p_next_page_template=>'<a href="javascript:html_PPR_Report_Page(this,''#REGION_ID#'',''#LINK#'')"  class="t1pagination">#PAGINATION_NEXT#<img src="#IMAGE_PREFIX#themes/theme_1/paginate_next.gif" alt="Next"></a>',
  p_previous_page_template=>'<a href="javascript:html_PPR_Report_Page(this,''#REGION_ID#'',''#LINK#'')"  class="t1pagination"><img src="#IMAGE_PREFIX#themes/theme_1/paginate_prev.gif" alt="Previous">#PAGINATION_PREVIOUS#</a>',
  p_next_set_template=>'<a href="javascript:html_PPR_Report_Page(this,''#REGION_ID#'',''#LINK#'')"  class="t1pagination">#PAGINATION_NEXT_SET#<img src="#IMAGE_PREFIX#themes/theme_1/paginate_next.gif" alt="Next"></a>',
  p_previous_set_template=>'<a href="javascript:html_PPR_Report_Page(this,''#REGION_ID#'',''#LINK#'')"  class="t1pagination"><img src="#IMAGE_PREFIX#themes/theme_1/paginate_prev.gif" alt="Previous">#PAGINATION_PREVIOUS_SET#</a>',
  p_row_style_checked=>'#CCCCCC',
  p_theme_id  => 1,
  p_theme_class_id => 7,
  p_translate_this_template => 'N',
  p_row_template_comment=> 'This is a deprecated template.'||chr(10)||
''||chr(10)||
'Reports using this template should be switched to to a standard template and the Enable Partial Page Refresh attribute should be enabled.');
end;
null;
 
end;
/

 
begin
 
begin
wwv_flow_api.create_row_template_patch (
  p_id => 6519717984583133 + wwv_flow_api.g_id_offset,
  p_row_template_before_first =>'<tr #HIGHLIGHT_ROW#>',
  p_row_template_after_last =>'</tr>');
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/report/standard_alternating_row_colors
prompt  ......report template 6519826145583134
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  c4 varchar2(32767) := null;
begin
c1:=c1||'<td class="t1data"#ALIGNMENT#>#COLUMN_VALUE#</td>';

c2:=c2||'<td class="t1dataalt"#ALIGNMENT#>#COLUMN_VALUE#</td>';

c3 := null;
c4 := null;
wwv_flow_api.create_row_template (
  p_id=> 6519826145583134 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_row_template_name=> 'Standard, Alternating Row Colors',
  p_row_template1=> c1,
  p_row_template_condition1=> '',
  p_row_template2=> c2,
  p_row_template_condition2=> '',
  p_row_template3=> c3,
  p_row_template_condition3=> '',
  p_row_template4=> c4,
  p_row_template_condition4=> '',
  p_row_template_before_rows=>'<table cellpadding="0" border="0" cellspacing="0" summary="" #REPORT_ATTRIBUTES# id="report_#REGION_STATIC_ID#">'||chr(10)||
'#TOP_PAGINATION#'||chr(10)||
'<tr><td><table border="0" cellpadding="0" cellspacing="0" summary="" class="t1standardalternatingrowcolors">',
  p_row_template_after_rows =>'</table><div class="t1CVS">#EXTERNAL_LINK##CSV_LINK#</div></td>'||chr(10)||
'</tr>'||chr(10)||
'#PAGINATION#'||chr(10)||
'</table>',
  p_row_template_table_attr =>'OMIT',
  p_row_template_type =>'GENERIC_COLUMNS',
  p_column_heading_template=>'<th class="t1header"#ALIGNMENT# id="#COLUMN_HEADER_NAME#">#COLUMN_HEADER#</th>',
  p_row_template_display_cond1=>'ODD_ROW_NUMBERS',
  p_row_template_display_cond2=>'0',
  p_row_template_display_cond3=>'0',
  p_row_template_display_cond4=>'ODD_ROW_NUMBERS',
  p_next_page_template=>'<a href="#LINK#" class="t1pagination">#PAGINATION_NEXT#<img src="#IMAGE_PREFIX#themes/theme_1/paginate_next.gif" alt="Next"></a>'||chr(10)||
'',
  p_previous_page_template=>'<a href="#LINK#" class="t1pagination"><img src="#IMAGE_PREFIX#themes/theme_1/paginate_prev.gif" alt="Previous">#PAGINATION_PREVIOUS#</a>',
  p_next_set_template=>'<a href="#LINK#" class="t1pagination">#PAGINATION_NEXT_SET#<img src="#IMAGE_PREFIX#themes/theme_1/paginate_next.gif" alt="Next"></a>',
  p_previous_set_template=>'<a href="#LINK#" class="t1pagination"><img src="#IMAGE_PREFIX#themes/theme_1/paginate_prev.gif" alt="Previous">#PAGINATION_PREVIOUS_SET#</a>',
  p_row_style_checked=>'#ccc',
  p_theme_id  => 1,
  p_theme_class_id => 5,
  p_translate_this_template => 'N',
  p_row_template_comment=> '');
end;
null;
 
end;
/

 
begin
 
begin
wwv_flow_api.create_row_template_patch (
  p_id => 6519826145583134 + wwv_flow_api.g_id_offset,
  p_row_template_before_first =>'<tr #HIGHLIGHT_ROW#>',
  p_row_template_after_last =>'</tr>');
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/report/value_attribute_pairs
prompt  ......report template 6519906111583135
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  c4 varchar2(32767) := null;
begin
c1:=c1||'<tr><th class="t1header">#COLUMN_HEADER#</th><td class="t1data">#COLUMN_VALUE#</td></tr>';

c2 := null;
c3 := null;
c4 := null;
wwv_flow_api.create_row_template (
  p_id=> 6519906111583135 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_row_template_name=> 'Value Attribute Pairs',
  p_row_template1=> c1,
  p_row_template_condition1=> '',
  p_row_template2=> c2,
  p_row_template_condition2=> '',
  p_row_template3=> c3,
  p_row_template_condition3=> '',
  p_row_template4=> c4,
  p_row_template_condition4=> '',
  p_row_template_before_rows=>'<table cellpadding="0" border="0" cellspacing="0" summary="" #REPORT_ATTRIBUTES# id="report_#REGION_STATIC_ID#">#TOP_PAGINATION#<tr><td><table cellpadding="0" cellspacing="0" border="0" summary="" class="t1ValueAttributePairs">',
  p_row_template_after_rows =>'</table><div class="t1CVS">#EXTERNAL_LINK##CSV_LINK#</div></td></tr>#PAGINATION#</table>',
  p_row_template_table_attr =>'',
  p_row_template_type =>'GENERIC_COLUMNS',
  p_column_heading_template=>'',
  p_row_template_display_cond1=>'0',
  p_row_template_display_cond2=>'0',
  p_row_template_display_cond3=>'0',
  p_row_template_display_cond4=>'0',
  p_next_page_template=>'<a href="#LINK#" class="t1pagination">#PAGINATION_NEXT#<img src="#IMAGE_PREFIX#themes/theme_1/paginate_next.gif" alt="Next"></a>',
  p_previous_page_template=>'<a href="#LINK#" class="t1pagination"><img src="#IMAGE_PREFIX#themes/theme_1/paginate_prev.gif" alt="Previous">#PAGINATION_PREVIOUS#</a>',
  p_next_set_template=>'<a href="#LINK#" class="t1pagination">#PAGINATION_NEXT_SET#<img src="#IMAGE_PREFIX#themes/theme_1/paginate_next.gif" alt="Next"></a>',
  p_previous_set_template=>'<a href="#LINK#" class="t1pagination"><img src="#IMAGE_PREFIX#themes/theme_1/paginate_prev.gif" alt="Previous">#PAGINATION_PREVIOUS_SET#</a>',
  p_theme_id  => 1,
  p_theme_class_id => 6,
  p_translate_this_template => 'N',
  p_row_template_comment=> '');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/report/borderless
prompt  ......report template 9022031500033202
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  c4 varchar2(32767) := null;
begin
c1:=c1||'<td class="t6data"#ALIGNMENT#>#COLUMN_VALUE#</td>';

c2 := null;
c3 := null;
c4 := null;
wwv_flow_api.create_row_template (
  p_id=> 9022031500033202 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_row_template_name=> 'Borderless',
  p_row_template1=> c1,
  p_row_template_condition1=> '',
  p_row_template2=> c2,
  p_row_template_condition2=> '',
  p_row_template3=> c3,
  p_row_template_condition3=> '',
  p_row_template4=> c4,
  p_row_template_condition4=> '',
  p_row_template_before_rows=>'<table cellpadding="0" border="0" cellspacing="0" summary="" #REPORT_ATTRIBUTES# id="report_#REGION_STATIC_ID#">'||chr(10)||
'#TOP_PAGINATION#'||chr(10)||
'<tr>'||chr(10)||
'<td><table cellpadding="0" border="0" cellspacing="0" summary="" class="t6borderless">',
  p_row_template_after_rows =>'</table></td>'||chr(10)||
'</tr>'||chr(10)||
'#PAGINATION#'||chr(10)||
'<tr><td class="t6bottom" colspan="99">#EXTERNAL_LINK##CSV_LINK#</td></tr>'||chr(10)||
'</table>',
  p_row_template_table_attr =>'OMIT',
  p_row_template_type =>'GENERIC_COLUMNS',
  p_column_heading_template=>'<th class="t6header" #ALIGNMENT# id="#COLUMN_HEADER_NAME#">#COLUMN_HEADER#</th>',
  p_row_template_display_cond1=>'0',
  p_row_template_display_cond2=>'0',
  p_row_template_display_cond3=>'0',
  p_row_template_display_cond4=>'0',
  p_pagination_template=>'<span class="t6Pagination">#TEXT#</span>',
  p_next_page_template=>'<a href="#LINK#"><img src="#IMAGE_PREFIX#themes/theme_6/NextPage.gif" alt="" /></a>',
  p_previous_page_template=>'<a href="#LINK#"><img src="#IMAGE_PREFIX#themes/theme_6/PreviousPage.gif" alt="" /></a>',
  p_next_set_template=>'<a href="#LINK#"><img src="#IMAGE_PREFIX#themes/theme_6/NextSet.gif" alt="" /></a>',
  p_previous_set_template=>'<a href="#LINK#"><img src="#IMAGE_PREFIX#themes/theme_6/PreviousSet.gif" alt="" /></a>',
  p_row_style_checked=>'#D69F72',
  p_theme_id  => 101,
  p_theme_class_id => 1,
  p_translate_this_template => 'N',
  p_row_template_comment=> '');
end;
null;
 
end;
/

 
begin
 
begin
wwv_flow_api.create_row_template_patch (
  p_id => 9022031500033202 + wwv_flow_api.g_id_offset,
  p_row_template_before_first =>'<tr #HIGHLIGHT_ROW#>',
  p_row_template_after_last =>'</tr>');
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/report/horizontal_border
prompt  ......report template 9022315927033202
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  c4 varchar2(32767) := null;
begin
c1:=c1||'<td class="t6data" #ALIGNMENT#>#COLUMN_VALUE#</td>';

c2 := null;
c3 := null;
c4 := null;
wwv_flow_api.create_row_template (
  p_id=> 9022315927033202 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_row_template_name=> 'Horizontal Border',
  p_row_template1=> c1,
  p_row_template_condition1=> '',
  p_row_template2=> c2,
  p_row_template_condition2=> '',
  p_row_template3=> c3,
  p_row_template_condition3=> '',
  p_row_template4=> c4,
  p_row_template_condition4=> '',
  p_row_template_before_rows=>'<table cellpadding="0" border="0" cellspacing="0" summary="" #REPORT_ATTRIBUTES# id="report_#REGION_STATIC_ID#">'||chr(10)||
'#TOP_PAGINATION#'||chr(10)||
'<tr><td><table class="t6bottomborderonly" border="0" cellpadding="0" cellspacing="0" summary="">',
  p_row_template_after_rows =>'</table></td></tr>'||chr(10)||
'#PAGINATION#'||chr(10)||
'<tr><td class="t6bottom">#EXTERNAL_LINK##CSV_LINK#</td></tr>'||chr(10)||
'</table>',
  p_row_template_table_attr =>'OMIT',
  p_row_template_type =>'GENERIC_COLUMNS',
  p_column_heading_template=>'<th class="t6header"  id="#COLUMN_HEADER_NAME#" #ALIGNMENT#>#COLUMN_HEADER#</th>',
  p_row_template_display_cond1=>'0',
  p_row_template_display_cond2=>'0',
  p_row_template_display_cond3=>'0',
  p_row_template_display_cond4=>'0',
  p_pagination_template=>'<span class="t6Pagination">#TEXT#</span>',
  p_next_page_template=>'<a href="#LINK#"><img src="#IMAGE_PREFIX#themes/theme_6/NextPage.gif" alt="" /></a>',
  p_previous_page_template=>'<a href="#LINK#"><img src="#IMAGE_PREFIX#themes/theme_6/PreviousPage.gif" alt="" /></a>',
  p_next_set_template=>'<a href="#LINK#"><img src="#IMAGE_PREFIX#themes/theme_6/NextSet.gif" alt="" /></a>',
  p_previous_set_template=>'<a href="#LINK#"><img src="#IMAGE_PREFIX#themes/theme_6/PreviousSet.gif" alt="" /></a>',
  p_row_style_checked=>'#D69F72',
  p_theme_id  => 101,
  p_theme_class_id => 2,
  p_translate_this_template => 'N',
  p_row_template_comment=> '');
end;
null;
 
end;
/

 
begin
 
begin
wwv_flow_api.create_row_template_patch (
  p_id => 9022315927033202 + wwv_flow_api.g_id_offset,
  p_row_template_before_first =>'<tr #HIGHLIGHT_ROW#>',
  p_row_template_after_last =>'</tr>');
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/report/one_column_unordered_list
prompt  ......report template 9022615609033203
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  c4 varchar2(32767) := null;
begin
c1:=c1||'<li>#COLUMN_VALUE#</li>';

c2 := null;
c3 := null;
c4 := null;
wwv_flow_api.create_row_template (
  p_id=> 9022615609033203 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_row_template_name=> 'One Column Unordered List',
  p_row_template1=> c1,
  p_row_template_condition1=> '',
  p_row_template2=> c2,
  p_row_template_condition2=> '',
  p_row_template3=> c3,
  p_row_template_condition3=> '',
  p_row_template4=> c4,
  p_row_template_condition4=> '',
  p_row_template_before_rows=>'<table cellspacing="0" cellpadding="0" width="100%" summary="" #REPORT_ATTRIBUTES# id="report_#REGION_STATIC_ID#">'||chr(10)||
'#TOP_PAGINATION#'||chr(10)||
'<tr><td><ul class="t6OneColumnUnorderedList">',
  p_row_template_after_rows =>'</ul></td></tr>'||chr(10)||
'#PAGINATION#'||chr(10)||
'<tr><td class="t6bottom" colspan="99">#EXTERNAL_LINK##CSV_LINK#</td></tr>'||chr(10)||
'</table>',
  p_row_template_table_attr =>'OMIT',
  p_row_template_type =>'GENERIC_COLUMNS',
  p_column_heading_template=>'',
  p_row_template_display_cond1=>'ODD_ROW_NUMBERS',
  p_row_template_display_cond2=>'NOT_CONDITIONAL',
  p_row_template_display_cond3=>'NOT_CONDITIONAL',
  p_row_template_display_cond4=>'ODD_ROW_NUMBERS',
  p_pagination_template=>'<span class="t6Pagination">#TEXT#</span>',
  p_next_page_template=>'<a href="#LINK#"><img src="#IMAGE_PREFIX#themes/theme_6/NextPage.gif" alt="" /></a>',
  p_previous_page_template=>'<a href="#LINK#"><img src="#IMAGE_PREFIX#themes/theme_6/PreviousPage.gif" alt="" /></a>',
  p_next_set_template=>'<a href="#LINK#"><img src="#IMAGE_PREFIX#themes/theme_6/NextSet.gif" alt="" /></a>',
  p_previous_set_template=>'<a href="#LINK#"><img src="#IMAGE_PREFIX#themes/theme_6/PreviousSet.gif" alt="" /></a>',
  p_theme_id  => 101,
  p_theme_class_id => 3,
  p_translate_this_template => 'N',
  p_row_template_comment=> '');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/report/standard
prompt  ......report template 9022923061033204
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  c4 varchar2(32767) := null;
begin
c1:=c1||'<td class="t6data"#ALIGNMENT#>#COLUMN_VALUE#</td>';

c2 := null;
c3 := null;
c4 := null;
wwv_flow_api.create_row_template (
  p_id=> 9022923061033204 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_row_template_name=> 'Standard',
  p_row_template1=> c1,
  p_row_template_condition1=> '',
  p_row_template2=> c2,
  p_row_template_condition2=> '',
  p_row_template3=> c3,
  p_row_template_condition3=> '',
  p_row_template4=> c4,
  p_row_template_condition4=> '',
  p_row_template_before_rows=>'<table cellpadding="0" border="0" cellspacing="0" summary="" #REPORT_ATTRIBUTES# id="report_#REGION_STATIC_ID#">'||chr(10)||
'#TOP_PAGINATION#'||chr(10)||
'<tr>'||chr(10)||
'<td><table cellpadding="0" border="0" cellspacing="0" summary="" class="t6standard">',
  p_row_template_after_rows =>'</table></td>'||chr(10)||
'</tr>'||chr(10)||
'#PAGINATION#'||chr(10)||
'<tr><td class="t6bottom" colspan="99">#EXTERNAL_LINK##CSV_LINK#</td></tr>'||chr(10)||
'</table>',
  p_row_template_table_attr =>'OMIT',
  p_row_template_type =>'GENERIC_COLUMNS',
  p_column_heading_template=>'<th class="t6header" #ALIGNMENT#>#COLUMN_HEADER#</th>',
  p_row_template_display_cond1=>'0',
  p_row_template_display_cond2=>'0',
  p_row_template_display_cond3=>'0',
  p_row_template_display_cond4=>'0',
  p_pagination_template=>'<span class="t6Pagination">#TEXT#</span>',
  p_next_page_template=>'<a href="#LINK#"><img src="#IMAGE_PREFIX#themes/theme_6/NextPage.gif" alt="" /></a>',
  p_previous_page_template=>'<a href="#LINK#"><img src="#IMAGE_PREFIX#themes/theme_6/PreviousPage.gif" alt="" /></a>',
  p_next_set_template=>'<a href="#LINK#"><img src="#IMAGE_PREFIX#themes/theme_6/NextSet.gif" alt="" /></a>',
  p_previous_set_template=>'<a href="#LINK#"><img src="#IMAGE_PREFIX#themes/theme_6/PreviousSet.gif" alt="" /></a>',
  p_row_style_checked=>'#D69F72',
  p_theme_id  => 101,
  p_theme_class_id => 4,
  p_translate_this_template => 'N',
  p_row_template_comment=> '');
end;
null;
 
end;
/

 
begin
 
begin
wwv_flow_api.create_row_template_patch (
  p_id => 9022923061033204 + wwv_flow_api.g_id_offset,
  p_row_template_before_first =>'<tr #HIGHLIGHT_ROW#>',
  p_row_template_after_last =>'</tr>');
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/report/standard_ppr
prompt  ......report template 9023228821033204
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  c4 varchar2(32767) := null;
begin
c1:=c1||'<td class="t6data"#ALIGNMENT#>#COLUMN_VALUE#</td>';

c2 := null;
c3 := null;
c4 := null;
wwv_flow_api.create_row_template (
  p_id=> 9023228821033204 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_row_template_name=> 'Standard (PPR)',
  p_row_template1=> c1,
  p_row_template_condition1=> '',
  p_row_template2=> c2,
  p_row_template_condition2=> '',
  p_row_template3=> c3,
  p_row_template_condition3=> '',
  p_row_template4=> c4,
  p_row_template_condition4=> '',
  p_row_template_before_rows=>'<div id="report#REGION_ID#"><htmldb:#REGION_ID#><table cellpadding="0" border="0" cellspacing="0" summary="">'||chr(10)||
'#TOP_PAGINATION#'||chr(10)||
'<tr>'||chr(10)||
'<td><table cellpadding="0" border="0" cellspacing="0" summary="" class="t6standard">',
  p_row_template_after_rows =>'</table></td>'||chr(10)||
'</tr>'||chr(10)||
'#PAGINATION#'||chr(10)||
'<tr><td class="t6bottom">#EXTERNAL_LINK##CSV_LINK#</td></tr>'||chr(10)||
'</table><script language=JavaScript type=text/javascript>'||chr(10)||
'<!--'||chr(10)||
'init_htmlPPRReport(''#REGION_ID#'');'||chr(10)||
''||chr(10)||
'//-->'||chr(10)||
'</script>'||chr(10)||
'</htmldb:#REGION_ID#>'||chr(10)||
'</div>',
  p_row_template_table_attr =>'OMIT',
  p_row_template_type =>'GENERIC_COLUMNS',
  p_column_heading_template=>'<th class="t6header" #ALIGNMENT#>#COLUMN_HEADER#</th>',
  p_row_template_display_cond1=>'0',
  p_row_template_display_cond2=>'0',
  p_row_template_display_cond3=>'0',
  p_row_template_display_cond4=>'0',
  p_pagination_template=>'<span class="t6Pagination">#TEXT#</span>',
  p_next_page_template=>'<a href="javascript:html_PPR_Report_Page(this,''#REGION_ID#'',''#LINK#'')"><img src="#IMAGE_PREFIX#themes/theme_6/NextPage.gif" alt="" /></a>',
  p_previous_page_template=>'<a href="javascript:html_PPR_Report_Page(this,''#REGION_ID#'',''#LINK#'')"><img src="#IMAGE_PREFIX#themes/theme_6/PreviousPage.gif" alt="" /></a>',
  p_next_set_template=>'<a href="javascript:html_PPR_Report_Page(this,''#REGION_ID#'',''#LINK#'')"><img src="#IMAGE_PREFIX#themes/theme_6/NextSet.gif" alt="" /></a>',
  p_previous_set_template=>'<a href="javascript:html_PPR_Report_Page(this,''#REGION_ID#'',''#LINK#'')"><img src="#IMAGE_PREFIX#themes/theme_6/PreviousSet.gif" alt="" /></a>',
  p_row_style_checked=>'#D69F72',
  p_theme_id  => 101,
  p_theme_class_id => 7,
  p_translate_this_template => 'N',
  p_row_template_comment=> '');
end;
null;
 
end;
/

 
begin
 
begin
wwv_flow_api.create_row_template_patch (
  p_id => 9023228821033204 + wwv_flow_api.g_id_offset,
  p_row_template_before_first =>'<tr #HIGHLIGHT_ROW#>',
  p_row_template_after_last =>'</tr>');
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/report/standard_alternating_row_colors
prompt  ......report template 9023521860033204
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  c4 varchar2(32767) := null;
begin
c1:=c1||'<td class="t6data"#ALIGNMENT#>#COLUMN_VALUE#</td>';

c2:=c2||'<td class="t6dataalt"#ALIGNMENT#>#COLUMN_VALUE#</td>';

c3 := null;
c4 := null;
wwv_flow_api.create_row_template (
  p_id=> 9023521860033204 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_row_template_name=> 'Standard, Alternating Row Colors',
  p_row_template1=> c1,
  p_row_template_condition1=> '',
  p_row_template2=> c2,
  p_row_template_condition2=> '',
  p_row_template3=> c3,
  p_row_template_condition3=> '',
  p_row_template4=> c4,
  p_row_template_condition4=> '',
  p_row_template_before_rows=>'<table cellpadding="0" border="0" cellspacing="0" summary="" #REPORT_ATTRIBUTES# id="report_#REGION_STATIC_ID#">'||chr(10)||
'#TOP_PAGINATION#'||chr(10)||
'<tr>'||chr(10)||
'<td><table cellpadding="0" border="0" cellspacing="0" summary="" class="t6standardalternatingrowcolors">',
  p_row_template_after_rows =>'</table></td>'||chr(10)||
'</tr>'||chr(10)||
'#PAGINATION#'||chr(10)||
'<tr><td class="t6bottom" colspan="99">#EXTERNAL_LINK##CSV_LINK#</td></tr>'||chr(10)||
'</table>',
  p_row_template_table_attr =>'OMIT',
  p_row_template_type =>'GENERIC_COLUMNS',
  p_column_heading_template=>'<th class="t6header"#ALIGNMENT# id="#COLUMN_HEADER_NAME#">#COLUMN_HEADER#</th>',
  p_row_template_display_cond1=>'ODD_ROW_NUMBERS',
  p_row_template_display_cond2=>'NOT_CONDITIONAL',
  p_row_template_display_cond3=>'NOT_CONDITIONAL',
  p_row_template_display_cond4=>'ODD_ROW_NUMBERS',
  p_pagination_template=>'<span class="t6Pagination">#TEXT#</span>',
  p_next_page_template=>'<a href="#LINK#"><img src="#IMAGE_PREFIX#themes/theme_6/NextPage.gif" alt="" /></a>',
  p_previous_page_template=>'<a href="#LINK#"><img src="#IMAGE_PREFIX#themes/theme_6/PreviousPage.gif" alt="" /></a>',
  p_next_set_template=>'<a href="#LINK#"><img src="#IMAGE_PREFIX#themes/theme_6/NextSet.gif" alt="" /></a>',
  p_previous_set_template=>'<a href="#LINK#"><img src="#IMAGE_PREFIX#themes/theme_6/PreviousSet.gif" alt="" /></a>',
  p_row_style_checked=>'#D69F72',
  p_theme_id  => 101,
  p_theme_class_id => 5,
  p_translate_this_template => 'N',
  p_row_template_comment=> '');
end;
null;
 
end;
/

 
begin
 
begin
wwv_flow_api.create_row_template_patch (
  p_id => 9023521860033204 + wwv_flow_api.g_id_offset,
  p_row_template_before_first =>'<tr #HIGHLIGHT_ROW#>',
  p_row_template_after_last =>'</tr>');
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/report/value_attribute_pairs
prompt  ......report template 9023806141033205
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  c4 varchar2(32767) := null;
begin
c1:=c1||'<tr><th class="t6header">#COLUMN_HEADER#</th><td class="t6data">#COLUMN_VALUE#</td></tr>';

c2 := null;
c3 := null;
c4 := null;
wwv_flow_api.create_row_template (
  p_id=> 9023806141033205 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_row_template_name=> 'Value Attribute Pairs',
  p_row_template1=> c1,
  p_row_template_condition1=> '',
  p_row_template2=> c2,
  p_row_template_condition2=> '',
  p_row_template3=> c3,
  p_row_template_condition3=> '',
  p_row_template4=> c4,
  p_row_template_condition4=> '',
  p_row_template_before_rows=>'<table cellpadding="0" border="0" cellspacing="0" summary="" #REPORT_ATTRIBUTES# id="report_#REGION_STATIC_ID#">'||chr(10)||
'#TOP_PAGINATION#'||chr(10)||
'<tr>'||chr(10)||
'<td><table cellpadding="0" border="0" cellspacing="0" summary="" class="t6valueattributepairs">',
  p_row_template_after_rows =>'</table></td>'||chr(10)||
'</tr>'||chr(10)||
'#PAGINATION#'||chr(10)||
'<tr><td class="t6bottom" colspan="99">#EXTERNAL_LINK##CSV_LINK#</td></tr>'||chr(10)||
'</table>',
  p_row_template_table_attr =>'OMIT',
  p_row_template_type =>'GENERIC_COLUMNS',
  p_column_heading_template=>'',
  p_row_template_display_cond1=>'0',
  p_row_template_display_cond2=>'0',
  p_row_template_display_cond3=>'0',
  p_row_template_display_cond4=>'0',
  p_pagination_template=>'<span class="t6Pagination">#TEXT#</span>',
  p_next_page_template=>'<a href="#LINK#"><img src="#IMAGE_PREFIX#themes/theme_6/NextPage.gif" alt="" /></a>',
  p_previous_page_template=>'<a href="#LINK#"><img src="#IMAGE_PREFIX#themes/theme_6/PreviousPage.gif" alt="" /></a>',
  p_next_set_template=>'<a href="#LINK#"><img src="#IMAGE_PREFIX#themes/theme_6/NextSet.gif" alt="" /></a>',
  p_previous_set_template=>'<a href="#LINK#"><img src="#IMAGE_PREFIX#themes/theme_6/PreviousSet.gif" alt="" /></a>',
  p_theme_id  => 101,
  p_theme_class_id => 6,
  p_translate_this_template => 'N',
  p_row_template_comment=> '');
end;
null;
 
end;
/

 
begin
 
begin
wwv_flow_api.create_row_template_patch (
  p_id => 9023806141033205 + wwv_flow_api.g_id_offset,
  p_row_template_before_first =>'',
  p_row_template_after_last =>'<tr><td colspan="2">&nbsp;</td></tr>');
exception when others then null;
end;
null;
 
end;
/

prompt  ...label templates
--
--application/shared_components/user_interface/templates/label/no_label
prompt  ......label template 6520023187583135
 
begin
 
begin
wwv_flow_api.create_field_template (
  p_id=> 6520023187583135 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_template_name=>'No Label',
  p_template_body1=>'<span class="t1NoLabel">',
  p_template_body2=>'</span>',
  p_on_error_before_label=>'<div class="t1InlineError">',
  p_on_error_after_label=>'<br/>#ERROR_MESSAGE#</div>',
  p_theme_id  => 1,
  p_theme_class_id => 13,
  p_translate_this_template=> 'N',
  p_template_comment=> '');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/label/optional
prompt  ......label template 6520131392583143
 
begin
 
begin
wwv_flow_api.create_field_template (
  p_id=> 6520131392583143 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_template_name=>'Optional',
  p_template_body1=>'<label for="#CURRENT_ITEM_NAME#" tabindex="999"><span class="t1Optional">',
  p_template_body2=>'</span></label>',
  p_on_error_before_label=>'<div class="t1InlineError">',
  p_on_error_after_label=>'<br/>#ERROR_MESSAGE#</div>',
  p_theme_id  => 1,
  p_theme_class_id => 3,
  p_translate_this_template=> 'N',
  p_template_comment=> '');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/label/optional_with_help
prompt  ......label template 6520201858583144
 
begin
 
begin
wwv_flow_api.create_field_template (
  p_id=> 6520201858583144 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_template_name=>'Optional with help',
  p_template_body1=>'<label for="#CURRENT_ITEM_NAME#" tabindex="999"><a class="t1OptionalwithHelp" href="javascript:popupFieldHelp(''#CURRENT_ITEM_ID#'',''&SESSION.'')" tabindex="999">',
  p_template_body2=>'</a></label>',
  p_on_error_before_label=>'<div class="t1InlineError">',
  p_on_error_after_label=>'<br/>#ERROR_MESSAGE#</div>',
  p_theme_id  => 1,
  p_theme_class_id => 1,
  p_translate_this_template=> 'N',
  p_template_comment=> '');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/label/required
prompt  ......label template 6520315092583144
 
begin
 
begin
wwv_flow_api.create_field_template (
  p_id=> 6520315092583144 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_template_name=>'Required',
  p_template_body1=>'<label for="#CURRENT_ITEM_NAME#" tabindex="999"><img src="#IMAGE_PREFIX#themes/theme_1/required.gif" alt="Required Field Icon" tabindex="999" /><span class="t1Required">',
  p_template_body2=>'</span></label>',
  p_on_error_before_label=>'<div class="t1InlineError">',
  p_on_error_after_label=>'<br/>#ERROR_MESSAGE#</div>',
  p_theme_id  => 1,
  p_theme_class_id => 4,
  p_translate_this_template=> 'N',
  p_template_comment=> '');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/label/required_with_help
prompt  ......label template 6520411358583144
 
begin
 
begin
wwv_flow_api.create_field_template (
  p_id=> 6520411358583144 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_template_name=>'Required with help',
  p_template_body1=>'<label for="#CURRENT_ITEM_NAME#" tabindex="999"><img src="#IMAGE_PREFIX#themes/theme_1/required.gif" alt="Required Field Icon" tabindex="999" /><a class="t1RequiredwithHelp" href="javascript:popupFieldHelp(''#CURRENT_ITEM_ID#'',''&SESSION.'')" tabindex="999">',
  p_template_body2=>'</a></label>',
  p_on_error_before_label=>'<div class="t1InlineError">',
  p_on_error_after_label=>'<br/>#ERROR_MESSAGE#</div>',
  p_theme_id  => 1,
  p_theme_class_id => 2,
  p_translate_this_template=> 'N',
  p_template_comment=> '');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/label/no_label
prompt  ......label template 9028907092033221
 
begin
 
begin
wwv_flow_api.create_field_template (
  p_id=> 9028907092033221 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_template_name=>'No Label',
  p_template_body1=>'<span class="t6NoLabel">',
  p_template_body2=>'</span>',
  p_on_error_before_label=>'',
  p_on_error_after_label=>'',
  p_theme_id  => 101,
  p_theme_class_id => 13,
  p_translate_this_template=> 'N',
  p_template_comment=> '');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/label/optional_label
prompt  ......label template 9029014433033222
 
begin
 
begin
wwv_flow_api.create_field_template (
  p_id=> 9029014433033222 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_template_name=>'Optional Label',
  p_template_body1=>'<label for="#CURRENT_ITEM_NAME#"><span class="t6OptionalLabel">',
  p_template_body2=>'</span></label>',
  p_on_error_before_label=>'',
  p_on_error_after_label=>'',
  p_theme_id  => 101,
  p_theme_class_id => 3,
  p_translate_this_template=> 'N',
  p_template_comment=> '');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/label/optional_label_with_help
prompt  ......label template 9029108958033222
 
begin
 
begin
wwv_flow_api.create_field_template (
  p_id=> 9029108958033222 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_template_name=>'Optional Label with Help',
  p_template_body1=>'<label for="#CURRENT_ITEM_NAME#"><a class="t6OptionalLabelWithHelp" href="javascript:popupFieldHelp(''#CURRENT_ITEM_ID#'',''&SESSION.'')" tabindex="999">',
  p_template_body2=>'</a></label>',
  p_on_error_before_label=>'',
  p_on_error_after_label=>'',
  p_theme_id  => 101,
  p_theme_class_id => 1,
  p_translate_this_template=> 'N',
  p_template_comment=> '');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/label/required_label
prompt  ......label template 9029218845033222
 
begin
 
begin
wwv_flow_api.create_field_template (
  p_id=> 9029218845033222 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_template_name=>'Required Label',
  p_template_body1=>'<label for="#CURRENT_ITEM_NAME#"><img src="#IMAGE_PREFIX#themes/theme_6/required1.gif" alt="Required Field Icon" /><span class="t6RequiredLabel">',
  p_template_body2=>'</span></label>',
  p_on_error_before_label=>'',
  p_on_error_after_label=>'',
  p_theme_id  => 101,
  p_theme_class_id => 4,
  p_translate_this_template=> 'N',
  p_template_comment=> '');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/label/required_label_with_help
prompt  ......label template 9029300529033222
 
begin
 
begin
wwv_flow_api.create_field_template (
  p_id=> 9029300529033222 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_template_name=>'Required Label with Help',
  p_template_body1=>'<label for="#CURRENT_ITEM_NAME#"><img src="#IMAGE_PREFIX#themes/theme_6/required1.gif" alt="Required Field Icon" /><a class="t6RequiredLabelWithHelp" href="javascript:popupFieldHelp(''#CURRENT_ITEM_ID#'',''&SESSION.'')" tabindex="999">',
  p_template_body2=>'</a></label>',
  p_on_error_before_label=>'',
  p_on_error_after_label=>'',
  p_theme_id  => 101,
  p_theme_class_id => 2,
  p_translate_this_template=> 'N',
  p_template_comment=> '');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/label/test_optionallabel
prompt  ......label template 9352522490788510
 
begin
 
begin
wwv_flow_api.create_field_template (
  p_id=> 9352522490788510 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_template_name=>'test_OptionalLabel',
  p_template_body1=>'<label for="#CURRENT_ITEM_NAME#" tabindex="999">',
  p_template_body2=>'</label>',
  p_on_error_before_label=>'',
  p_on_error_after_label=>'<br/>#ERROR_MESSAGE#',
  p_theme_id  => 101,
  p_theme_class_id => 3,
  p_translate_this_template=> 'N',
  p_template_comment=> '');
end;
null;
 
end;
/

prompt  ...breadcrumb templates
--
--application/shared_components/user_interface/templates/breadcrumb/breadcrumb_menu
prompt  ......template 6520511631583144
 
begin
 
begin
wwv_flow_api.create_menu_template (
  p_id=> 6520511631583144 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=>'Breadcrumb Menu',
  p_before_first=>'<div class="t1BreadcrumbMenu">',
  p_current_page_option=>'<span class="t1current">#NAME#</span>',
  p_non_current_page_option=>'<a href="#LINK#">#NAME#</a>',
  p_menu_link_attributes=>'',
  p_between_levels=>'&nbsp;&gt;&nbsp;',
  p_after_last=>'</div>',
  p_max_levels=>12,
  p_start_with_node=>'PARENT_TO_LEAF',
  p_theme_id  => 1,
  p_theme_class_id => 1,
  p_translate_this_template => 'N',
  p_template_comments=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/breadcrumb/hierarchical_menu
prompt  ......template 6520617895583165
 
begin
 
begin
wwv_flow_api.create_menu_template (
  p_id=> 6520617895583165 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=>'Hierarchical Menu',
  p_before_first=>'<ul class="t1HierarchicalMenu">',
  p_current_page_option=>'<li class="t1current">#NAME#</li>',
  p_non_current_page_option=>'<li><a href="#LINK#">#NAME#</a></li>',
  p_menu_link_attributes=>'',
  p_between_levels=>'',
  p_after_last=>'</ul>',
  p_max_levels=>11,
  p_start_with_node=>'CHILD_MENU',
  p_theme_id  => 1,
  p_theme_class_id => 2,
  p_translate_this_template => 'N',
  p_template_comments=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/breadcrumb/breadcrumb_menu
prompt  ......template 9030202862033224
 
begin
 
begin
wwv_flow_api.create_menu_template (
  p_id=> 9030202862033224 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=>'Breadcrumb Menu',
  p_before_first=>'<div class="t6BreadcrumbMenu">',
  p_current_page_option=>'#NAME#',
  p_non_current_page_option=>'<a href="#LINK#">#NAME#</a>',
  p_menu_link_attributes=>'',
  p_between_levels=>'&nbsp;&gt;&nbsp;',
  p_after_last=>'</div>',
  p_max_levels=>12,
  p_start_with_node=>'PARENT_TO_LEAF',
  p_theme_id  => 101,
  p_theme_class_id => 1,
  p_translate_this_template => 'N',
  p_template_comments=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/breadcrumb/hierarchical_menu
prompt  ......template 9030320698033242
 
begin
 
begin
wwv_flow_api.create_menu_template (
  p_id=> 9030320698033242 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=>'Hierarchical Menu',
  p_before_first=>'<ul class="t6HierarchicalMenu">',
  p_current_page_option=>'<li><a style="font-weight:bold;" href="#LINK#">#NAME#</a></li>',
  p_non_current_page_option=>'<li><a href="#LINK#">#NAME#</a></li>',
  p_menu_link_attributes=>'',
  p_between_levels=>'',
  p_after_last=>'</ul>',
  p_max_levels=>11,
  p_start_with_node=>'PARENT_TO_LEAF',
  p_theme_id  => 101,
  p_theme_class_id => 2,
  p_translate_this_template => 'N',
  p_template_comments=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/popuplov
prompt  ...popup list of values templates
--
prompt  ......template 6521319072583193
 
begin
 
begin
wwv_flow_api.create_popup_lov_template (
  p_id=> 6521319072583193 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_popup_icon=>'#IMAGE_PREFIX#list_gray.gif',
  p_popup_icon_attr=>'width="13" height="13" alt="Popup Lov"',
  p_popup_icon2=>'',
  p_popup_icon_attr2=>'',
  p_page_name=>'winlov',
  p_page_title=>'Search Dialog',
  p_page_html_head=>'<link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_1/theme_3_1.css" type="text/css">'||chr(10)||
'',
  p_page_body_attr=>'onload="first_field()" style="margin:0;"',
  p_before_field_text=>'<div class="t1PopupHead">',
  p_page_heading_text=>'',
  p_page_footer_text =>'',
  p_filter_width     =>'20',
  p_filter_max_width =>'100',
  p_filter_text_attr =>'',
  p_find_button_text =>'Search',
  p_find_button_image=>'',
  p_find_button_attr =>'',
  p_close_button_text=>'Close',
  p_close_button_image=>'',
  p_close_button_attr=>'',
  p_next_button_text =>'Next >',
  p_next_button_image=>'',
  p_next_button_attr =>'',
  p_prev_button_text =>'< Previous',
  p_prev_button_image=>'',
  p_prev_button_attr =>'',
  p_after_field_text=>'</div>',
  p_scrollbars=>'1',
  p_resizable=>'1',
  p_width =>'400',
  p_height=>'450',
  p_result_row_x_of_y=>'<br /><div style="padding:2px; font-size:8pt;">Row(s) #FIRST_ROW# - #LAST_ROW#</div>',
  p_result_rows_per_pg=>500,
  p_before_result_set=>'<div class="t1PopupBody">',
  p_theme_id  => 1,
  p_theme_class_id => 1,
  p_translate_this_template => 'N',
  p_after_result_set   =>'</div>');
end;
null;
 
end;
/

prompt  ......template 9030723665033247
 
begin
 
begin
wwv_flow_api.create_popup_lov_template (
  p_id=> 9030723665033247 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_popup_icon=>'#IMAGE_PREFIX#list_gray.gif',
  p_popup_icon_attr=>'width="13" height="13" alt="Popup Lov"',
  p_popup_icon2=>'',
  p_popup_icon_attr2=>'',
  p_page_name=>'winlov',
  p_page_title=>'Search Dialog',
  p_page_html_head=>'<link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_6/theme_V3.css" type="text/css" />'||chr(10)||
'',
  p_page_body_attr=>'onload="first_field()" style="margin:0;"',
  p_before_field_text=>'<div class="t6PopupHead">',
  p_page_heading_text=>'',
  p_page_footer_text =>'',
  p_filter_width     =>'20',
  p_filter_max_width =>'100',
  p_filter_text_attr =>'',
  p_find_button_text =>'Search',
  p_find_button_image=>'',
  p_find_button_attr =>'',
  p_close_button_text=>'Close',
  p_close_button_image=>'',
  p_close_button_attr=>'',
  p_next_button_text =>'Next >',
  p_next_button_image=>'',
  p_next_button_attr =>'',
  p_prev_button_text =>'< Previous',
  p_prev_button_image=>'',
  p_prev_button_attr =>'',
  p_after_field_text=>'</div>',
  p_scrollbars=>'1',
  p_resizable=>'1',
  p_width =>'400',
  p_height=>'450',
  p_result_row_x_of_y=>'<br /><div style="padding:2px; font-size:8pt;">Row(s) #FIRST_ROW# - #LAST_ROW#</div>',
  p_result_rows_per_pg=>500,
  p_before_result_set=>'<div class="t6PopupBody">',
  p_theme_id  => 101,
  p_theme_class_id => 1,
  p_translate_this_template => 'N',
  p_after_result_set   =>'</div>');
end;
null;
 
end;
/

prompt  ...calendar templates
--
--application/shared_components/user_interface/templates/calendar/calendar
prompt  ......template 6520700484583165
 
begin
 
begin
wwv_flow_api.create_calendar_template(
  p_id=> 6520700484583165 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_cal_template_name=>'Calendar',
  p_translate_this_template=> 'N',
  p_day_of_week_format=> '<th class="t1DayOfWeek">#IDAY#</th>',
  p_month_title_format=> '<table cellspacing="0" cellpadding="0" border="0" summary="" class="t1CalendarHolder"> '||chr(10)||
' <tr>'||chr(10)||
'   <td class="t1MonthTitle">#IMONTH# #YYYY#</td>'||chr(10)||
' </tr>'||chr(10)||
' <tr>'||chr(10)||
' <td>',
  p_month_open_format=> '<table border="0" cellpadding="0" cellspacing="0" summary="0" class="t1Calendar">',
  p_month_close_format=> '</table></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>'||chr(10)||
'',
  p_day_title_format=> '<div class="t1DayTitle">#DD#</div>',
  p_day_open_format=> '<td class="t1Day" valign="top">',
  p_day_close_format=> '</td>',
  p_today_open_format=> '<td valign="top" class="t1Today">',
  p_weekend_title_format=> '<div class="t1WeekendDayTitle">#DD#</div>',
  p_weekend_open_format => '<td valign="top" class="t1WeekendDay">',
  p_weekend_close_format => '</td>',
  p_nonday_title_format => '<div class="t1NonDayTitle">#DD#</div>',
  p_nonday_open_format => '<td class="t1NonDay" valign="top">',
  p_nonday_close_format => '</td>',
  p_week_title_format => '',
  p_week_open_format => '<tr>',
  p_week_close_format => '</tr> ',
  p_daily_title_format => '<table cellspacing="0" cellpadding="0" border="0" summary="" class="t1DayCalendarHolder"> <tr> <td class="t1MonthTitle">#IMONTH# #DD#, #YYYY#</td> </tr> <tr> <td>',
  p_daily_open_format => '<tr>',
  p_daily_close_format => '</tr>',
  p_weekly_title_format => '<table cellspacing="0" cellpadding="0" border="0" summary="" class="t1WeekCalendarHolder">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t1MonthTitle" id="test">#WTITLE#</td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td>',
  p_weekly_day_of_week_format => '<th class="t1DayOfWeek">#IDAY#<br>#MM#/#DD#</th>',
  p_weekly_month_open_format => '<table border="0" cellpadding="0" cellspacing="0" summary="0" class="t1WeekCalendar">',
  p_weekly_month_close_format => '</table></td></tr></table>',
  p_weekly_day_title_format => '',
  p_weekly_day_open_format => '<td class="t1Day" valign="top">',
  p_weekly_day_close_format => '<br /></td>',
  p_weekly_today_open_format => '<td class="t1Today" valign="top">',
  p_weekly_weekend_title_format => '',
  p_weekly_weekend_open_format => '<td valign="top" class="t1NonDay">',
  p_weekly_weekend_close_format => '<br /></td>',
  p_weekly_time_open_format => '<th class="t1Hour">',
  p_weekly_time_close_format => '<br /></th>',
  p_weekly_time_title_format => '#TIME#',
  p_weekly_hour_open_format => '<tr>',
  p_weekly_hour_close_format => '</tr>',
  p_daily_day_of_week_format => '<th class="t1DayOfWeek">#IDAY# #DD#/#MM#</th>',
  p_daily_month_title_format => '<table cellspacing="0" cellpadding="0" border="0" summary="" class="t1DayCalendarHolder"> <tr> <td class="t1MonthTitle">#IMONTH# #DD#, #YYYY#</td> </tr> <tr> <td>'||chr(10)||
'',
  p_daily_month_open_format => '<table border="0" cellpadding="2" cellspacing="0" summary="0" class="t1DayCalendar">',
  p_daily_month_close_format => '</table></td> </tr> </table>',
  p_daily_day_title_format => '',
  p_daily_day_open_format => '<td valign="top" class="t1Day">',
  p_daily_day_close_format => '<br /></td>',
  p_daily_today_open_format => '<td valign="top" class="t1Today">',
  p_daily_time_open_format => '<th class="t1Hour">',
  p_daily_time_close_format => '<br /></th>',
  p_daily_time_title_format => '#TIME#',
  p_daily_hour_open_format => '<tr>',
  p_daily_hour_close_format => '</tr>',
  p_theme_id  => 1,
  p_theme_class_id => 1,
  p_reference_id=> null);
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/calendar/calendar_alternative_1
prompt  ......template 6520920528583183
 
begin
 
begin
wwv_flow_api.create_calendar_template(
  p_id=> 6520920528583183 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_cal_template_name=>'Calendar, Alternative 1',
  p_translate_this_template=> 'N',
  p_day_of_week_format=> '<th valign="bottom" class="t1DayOfWeek">#IDAY#</th>',
  p_month_title_format=> '<table cellspacing="0" cellpadding="0" border="0" summary="" class="t1CalendarAlternative1Holder"> '||chr(10)||
' <tr>'||chr(10)||
'   <td class="t1MonthTitle">#IMONTH# #YYYY#</td>'||chr(10)||
' </tr>'||chr(10)||
' <tr>'||chr(10)||
' <td>',
  p_month_open_format=> '<table border="0" cellpadding="0" cellspacing="2" summary="0" class="t1CalendarAlternative1">',
  p_month_close_format=> '</table></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>'||chr(10)||
'',
  p_day_title_format=> '<div class="t1DayTitle">#DD#</div>',
  p_day_open_format=> '<td class="t1Day" valign="top" height="100" height="100">',
  p_day_close_format=> '</td>',
  p_today_open_format=> '<td valign="top" class="t1Today">',
  p_weekend_title_format=> '<div class="t1WeekendDayTitle">#DD#</div>',
  p_weekend_open_format => '<td valign="top" class="t1WeekendDay">',
  p_weekend_close_format => '</td>',
  p_nonday_title_format => '<div class="t1NonDayTitle">#DD#</div>',
  p_nonday_open_format => '<td class="t1NonDay" valign="top">',
  p_nonday_close_format => '</td>',
  p_week_title_format => '',
  p_week_open_format => '<tr>',
  p_week_close_format => '</tr> ',
  p_daily_title_format => '<table cellspacing="0" cellpadding="0" border="0" summary="" class="t1DayCalendarHolder"> <tr> <td class="t1MonthTitle">#IMONTH# #DD#, #YYYY#</td> </tr> <tr> <td>',
  p_daily_open_format => '<tr>',
  p_daily_close_format => '</tr>',
  p_weekly_title_format => '<table cellspacing="0" cellpadding="0" border="0" summary="" class="t1WeekCalendarAlternative1Holder">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t1MonthTitle" id="test">#WTITLE#</td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td>',
  p_weekly_day_of_week_format => '<th class="t1DayOfWeek">#IDAY#<br>#MM#/#DD#</th>',
  p_weekly_month_open_format => '<table border="0" cellpadding="0" cellspacing="2" summary="0" class="t1WeekCalendarAlternative1">',
  p_weekly_month_close_format => '</table></td></tr></table>',
  p_weekly_day_title_format => '',
  p_weekly_day_open_format => '<td class="t1Day" valign="top">',
  p_weekly_day_close_format => '<br /></td>',
  p_weekly_today_open_format => '<td class="t1Today" valign="top">',
  p_weekly_weekend_title_format => '',
  p_weekly_weekend_open_format => '<td valign="top" class="t1NonDay">',
  p_weekly_weekend_close_format => '<br /></td>',
  p_weekly_time_open_format => '<th class="t1Hour">',
  p_weekly_time_close_format => '<br /></th>',
  p_weekly_time_title_format => '#TIME#',
  p_weekly_hour_open_format => '<tr>',
  p_weekly_hour_close_format => '</tr>',
  p_daily_day_of_week_format => '<th class="t1DayOfWeek">#IDAY# #DD#/#MM#</th>',
  p_daily_month_title_format => '<table cellspacing="0" cellpadding="0" border="0" summary="" class="t1DayCalendarAlternative1Holder"> <tr><td class="t1MonthTitle">#IMONTH# #DD#, #YYYY#</td></tr><tr><td>'||chr(10)||
'',
  p_daily_month_open_format => '<table border="0" cellpadding="2" cellspacing="2" summary="0" class="t1DayCalendarAlternative1">',
  p_daily_month_close_format => '</table></td> </tr> </table>',
  p_daily_day_title_format => '',
  p_daily_day_open_format => '<td valign="top" class="t1Day">',
  p_daily_day_close_format => '<br /></td>',
  p_daily_today_open_format => '<td valign="top" class="t1Today">',
  p_daily_time_open_format => '<th class="t1Hour">',
  p_daily_time_close_format => '<br /></th>',
  p_daily_time_title_format => '#TIME#',
  p_daily_hour_open_format => '<tr>',
  p_daily_hour_close_format => '</tr>',
  p_theme_id  => 1,
  p_theme_class_id => 2,
  p_reference_id=> null);
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/calendar/small_calendar
prompt  ......template 6521123629583184
 
begin
 
begin
wwv_flow_api.create_calendar_template(
  p_id=> 6521123629583184 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_cal_template_name=>'Small Calendar',
  p_translate_this_template=> 'N',
  p_day_of_week_format=> '<th class="t1DayOfWeek">#DY#</th>',
  p_month_title_format=> '<table cellspacing="0" cellpadding="0" border="0" summary="" class="t1SmallCalendarHolder"> '||chr(10)||
' <tr>'||chr(10)||
'   <td class="t1MonthTitle">#IMONTH# #YYYY#</td>'||chr(10)||
' </tr>'||chr(10)||
' <tr>'||chr(10)||
' <td>',
  p_month_open_format=> '<table border="0" cellpadding="0" cellspacing="1" summary="" class="t1SmallCalendar">',
  p_month_close_format=> '</table></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>',
  p_day_title_format=> '<div class="t1DayTitle">#DD#</div>',
  p_day_open_format=> '<td class="t1Day" valign="top">',
  p_day_close_format=> '</td>',
  p_today_open_format=> '<td valign="top" class="t1Today">',
  p_weekend_title_format=> '<div class="t1WeekendDayTitle">#DD#</div>',
  p_weekend_open_format => '<td valign="top" class="t1WeekendDay">',
  p_weekend_close_format => '</td>',
  p_nonday_title_format => '<div class="t1NonDayTitle">#DD#</div>',
  p_nonday_open_format => '<td class="t1NonDay" valign="top">',
  p_nonday_close_format => '</td>',
  p_week_title_format => '',
  p_week_open_format => '<tr>',
  p_week_close_format => '</tr> ',
  p_daily_title_format => '<table cellspacing="0" cellpadding="0" border="0" summary="" class="t1DayCalendarHolder"> <tr> <td class="t1MonthTitle">#IMONTH# #DD#, #YYYY#</td> </tr> <tr> <td>',
  p_daily_open_format => '<tr>',
  p_daily_close_format => '</tr>',
  p_weekly_title_format => '<table cellspacing="0" cellpadding="0" border="0" summary="" class="t1SmallWeekCalendarHolder">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t1MonthTitle" id="test">#WTITLE#</td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td>',
  p_weekly_day_of_week_format => '<th class="t1DayOfWeek">#IDAY#<br />#MM#/#DD#</th>',
  p_weekly_month_open_format => '<table border="0" cellpadding="0" cellspacing="1" summary="0" class="t1SmallWeekCalendar">',
  p_weekly_month_close_format => '</table></td></tr></table>',
  p_weekly_day_title_format => '',
  p_weekly_day_open_format => '<td class="t1Day" valign="top">',
  p_weekly_day_close_format => '<br /></td>',
  p_weekly_today_open_format => '<td class="t1Today" valign="top">',
  p_weekly_weekend_title_format => '',
  p_weekly_weekend_open_format => '<td valign="top" class="t1NonDay">',
  p_weekly_weekend_close_format => '<br /></td>',
  p_weekly_time_open_format => '<th class="t1Hour">',
  p_weekly_time_close_format => '<br /></th>',
  p_weekly_time_title_format => '#TIME#',
  p_weekly_hour_open_format => '<tr>',
  p_weekly_hour_close_format => '</tr>',
  p_daily_day_of_week_format => '<th class="t1DayOfWeek">#IDAY# #DD#/#MM#</th>',
  p_daily_month_title_format => '<table cellspacing="0" cellpadding="0" border="0" summary="" class="t1SmallDayCalendarHolder"> <tr> <td class="t1MonthTitle">#IMONTH# #DD#, #YYYY#</td> </tr><tr><td>'||chr(10)||
'',
  p_daily_month_open_format => '<table border="0" cellpadding="2" cellspacing="1" summary="0" class="t1SmallDayCalendar">',
  p_daily_month_close_format => '</table></td></tr></table>',
  p_daily_day_title_format => '',
  p_daily_day_open_format => '<td valign="top" class="t1Day">',
  p_daily_day_close_format => '<br /></td>',
  p_daily_today_open_format => '<td valign="top" class="t1Today">',
  p_daily_time_open_format => '<th class="t1Hour">',
  p_daily_time_close_format => '<br /></th>',
  p_daily_time_title_format => '#TIME#',
  p_daily_hour_open_format => '<tr>',
  p_daily_hour_close_format => '</tr>',
  p_theme_id  => 1,
  p_theme_class_id => 3,
  p_reference_id=> null);
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/calendar/calendar
prompt  ......template 9030421222033243
 
begin
 
begin
wwv_flow_api.create_calendar_template(
  p_id=> 9030421222033243 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_cal_template_name=>'Calendar',
  p_translate_this_template=> 'N',
  p_day_of_week_format=> '<td width="100">#IDAY#</td>',
  p_month_title_format=> '<table class="t6StandardCalendar" width="100%" cellpadding="0" cellspacing="0" border="0" cellspacing="0" summary="">'||chr(10)||
'  <tr>'||chr(10)||
'    <td align="middle" class="formRegionHeader">#IMONTH#&nbsp;#YYYY#</td>'||chr(10)||
'  </tr>'||chr(10)||
'</table>',
  p_month_open_format=> '<table class="t6StandardCalendar" width="100%" cellpadding="0" cellspacing="0" border="0" cellspacing="0" summary=""  id="#REGION_SEQUENCE_ID#">'||chr(10)||
'  <tr>'||chr(10)||
'    <td align="center"  class="formRegionHeader"><table cellspacing="2" cellpadding="2" summary="">',
  p_month_close_format=> '    </table></td>'||chr(10)||
'  </tr>'||chr(10)||
'</table>',
  p_day_title_format=> '#DD#<br/><span style="font-weight:bold">'||chr(10)||
'',
  p_day_open_format=> '<td valign="top" width="100" class="formRegionBody">'||chr(10)||
'',
  p_day_close_format=> '</span>&nbsp;</td>',
  p_today_open_format=> '<td valign="top" class="formRegionBodyCurrent">',
  p_weekend_title_format=> '<div>#DD#</div><span style="font-weight:bold">'||chr(10)||
'',
  p_weekend_open_format => '<td valign="top" class="formRegionBodyWE">'||chr(10)||
'',
  p_weekend_close_format => '<span></td>',
  p_nonday_title_format => '<div>&nbsp;</div>',
  p_nonday_open_format => '<td valign="top">',
  p_nonday_close_format => '</td>',
  p_week_title_format => '',
  p_week_open_format => '<tr class="formRegionHeader">',
  p_week_close_format => '</tr> ',
  p_daily_title_format => '<th width="14%" class="calheader">#IDAY#</th>',
  p_daily_open_format => '<tr>',
  p_daily_close_format => '</tr>',
  p_weekly_title_format => '<table cellspacing="0" cellpadding="0" border="0" summary="" class="t6WeekCalendarHolder">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t6MonthTitle" id="test">#WTITLE#</td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td>',
  p_weekly_day_of_week_format => '<th class="t6DayOfWeek">#IDAY#<br>#MM#/#DD#</th>',
  p_weekly_month_open_format => '<table border="0" cellpadding="0" cellspacing="0" summary="0" class="t6WeekCalendar">',
  p_weekly_month_close_format => '</table></td></tr></table>',
  p_weekly_day_title_format => '',
  p_weekly_day_open_format => '<td class="t6Day" valign="top">',
  p_weekly_day_close_format => '<br /></td>',
  p_weekly_today_open_format => '<td class="t6Today" valign="top">',
  p_weekly_weekend_title_format => '',
  p_weekly_weekend_open_format => '<td valign="top" class="t6NonDay">',
  p_weekly_weekend_close_format => '<br /></td>',
  p_weekly_time_open_format => '<th class="t6Hour">',
  p_weekly_time_close_format => '<br /></th>',
  p_weekly_time_title_format => '#TIME#',
  p_weekly_hour_open_format => '<tr>',
  p_weekly_hour_close_format => '</tr>',
  p_daily_day_of_week_format => '<th class="t6DayOfWeek">#IDAY# #DD#/#MM#</th>',
  p_daily_month_title_format => '<table cellspacing="0" cellpadding="0" border="0" summary="" class="t6DayCalendarHolder"> <tr> <td class="t6MonthTitle">#IMONTH# #DD#, #YYYY#</td> </tr> <tr> <td>'||chr(10)||
'',
  p_daily_month_open_format => '<table border="0" cellpadding="2" cellspacing="0" summary="0" class="t6DayCalendar">',
  p_daily_month_close_format => '</table></td> </tr> </table>',
  p_daily_day_title_format => '',
  p_daily_day_open_format => '<td valign="top" class="t6Day">',
  p_daily_day_close_format => '<br /></td>',
  p_daily_today_open_format => '<td valign="top" class="t6Today">',
  p_daily_time_open_format => '<th class="t6Hour">',
  p_daily_time_close_format => '<br /></th>',
  p_daily_time_title_format => '#TIME#',
  p_daily_hour_open_format => '<tr>',
  p_daily_hour_close_format => '</tr>',
  p_theme_id  => 101,
  p_theme_class_id => 1,
  p_reference_id=> null);
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/calendar/calendar_alternative_1
prompt  ......template 9030525388033246
 
begin
 
begin
wwv_flow_api.create_calendar_template(
  p_id=> 9030525388033246 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_cal_template_name=>'Calendar, Alternative 1',
  p_translate_this_template=> 'N',
  p_day_of_week_format=> '<td width="60">#IDY#</td>',
  p_month_title_format=> '<table class="t6StandardCalendar" width="100%" cellpadding="0" cellspacing="0" border="0" cellspacing="0" summary="">'||chr(10)||
'  <tr>'||chr(10)||
'    <td align="middle" class="formRegionHeader">#IMONTH#&nbsp;#YYYY#</td>'||chr(10)||
'  </tr>',
  p_month_open_format=> '  <tr>'||chr(10)||
'    <td align="center"  class="formRegionHeader"><table cellspacing="0" cellpadding="0" class="condensedTable" summary="">',
  p_month_close_format=> '    </table></td>'||chr(10)||
'  </tr>'||chr(10)||
'</table>',
  p_day_title_format=> '#DD#<br/><span style="font-weight:bold">'||chr(10)||
'',
  p_day_open_format=> '<td valign="top"  width="60" class="formRegionBody">'||chr(10)||
'',
  p_day_close_format=> '</span>&nbsp;</td>',
  p_today_open_format=> '<td valign="top" class="formRegionBodyCurrent">',
  p_weekend_title_format=> '<div>#DD#</div><span style="font-weight:bold">'||chr(10)||
'',
  p_weekend_open_format => '<td valign="top" class="formRegionBodyWE">'||chr(10)||
'',
  p_weekend_close_format => '<span></td>',
  p_nonday_title_format => '<div>&nbsp;</div>',
  p_nonday_open_format => '<td valign="top">',
  p_nonday_close_format => '</td>',
  p_week_title_format => '',
  p_week_open_format => '<tr class="formRegionHeader">',
  p_week_close_format => '</tr> ',
  p_daily_title_format => '<th width="14%" class="calheader">#IDAY#</th>',
  p_daily_open_format => '<tr>',
  p_daily_close_format => '</tr>',
  p_weekly_title_format => '<table cellspacing="0" cellpadding="0" border="0" summary="" class="t6WeekCalendarAlternative1Holder">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t6MonthTitle" id="test">#WTITLE#</td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td>',
  p_weekly_day_of_week_format => '<th class="t6DayOfWeek">#IDAY#<br>#MM#/#DD#</th>',
  p_weekly_month_open_format => '<table border="0" cellpadding="0" cellspacing="0" summary="0" class="t6WeekCalendarAlternative1">',
  p_weekly_month_close_format => '</table></td></tr></table>',
  p_weekly_day_title_format => '',
  p_weekly_day_open_format => '<td class="t6Day" valign="top">',
  p_weekly_day_close_format => '<br /></td>',
  p_weekly_today_open_format => '<td class="t6Today" valign="top">',
  p_weekly_weekend_title_format => '',
  p_weekly_weekend_open_format => '<td valign="top" class="t6NonDay">',
  p_weekly_weekend_close_format => '<br /></td>',
  p_weekly_time_open_format => '<th class="t6Hour">',
  p_weekly_time_close_format => '<br /></th>',
  p_weekly_time_title_format => '#TIME#',
  p_weekly_hour_open_format => '<tr>',
  p_weekly_hour_close_format => '</tr>',
  p_daily_day_of_week_format => '<th class="t6DayOfWeek">#IDAY# #DD#/#MM#</th>',
  p_daily_month_title_format => '<table cellspacing="0" cellpadding="0" border="0" summary="" class="t6DayCalendarAlternative1Holder"> <tr><td class="t6MonthTitle">#IMONTH# #DD#, #YYYY#</td></tr><tr><td>'||chr(10)||
'',
  p_daily_month_open_format => '<table border="0" cellpadding="2" cellspacing="0" summary="0" class="t6DayCalendarAlternative1">',
  p_daily_month_close_format => '</table></td> </tr> </table>',
  p_daily_day_title_format => '',
  p_daily_day_open_format => '<td valign="top" class="t6Day">',
  p_daily_day_close_format => '<br /></td>',
  p_daily_today_open_format => '<td valign="top" class="t6Today">',
  p_daily_time_open_format => '<th class="t6Hour">',
  p_daily_time_close_format => '<br /></th>',
  p_daily_time_title_format => '#TIME#',
  p_daily_hour_open_format => '<tr>',
  p_daily_hour_close_format => '</tr>',
  p_theme_id  => 101,
  p_theme_class_id => 2,
  p_reference_id=> null);
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/calendar/small_calendar
prompt  ......template 9030619696033247
 
begin
 
begin
wwv_flow_api.create_calendar_template(
  p_id=> 9030619696033247 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_cal_template_name=>'Small Calendar',
  p_translate_this_template=> 'N',
  p_day_of_week_format=> '<td width="40" class="simpleHeadings">#IDY#</td>',
  p_month_title_format=> '<table class="t6SimpleCalendar" width="100%" cellpadding="0" cellspacing="0" border="0" cellspacing="0" summary="">'||chr(10)||
'  <tr>'||chr(10)||
'    <td align="middle" class="simpleHeader">#IMONTH#&nbsp;#YYYY#</td>'||chr(10)||
'  </tr>'||chr(10)||
'',
  p_month_open_format=> '  <tr>'||chr(10)||
'    <td align="center" class="simpleHeader"><table cellspacing="0" cellpadding="0" class="simpleTable" summary="">',
  p_month_close_format=> '    </table></td>'||chr(10)||
'  </tr>'||chr(10)||
'</table>',
  p_day_title_format=> '#DD#<br/><span style="font-weight:bold;">'||chr(10)||
'',
  p_day_open_format=> '<td valign="top" class="simpleBody">'||chr(10)||
'',
  p_day_close_format=> '</span>&nbsp;</td>',
  p_today_open_format=> '<td valign="top" class="simpleBodyCurrent">',
  p_weekend_title_format=> '<div>#DD#</div><span style="font-weight:bold;">'||chr(10)||
'',
  p_weekend_open_format => '<td valign="top" class="simpleBodyWE">'||chr(10)||
'',
  p_weekend_close_format => '<span></td>',
  p_nonday_title_format => '<div>&nbsp;</div>',
  p_nonday_open_format => '<td valign="top" class="simpleBody">',
  p_nonday_close_format => '</td>',
  p_week_title_format => '',
  p_week_open_format => '<tr class="formRegionHeader">',
  p_week_close_format => '</tr> ',
  p_daily_title_format => '<th width="14%" class="calheader">#IDAY#</th>',
  p_daily_open_format => '<tr>',
  p_daily_close_format => '</tr>',
  p_weekly_title_format => '<table cellspacing="0" cellpadding="0" border="0" summary="" class="t6SmallWeekCalendarHolder">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t6MonthTitle" id="test">#WTITLE#</td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td>',
  p_weekly_day_of_week_format => '<th class="t6DayOfWeek">#IDAY#<br />#MM#/#DD#</th>',
  p_weekly_month_open_format => '<table border="0" cellpadding="0" cellspacing="0" summary="0" class="t6SmallWeekCalendar">',
  p_weekly_month_close_format => '</table></td></tr></table>',
  p_weekly_day_title_format => '',
  p_weekly_day_open_format => '<td class="t6Day" valign="top">',
  p_weekly_day_close_format => '<br /></td>',
  p_weekly_today_open_format => '<td class="t6Today" valign="top">',
  p_weekly_weekend_title_format => '',
  p_weekly_weekend_open_format => '<td valign="top" class="t6NonDay">',
  p_weekly_weekend_close_format => '<br /></td>',
  p_weekly_time_open_format => '<th class="t6Hour">',
  p_weekly_time_close_format => '<br /></th>',
  p_weekly_time_title_format => '#TIME#',
  p_weekly_hour_open_format => '<tr>',
  p_weekly_hour_close_format => '</tr>',
  p_daily_day_of_week_format => '<th class="t6DayOfWeek">#IDAY# #DD#/#MM#</th>',
  p_daily_month_title_format => '<table cellspacing="0" cellpadding="0" border="0" summary="" class="t6SmallDayCalendarHolder"> <tr> <td class="t6MonthTitle">#IMONTH# #DD#, #YYYY#</td> </tr><tr><td>'||chr(10)||
'',
  p_daily_month_open_format => '<table border="0" cellpadding="2" cellspacing="0" summary="0" class="t6SmallDayCalendar">',
  p_daily_month_close_format => '</table></td></tr></table>',
  p_daily_day_title_format => '',
  p_daily_day_open_format => '<td valign="top" class="t6Day">',
  p_daily_day_close_format => '<br /></td>',
  p_daily_today_open_format => '<td valign="top" class="t6Today">',
  p_daily_time_open_format => '<th class="t6Hour">',
  p_daily_time_close_format => '<br /></th>',
  p_daily_time_title_format => '#TIME#',
  p_daily_hour_open_format => '<tr>',
  p_daily_hour_close_format => '</tr>',
  p_theme_id  => 101,
  p_theme_class_id => 3,
  p_reference_id=> null);
end;
null;
 
end;
/

prompt  ...application themes
--
--application/shared_components/user_interface/themes/red
prompt  ......theme 6521402876583208
begin
wwv_flow_api.create_theme (
  p_id =>6521402876583208 + wwv_flow_api.g_id_offset,
  p_flow_id =>wwv_flow.g_flow_id,
  p_theme_id  => 1,
  p_theme_name=>'Red',
  p_default_page_template=>6514330138583068 + wwv_flow_api.g_id_offset,
  p_error_template=>6514502854583071 + wwv_flow_api.g_id_offset,
  p_printer_friendly_template=>6514820359583074 + wwv_flow_api.g_id_offset,
  p_breadcrumb_display_point=>'REGION_POSITION_01',
  p_sidebar_display_point=>'REGION_POSITION_02',
  p_login_template=>6514220765583047 + wwv_flow_api.g_id_offset,
  p_default_button_template=>6515101628583077 + wwv_flow_api.g_id_offset,
  p_default_region_template=>6517030617583102 + wwv_flow_api.g_id_offset,
  p_default_chart_template =>6516117765583100 + wwv_flow_api.g_id_offset,
  p_default_form_template  =>6516232166583100 + wwv_flow_api.g_id_offset,
  p_default_reportr_template   =>6517030617583102 + wwv_flow_api.g_id_offset,
  p_default_tabform_template=>6517030617583102 + wwv_flow_api.g_id_offset,
  p_default_wizard_template=>6517500342583104 + wwv_flow_api.g_id_offset,
  p_default_menur_template=>6515703632583099 + wwv_flow_api.g_id_offset,
  p_default_listr_template=>6516011713583100 + wwv_flow_api.g_id_offset,
  p_default_report_template   =>6519631646583133 + wwv_flow_api.g_id_offset,
  p_default_label_template=>6520201858583144 + wwv_flow_api.g_id_offset,
  p_default_menu_template=>6520511631583144 + wwv_flow_api.g_id_offset,
  p_default_calendar_template=>6520700484583165 + wwv_flow_api.g_id_offset,
  p_default_list_template=>6519007221583121 + wwv_flow_api.g_id_offset,
  p_default_option_label=>6520201858583144 + wwv_flow_api.g_id_offset,
  p_default_required_label=>6520411358583144 + wwv_flow_api.g_id_offset);
end;
/
 
--application/shared_components/user_interface/themes/dsm_tool_theme
prompt  ......theme 9030928563033252
begin
wwv_flow_api.create_theme (
  p_id =>9030928563033252 + wwv_flow_api.g_id_offset,
  p_flow_id =>wwv_flow.g_flow_id,
  p_theme_id  => 101,
  p_theme_name=>'DSM tool Theme',
  p_default_page_template=>9012716699033187 + wwv_flow_api.g_id_offset,
  p_error_template=>9013321601033188 + wwv_flow_api.g_id_offset,
  p_printer_friendly_template=>9014214682033191 + wwv_flow_api.g_id_offset,
  p_breadcrumb_display_point=>'REGION_POSITION_01',
  p_sidebar_display_point=>'REGION_POSITION_02',
  p_login_template=>9012512808033184 + wwv_flow_api.g_id_offset,
  p_default_button_template=>9029432560033223 + wwv_flow_api.g_id_offset,
  p_default_region_template=>9019926172033199 + wwv_flow_api.g_id_offset,
  p_default_chart_template =>9016904943033196 + wwv_flow_api.g_id_offset,
  p_default_form_template  =>9017212434033196 + wwv_flow_api.g_id_offset,
  p_default_reportr_template   =>9019926172033199 + wwv_flow_api.g_id_offset,
  p_default_tabform_template=>9019926172033199 + wwv_flow_api.g_id_offset,
  p_default_wizard_template=>9021432005033201 + wwv_flow_api.g_id_offset,
  p_default_menur_template=>9015703988033195 + wwv_flow_api.g_id_offset,
  p_default_listr_template=>9018407692033198 + wwv_flow_api.g_id_offset,
  p_default_report_template   =>9023521860033204 + wwv_flow_api.g_id_offset,
  p_default_label_template=>9028907092033221 + wwv_flow_api.g_id_offset,
  p_default_menu_template=>9030202862033224 + wwv_flow_api.g_id_offset,
  p_default_calendar_template=>9030421222033243 + wwv_flow_api.g_id_offset,
  p_default_list_template=>9028005977033220 + wwv_flow_api.g_id_offset,
  p_default_option_label=>9029108958033222 + wwv_flow_api.g_id_offset,
  p_default_required_label=>9029300529033222 + wwv_flow_api.g_id_offset);
end;
/
 
prompt  ...build options used by application 777
--
 
begin
 
null;
 
end;
/

--application/shared_components/globalization/messages
prompt  ...messages used by application: 777
--
--application/shared_components/globalization/dyntranslations
prompt  ...dynamic translations used by application: 777
--
--application/shared_components/globalization/language
prompt  ...Language Maps for Application 777
--
 
begin
 
null;
 
end;
/

prompt  ...Shortcuts
--
prompt  ...web services (9iR2 or better)
--
prompt  ...shared queries
--
prompt  ...report layouts
--
prompt  ...authentication schemes
--
--application/shared_components/security/authentication/html_db
prompt  ......scheme 6521507607583279
 
begin
 
declare
  s1 varchar2(32767) := null;
  s2 varchar2(32767) := null;
  s3 varchar2(32767) := null;
  s4 varchar2(32767) := null;
  s5 varchar2(32767) := null;
begin
s1 := null;
s2 := null;
s3 := null;
s4:=s4||'-BUILTIN-';

s5 := null;
wwv_flow_api.create_auth_setup (
  p_id=> 6521507607583279 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'HTML DB',
  p_description=>'Use internal Application Express account credentials and login page in this application.',
  p_page_sentry_function=> s1,
  p_sess_verify_function=> s2,
  p_pre_auth_process=> s3,
  p_auth_function=> s4,
  p_post_auth_process=> s5,
  p_invalid_session_page=>'101',
  p_invalid_session_url=>'',
  p_cookie_name=>'',
  p_cookie_path=>'',
  p_cookie_domain=>'',
  p_use_secure_cookie_yn=>'',
  p_ldap_host=>'',
  p_ldap_port=>'',
  p_ldap_string=>'',
  p_attribute_01=>'',
  p_attribute_02=>'wwv_flow_custom_auth_std.logout?p_this_flow=&APP_ID.&amp;p_next_flow_page_sess=&APP_ID.:1',
  p_attribute_03=>'',
  p_attribute_04=>'',
  p_attribute_05=>'',
  p_attribute_06=>'',
  p_attribute_07=>'',
  p_attribute_08=>'',
  p_required_patch=>'');
end;
null;
 
end;
/

--application/shared_components/security/authentication/database
prompt  ......scheme 6521620813583282
 
begin
 
declare
  s1 varchar2(32767) := null;
  s2 varchar2(32767) := null;
  s3 varchar2(32767) := null;
  s4 varchar2(32767) := null;
  s5 varchar2(32767) := null;
begin
s1:=s1||'-DATABASE-';

s2 := null;
s3 := null;
s4 := null;
s5 := null;
wwv_flow_api.create_auth_setup (
  p_id=> 6521620813583282 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'DATABASE',
  p_description=>'Use database authentication (user identified by DAD).',
  p_page_sentry_function=> s1,
  p_sess_verify_function=> s2,
  p_pre_auth_process=> s3,
  p_auth_function=> s4,
  p_post_auth_process=> s5,
  p_invalid_session_page=>'',
  p_invalid_session_url=>'',
  p_cookie_name=>'',
  p_cookie_path=>'',
  p_cookie_domain=>'',
  p_use_secure_cookie_yn=>'',
  p_ldap_host=>'',
  p_ldap_port=>'',
  p_ldap_string=>'',
  p_attribute_01=>'',
  p_attribute_02=>'',
  p_attribute_03=>'',
  p_attribute_04=>'',
  p_attribute_05=>'',
  p_attribute_06=>'',
  p_attribute_07=>'',
  p_attribute_08=>'',
  p_required_patch=>'');
end;
null;
 
end;
/

--application/shared_components/security/authentication/database_account
prompt  ......scheme 6521712667583283
 
begin
 
declare
  s1 varchar2(32767) := null;
  s2 varchar2(32767) := null;
  s3 varchar2(32767) := null;
  s4 varchar2(32767) := null;
  s5 varchar2(32767) := null;
begin
s1 := null;
s2 := null;
s3 := null;
s4:=s4||'return false; end;--';

s5 := null;
wwv_flow_api.create_auth_setup (
  p_id=> 6521712667583283 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'DATABASE ACCOUNT',
  p_description=>'Use database account credentials.',
  p_page_sentry_function=> s1,
  p_sess_verify_function=> s2,
  p_pre_auth_process=> s3,
  p_auth_function=> s4,
  p_post_auth_process=> s5,
  p_invalid_session_page=>'101',
  p_invalid_session_url=>'',
  p_cookie_name=>'',
  p_cookie_path=>'',
  p_cookie_domain=>'',
  p_use_secure_cookie_yn=>'',
  p_ldap_host=>'',
  p_ldap_port=>'',
  p_ldap_string=>'',
  p_attribute_01=>'',
  p_attribute_02=>'wwv_flow_custom_auth_std.logout?p_this_flow=&APP_ID.&amp;p_next_flow_page_sess=&APP_ID.:1',
  p_attribute_03=>'',
  p_attribute_04=>'',
  p_attribute_05=>'',
  p_attribute_06=>'',
  p_attribute_07=>'',
  p_attribute_08=>'',
  p_required_patch=>'');
end;
null;
 
end;
/

--application/deployment/definition
prompt  ...application deployment
--
 
begin
 
declare
    s varchar2(32767) := null;
    l_clob clob;
begin
s := null;
wwv_flow_api.create_install (
  p_id => 6593912548079682 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_include_in_export_yn => 'Y',
  p_deinstall_script_clob => s,
  p_deinstall_message=> '');
end;
 
 
end;
/

--application/deployment/install
prompt  ...application install scripts
--
--application/deployment/checks
prompt  ...application deployment checks
--
 
begin
 
null;
 
end;
/

--application/deployment/buildoptions
prompt  ...application deployment build options
--
 
begin
 
null;
 
end;
/

--application/end_environment
commit;
commit;
begin 
execute immediate 'alter session set nls_numeric_characters='''||wwv_flow_api.g_nls_numeric_chars||'''';
end;
/
set verify on
set feedback on
prompt  ...done
