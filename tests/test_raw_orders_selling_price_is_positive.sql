with
orders as (
    select * from {{ ref('raw_orders') }}
)

select
    ORDERID,
    sum(ordersellingprice) as total_sp
from orders
group by ORDERID
having total_sp<0