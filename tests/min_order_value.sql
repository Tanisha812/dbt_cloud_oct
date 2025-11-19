with orders as (
    select *
    from analytics.tanisha.stg_orders
)

select order_id, total_price
from orders
where total_price <= 900