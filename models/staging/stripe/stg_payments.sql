with payments as (
    
    select
        id as payment_id,
        orderid as order_id,
        paymentmethod,
        status as payment_status,
        amount,
        created

    from stripe.payment
)

select * from payments