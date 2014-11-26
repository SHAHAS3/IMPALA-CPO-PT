create or replace force view mars_trd_dpppfp as
select "GLOBAL_MATERIAL_NUMBER","BASIS_NUMBER","VARIANT_NUMBER","BASIS_TYPE",
  "GLOBAL_MATERIAL_NAME","BASIS_NAME","VARIANT_NAME","DRUGCODE","DOSAGE_FORM",
  "DOSAGE_CONCATENATION","LONG_TEXT","CHANGE_REASON","TRD_MATERIAL_NAME",
  "ZZ_GLIFECYCLE" 
  from TEMP_VARIANT_COFC where basis_type='DP' or 
  basis_type='PP' or basis_type='FP' and TRD_Material_name is not null
order by trd_material_name;

