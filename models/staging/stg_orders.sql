select
-- from raw orders
o.orderid,
o.orderdate,
o.shipdate,
o.shipmode,
o.ordersellingprice - ordercostprice as orderprofit,
o.ordercostprice,
o.ordersellingprice,
--from raw customer
c.coustomerid,
c.coustomername,
c.segment,
c.country,
--from raw product
p.productid,
p.category,
p.productname,
p.subcategory,
{{ markup('ordersellingprice','ordercostprice') }} as markup
from {{ ref('raw_orders') }} as o
left join {{ ref('raw_customer') }} as c
on o.customerid = c.coustomerid
left join {{ ref('raw_product') }} as p
on o.productid = p.productid

{{ limit_data_in_dev('orderdate')}}