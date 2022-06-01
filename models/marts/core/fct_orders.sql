-- CTE #1
with orders as (

    select *

    from {{ ref('stg_orders') }}

),

-- CTE #2
payments as (

    select *

    from {{ ref('stg_payments') }}

),

-- CTE #3
order_payments as (

    select
        order_id,
        sum(case
            when status = 'success' then amount
            end
        ) as amount

    from payments

    group by order_id

),

-- CTE #4
final as (

    select
        orders.order_id,
        orders.customer_id,
        orders.order_date,
        coalesce(order_payments.amount, 0) as amount

    from orders
    left join order_payments
    using (order_id)

)

-- select statement
select * from final

