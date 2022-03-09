select
    orders.order_id,
    orders.customer_id,
    sum(payments.dollar_amount) as dollars
from {{ ref('stg_orders') }} orders
left join {{ ref('stg_payments') }} payments
where orders.order_id = payments.order_id
group by orders.order_id, orders.customer_id