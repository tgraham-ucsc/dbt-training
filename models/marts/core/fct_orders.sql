with payments as (
    select * from {{ ref('stg_payments') }}
),

orders as (
    select * from {{ ref('stg_orders') }}
),



orders.order_id,
orders.customer_id,
payments.amount