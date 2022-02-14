with customers as (

    select
        id as customer_id,
        first_name,
        last_name

    from dbt_training.jaffle_shop.customers

)
Select * from customers