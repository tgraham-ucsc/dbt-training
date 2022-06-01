-- Create dim_customer model using stg_customers and stg_orders

-- CTE #1
with customers as (
    
    select * from {{ ref('stg_customers') }}

),

-- CTE #2
orders as (

    select * from {{ ref('fct_orders') }}

),

-- CTE #3
customer_orders as (

    select
        customer_id,
        min(order_date) as first_order_date,
        max(order_date) as most_recent_order_date,
        count(order_id) as number_of_orders,
        sum(amount) as lifetime_value

    from orders

    group by customer_id

),

-- CTE #4
final as (

    select 
        customers.customer_id,
        customers.first_name,
        customers.last_name,
        customer_orders.first_order_date,
        customer_orders.most_recent_order_date,
        coalesce(customer_orders.number_of_orders, 0) as number_of_orders,
        -- replace NULL values with 0
        customer_orders.lifetime_value

    from customers
    left join customer_orders
        using(customer_id)
        -- on customers.customer_id = customer_orders.customer_id

)

-- select statement

select * from final
