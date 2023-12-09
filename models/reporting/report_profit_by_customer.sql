select
    coustomerid,
    segment,
    country,
    sum(orderprofit) as profit
from {{ ref('stg_orders') }}
group by
    coustomerid,
    segment,
    country
