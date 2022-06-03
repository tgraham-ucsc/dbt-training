/* On: 2Jun22 - Review - 
Second iteraction; this model now depends on two other models:
customers and orders which are connected to through the ref function. 
Note that:
 - this model is better "modularized." 
 - it builds CTEs with refs
*/

-- Config model materialization as a Table: 
{{ config (materialized="table") }}

/* CTE: customers is now defined in stg_customers.sql model 
   to refer to the stg_customer.sql model, use the ref function */
with customers as (
    select * from {{ref('stg_customers')}}
),

/* Once compiled, dbt replaces the ref function with the path to the 
   materialized object. Note that the path is "developer specific:"
with customers as ( select * from DBT_TRAINING.dbt_imrodrig.stg_customers ),
The implications are: 
 - each developer materializes objets in their own development schema
 - each developer code refers to objects in their own development schema
 - all developers can have the same DEPLOYMENT schema, which will materialize their
 objects and deploy code in the production environment. 

Development credentials is defined on the dbt profile: 
dbt use these credentials to connect to your database on your behalf. Example:
AUTH METHOD ==> Username & Password
USERNAME ==>  dbt_training_01
PASSWORD ==> <hidden>
SCHEMA ==> dbt_imrodrig.  *** Each developer has their own schema.
TARGET NAME ==> default
THREADS ==> 4
*/

/* CTE: orders is now defined in stg_orders.sql model; 
    use ref function to build dependency between the two models */
orders as (
    select * from {{ref('stg_orders')}}
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
