with payments as (

    select 
        id as payment_id,
        orderid as order_id,
        paymentmethod as payment_method,
        status as payment_status,
        amount as payment_amount,
        created as created_at
    from dbt_training.stripe.payment
)

select * from payments