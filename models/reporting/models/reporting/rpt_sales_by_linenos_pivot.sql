{{config(materialized='view', schema='reporting_dev')}}
 
{% set v_linenumbers =[1,2,3] -%} 
SELECT orderid,
/*{}*/
{%for linenumber in v_linenumbers %}

sum(case when lineno = {{linenumber}} then linesalesamount end ) as lineno{{(linenumber)}}_sales,
 
{% endfor %}
/*sum(case when LINENO =1 then linesalesamount end ) line1_sales,
sum(case when LINENO =2 then linesalesamount end ) line2_sales,
sum(case when LINENO =3 then linesalesamount end ) line3_sales,*/
sum(linesalesamount) as total_sales
from
{{ref('fct_orders')}}
group by orderid