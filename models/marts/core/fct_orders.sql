with customers as (
    select * from {{ ref('stg_customers')}}
),

orders as (
    select * from {{ ref('stg_orders') }}
),

payments as (
    select * from {{ ref('stg_payments') }}
),



customer_order_payments as (

    select
     orders.order_id,
     customers.customer_id,
     payments.amount

from customers,
     orders,
     payments

where customers.customers_id=orders.customer_id
and   orders.order_id=payments.order_id

)