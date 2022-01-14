/* Model files are just select statements..? 
Each model has a one-to-one relationshipt with a table or view 
in the data warehouse" ??? ==> this may be referencing the "output" (stg or dimentional tables)? */

/*
   Trying to create a new table in snowflake via dbt materialization
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml
*/

{{ config(materialized='table') }}

with num_completed as (
    /* list customers with completed orders */
    select c.id as userId, c.first_name|| ' ' || c.last_name as Customer, count(o.status) as num_completed
    from jaffle_shop.customers c, jaffle_shop.orders o
    where c.id = o.user_id
    and o.status = 'completed'
    group by c.id, Customer
),
   completed_orders as (
       /* list of completed orders */
        select o.id, o.user_id
        from jaffle_shop.orders o
        where o.status = 'completed'
)
select nc.Customer as Customer, nc.num_completed as num_completed, sum(p.amount) as totalAmount 
from stripe.payment p, num_completed nc, completed_orders co
where nc.userId = co.user_id
and  p.orderid = co.id
group by nc.Customer, nc.num_completed
having nc.num_completed > 1
order by nc.num_completed
