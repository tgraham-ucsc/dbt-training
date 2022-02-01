with payments as (
    select * from {{ ref('stg_payments') }}
),

orders as (
    select * from {{ ref('stg_orders') }}
),

payment_orders as (

    select
     orders.order_id,
     orders.customer_id,
     payments.amount

from stripe.payments

)