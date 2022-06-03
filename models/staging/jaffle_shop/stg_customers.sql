/* On: 2Jun22 - Review - 
First modularization; create a single customer representation.  change materialization to table to overwritte dbt_project.yml setting;
Second modularization: 
 - replace explicit reference to source dbt_training.jaffle_shop.customers
 - use instead the {{ source ('SOURCE_NAME','TABLE_NAME')}} function, which allows the source to be replaced seaminglessly 
 - use: from {{ source ('jaffle_shop', 'customers') }}
*/

/* CTE: customers: id, first and last name */
with customers as (
    select
        id as customer_id,
        first_name,
        last_name
    from dbt_training.jaffle_shop.customers
)

select * from customers