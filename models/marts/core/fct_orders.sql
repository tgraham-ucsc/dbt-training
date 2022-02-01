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
      customers.customer_id,
      orders.order_id,
      payments.amount

from customers,
     orders,
     payments

where customers.customer_id=orders.customer_id
and   orders.order_id=payments.order_id

)

select * from customer_order_payments