/* Model files are just select statements..? */

/*
   Trying to create a new table in snowflake via dbt materialization
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml
*/

{{ config(materialized='table') }}

with num_returns as (
    /* list customers with returned orders */
    select c.id as userId, c.first_name|| ' ' || c.last_name as Customer, count(o.status) as num_returns
    from jaffle_shop.customers c, jaffle_shop.orders o
    where c.id = o.user_id
    and o.status = 'returned'
    group by c.id, Customer
),
   return_orders as (
       /* list of returned orders */
        select o.id, o.user_id
        from jaffle_shop.orders o
        where o.status = 'returned'
)
select nr.Customer as Customer, nr.num_returns as num_returns, sum(p.amount) as totalAmount 
from stripe.payment p, num_returns nr, return_orders ro
where nr.userId = ro.user_id
and  p.orderid = ro.id
group by nr.Customer, nr.num_returns

