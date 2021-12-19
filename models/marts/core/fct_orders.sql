
select 
  so.order_id,
  so.customer_id,
  sp.payment_amount
from {{ ref('stg_orders') }} so
join {{ ref('stg_payments') }} sp
  on so.order_id = sp.order_id
