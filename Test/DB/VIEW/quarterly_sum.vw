create or replace force view quarterly_sum as
select '1Q'||(substr(to_char(sysdate+10,'dd-mon-yy'),8,2)) "Quarter",
p.drug_product_name "Drug Product Name", h.protocolnumber "PROTOCOLNUMBER",
sum(p.quantity) "Total Quantity" 
from forecastingheader h,forecastingproducts p where 
p.fh_id=h.id
and
h.fpfv between 
'1-JAN-'||substr(to_char(sysdate+10,'dd-mon-yy'),8,2) 
and
'31-MAR-'||substr(to_char(sysdate+10,'dd-mon-yy'),8,2)
group by drug_product_name,protocolnumber
union
select '2Q'||substr(to_char(sysdate+10,'dd-mon-yy'),8,2) "Quarter",p.drug_product_name "Drug Product Name", h.protocolnumber "PROTOCOLNUMBER",
sum(p.quantity) "Total Quantity" 
from forecastingheader h,forecastingproducts p where 
p.fh_id=h.id
and
h.fpfv between 
'1-APR-'||substr(to_char(sysdate+10,'dd-mon-yy'),8,2) 
and
'30-JUN-'||substr(to_char(sysdate+10,'dd-mon-yy'),8,2)
group by drug_product_name,protocolnumber
union
select '3Q'||substr(to_char(sysdate+10,'dd-mon-yy'),8,2) "Quarter",p.drug_product_name "Drug Product Name", h.protocolnumber "PROTOCOLNUMBER",
sum(p.quantity) "Total Quantity" 
from forecastingheader h,forecastingproducts p where 
p.fh_id=h.id
and
h.fpfv between 
'1-JUL-'||substr(to_char(sysdate+10,'dd-mon-yy'),8,2) 
and
'30-SEP-'||substr(to_char(sysdate+10,'dd-mon-yy'),8,2)
group by drug_product_name,protocolnumber
union
select '4Q'||substr(to_char(sysdate+10,'dd-mon-yy'),8,2) "Quarter",p.drug_product_name "Drug Product Name", h.protocolnumber "PROTOCOLNUMBER",
sum(p.quantity) "Total Quantity" 
from forecastingheader h,forecastingproducts p where 
p.fh_id=h.id
and
h.fpfv between 
'1-Oct-'||substr(to_char(sysdate+10,'dd-mon-yy'),8,2) 
and
'31-DEC-'||substr(to_char(sysdate+10,'dd-mon-yy'),8,2)
group by drug_product_name,protocolnumber
union
select '1Q'||(substr(to_char(sysdate+10,'dd-mon-yy'),8,2)+1) "Quarter",p.drug_product_name "Drug Product Name", h.protocolnumber "PROTOCOLNUMBER",
sum(p.quantity) "Total Quantity" 
from forecastingheader h,forecastingproducts p where 
p.fh_id=h.id
and
h.fpfv between 
'1-JAN-'||(substr(to_char(sysdate+10,'dd-mon-yy'),8,2)+1) 
and
'31-MAR-'||(substr(to_char(sysdate+10,'dd-mon-yy'),8,2)+1)
group by drug_product_name,protocolnumber
UNION
select '2Q'||(substr(to_char(sysdate+10,'dd-mon-yy'),8,2)+1) "Quarter",p.drug_product_name "Drug Product Name", h.protocolnumber "PROTOCOLNUMBER",
sum(p.quantity) "Total Quantity" 
from forecastingheader h,forecastingproducts p where 
p.fh_id=h.id
and
h.fpfv between 
'1-APR-'||(substr(to_char(sysdate+10,'dd-mon-yy'),8,2)+1) 
and
'30-JUN-'||(substr(to_char(sysdate+10,'dd-mon-yy'),8,2)+1)
group by drug_product_name,protocolnumber
union
select '1Q'||substr(to_char(sysdate+10,'dd-mon-yy'),8,2) "Quarter",p.drug_product_name "Drug Product Name", h.protocolnumber "PROTOCOLNUMBER",
sum(p.quantity) "Total Quantity" 
from forecastingheader h,forecastingproducts p where 
p.fh_id=h.id
and
h.fpfv between 
'1-JAN-'||substr(to_char(sysdate+10,'dd-mon-yy'),8,2) 
and
'31-MAR-'||substr(to_char(sysdate+10,'dd-mon-yy'),8,2)
group by drug_product_name,protocolnumber
union
select '2Q'||substr(to_char(sysdate+10,'dd-mon-yy'),8,2) "Quarter",p.drug_product_name "Drug Product Name", h.protocolnumber "PROTOCOLNUMBER",
sum(p.quantity) "Total Quantity" 
from forecastingheader h,forecastingproducts p where 
p.fh_id=h.id
and
h.fpfv between 
'1-APR-'||substr(to_char(sysdate+10,'dd-mon-yy'),8,2) 
and
'30-JUN-'||substr(to_char(sysdate+10,'dd-mon-yy'),8,2)
group by drug_product_name,protocolnumber
union
select '3Q'||substr(to_char(sysdate+10,'dd-mon-yy'),8,2) "Quarter",p.drug_product_name "Drug Product Name", h.protocolnumber "PROTOCOLNUMBER",
sum(p.quantity) "Total Quantity" 
from forecastingheader h,forecastingproducts p where 
p.fh_id=h.id
and
h.fpfv between 
'1-JUL-'||substr(to_char(sysdate+10,'dd-mon-yy'),8,2) 
and
'30-SEP-'||substr(to_char(sysdate+10,'dd-mon-yy'),8,2)
group by drug_product_name,protocolnumber
union
select '4Q'||substr(to_char(sysdate+10,'dd-mon-yy'),8,2) "Quarter",p.drug_product_name "Drug Product Name", h.protocolnumber "PROTOCOLNUMBER",
sum(p.quantity) "Total Quantity" 
from forecastingheader h,forecastingproducts p where 
p.fh_id=h.id
and
h.fpfv between 
'1-Oct-'||substr(to_char(sysdate+10,'dd-mon-yy'),8,2) 
and
'31-DEC-'||substr(to_char(sysdate+10,'dd-mon-yy'),8,2)
group by drug_product_name,protocolnumber
union
select '1Q'||(substr(to_char(sysdate+10,'dd-mon-yy'),8,2)+1) "Quarter",p.drug_product_name "Drug Product Name", h.protocolnumber "PROTOCOLNUMBER",
sum(p.quantity) "Total Quantity" 
from forecastingheader h,forecastingproducts p where 
p.fh_id=h.id
and
h.fpfv between 
'1-JAN-'||(substr(to_char(sysdate+10,'dd-mon-yy'),8,2)+1) 
and
'31-MAR-'||(substr(to_char(sysdate+10,'dd-mon-yy'),8,2)+1)
group by drug_product_name,protocolnumber
UNION
select '3Q'||(substr(to_char(sysdate+10,'dd-mon-yy'),8,2)+1) "Quarter",p.drug_product_name "Drug Product Name", h.protocolnumber "PROTOCOLNUMBER",
sum(p.quantity) "Total Quantity" 
from forecastingheader h,forecastingproducts p where 
p.fh_id=h.id
and
h.fpfv between 
'1-JUL-'||(substr(to_char(sysdate+10,'dd-mon-yy'),8,2)+1) 
and
'30-SEP-'||(substr(to_char(sysdate+10,'dd-mon-yy'),8,2)+1)
group by drug_product_name,protocolnumber
union
select '1Q'||substr(to_char(sysdate+10,'dd-mon-yy'),8,2) "Quarter",p.drug_product_name "Drug Product Name", h.protocolnumber "PROTOCOLNUMBER",
sum(p.quantity) "Total Quantity" 
from forecastingheader h,forecastingproducts p where 
p.fh_id=h.id
and
h.fpfv between 
'1-JAN-'||substr(to_char(sysdate+10,'dd-mon-yy'),8,2) 
and
'31-MAR-'||substr(to_char(sysdate+10,'dd-mon-yy'),8,2)
group by drug_product_name,protocolnumber
union
select '2Q'||substr(to_char(sysdate+10,'dd-mon-yy'),8,2) "Quarter",p.drug_product_name "Drug Product Name", h.protocolnumber "PROTOCOLNUMBER",
sum(p.quantity) "Total Quantity" 
from forecastingheader h,forecastingproducts p where 
p.fh_id=h.id
and
h.fpfv between 
'1-APR-'||substr(to_char(sysdate+10,'dd-mon-yy'),8,2) 
and
'30-JUN-'||substr(to_char(sysdate+10,'dd-mon-yy'),8,2)
group by drug_product_name,protocolnumber
union
select '3Q'||substr(to_char(sysdate+10,'dd-mon-yy'),8,2) "Quarter",p.drug_product_name "Drug Product Name", h.protocolnumber "PROTOCOLNUMBER",
sum(p.quantity) "Total Quantity" 
from forecastingheader h,forecastingproducts p where 
p.fh_id=h.id
and
h.fpfv between 
'1-JUL-'||substr(to_char(sysdate+10,'dd-mon-yy'),8,2) 
and
'30-SEP-'||substr(to_char(sysdate+10,'dd-mon-yy'),8,2)
group by drug_product_name,protocolnumber
union
select '4Q'||substr(to_char(sysdate+10,'dd-mon-yy'),8,2) "Quarter",p.drug_product_name "Drug Product Name", h.protocolnumber "PROTOCOLNUMBER",
sum(p.quantity) "Total Quantity" 
from forecastingheader h,forecastingproducts p where 
p.fh_id=h.id
and
h.fpfv between 
'1-Oct-'||substr(to_char(sysdate+10,'dd-mon-yy'),8,2) 
and
'31-DEC-'||substr(to_char(sysdate+10,'dd-mon-yy'),8,2)
group by drug_product_name,protocolnumber
union
select '1Q'||(substr(to_char(sysdate+10,'dd-mon-yy'),8,2)+1) "Quarter",p.drug_product_name "Drug Product Name", h.protocolnumber "PROTOCOLNUMBER",
sum(p.quantity) "Total Quantity" 
from forecastingheader h,forecastingproducts p where 
p.fh_id=h.id
and
h.fpfv between 
'1-JAN-'||(substr(to_char(sysdate+10,'dd-mon-yy'),8,2)+1) 
and
'31-MAR-'||(substr(to_char(sysdate+10,'dd-mon-yy'),8,2)+1)
group by drug_product_name,protocolnumber
UNION
select '4Q'||(substr(to_char(sysdate+10,'dd-mon-yy'),8,2)+1) "Quarter",p.drug_product_name "Drug Product Name", h.protocolnumber "PROTOCOLNUMBER",
sum(p.quantity) "Total Quantity" 
from forecastingheader h,forecastingproducts p where 
p.fh_id=h.id
and
h.fpfv between 
'1-OCT-'||(substr(to_char(sysdate+10,'dd-mon-yy'),8,2)+1) 
and
'31-DEC-'||(substr(to_char(sysdate+10,'dd-mon-yy'),8,2)+1)
group by drug_product_name,protocolnumber;

