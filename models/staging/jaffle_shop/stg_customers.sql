select id as customer_id,
    first_name,
    last_name,
    created
from {{ source('jaffle_shop', 'ld_customers') }}