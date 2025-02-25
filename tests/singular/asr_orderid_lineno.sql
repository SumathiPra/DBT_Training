select orderid,count(lineno) as lines
from
{{ref('fct_orders')}}
group by orderid
having not (lines>=0)
