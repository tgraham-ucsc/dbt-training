/* On: 2Jun22 - Review - 
First iteraction: single model, no references, no dependencies; change materialization to table to overwritte dbt_project.yml setting;
CTEs: Common Table Expressions - work as temporary result sets
Note that:
 - this model is not "modularized." It does not have a one-to-one model-table relationship.
 - it builds 4 CTEs (customers, orders, customer_orders and final)
 - as it stands, you may need to "rebuild/redefine" one of these (i.e. customers) somewhere else.
 - better would be to have a SINGLE "model for customers"
*/

-- Config model materialization as a Table: 
{{ config (materialized="table") }}

/* CTE: customers: id, first and last name */
with customers as (
    select
        id as customer_id,
        first_name,
        last_name
    from dbt_training.jaffle_shop.customers
),

/* CTE: orders: order id, user_id (customer_id), order_date, status */
orders as (
    select
        id as order_id,
        user_id as customer_id,
        order_date,
        status
    from dbt_training.jaffle_shop.orders
),
/* CTE: customer_orders */
customer_orders as (
    select
        customer_id,
        min(order_date) as first_order_date,
        max(order_date) as most_recent_order_date,
        count(order_id) as number_of_orders
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
        coalesce(customer_orders.number_of_orders, 0) as number_of_orders
    from customers

    left join customer_orders using (customer_id)

)

select * from final
