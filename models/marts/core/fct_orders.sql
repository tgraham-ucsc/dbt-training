with orders as (
         select * from {{ ref('stg_orders') }}
     ),
     payments as (
         select * from {{ ref('stg_payments')}}
     ),
 fact_orders as (
    select
        orders.order_id,
        orders.customer_id,
        payments.amount
    from orders
    left join payments using (order_id)
    order by 2, 1
)

select * from fact_orders