/* On: 2Jun22 - Review - 
Third iteraction: add a lifetime_value field.
*/

/* CTE: customers is now defined in stg_customers.sql model 
   to refer to the stg_customer.sql model, use the ref function */
with customers as (
    select * from {{ref('stg_customers')}}
),

/* CTE: orders is now defined in fct_orders.sql model; 
fct_orders comes with the total already paid for the order*/
orders as (
    select * from {{ref('fct_orders')}}
),

/* CTE: customer_orders */
customer_orders as (
    select
        customer_id,
        min(order_date) as first_order_date,
        max(order_date) as most_recent_order_date,
        count(order_id) as number_of_orders,
        sum(amount) as lifetime_value
    from orders
    group by 1
),

/* CTE: final: customer id, name, lastname, first order, most recent order, number of orders (0 if no orders) */
final as (
    select
        customers.customer_id,
        customers.first_name,
        customers.last_name,
        customer_orders.first_order_date,
        customer_orders.most_recent_order_date,
        coalesce(customer_orders.number_of_orders, 0) as number_of_orders, 
        customer_orders.lifetime_value
    from customers

    left join customer_orders using (customer_id)

)

select * from final
