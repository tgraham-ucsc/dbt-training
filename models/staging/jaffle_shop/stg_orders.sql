-- Create stg_orders model for dbt_training.jaffle_shop.orders

select 
    id as order_id,
    user_id as customer_id,
    order_date,
    status

from {{ source('jaffle_shop', 'orders') }}