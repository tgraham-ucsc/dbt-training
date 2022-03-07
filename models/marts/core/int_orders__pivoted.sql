{%- set get_payment_methods -%}
    select distinct payment_method from {{ ref('stg_payments') }}
{%- endset -%}

{%- set results = run_query(get_payment_methods) -%}

{%- if execute -%}
{# Return the first column #}
{%- set results_list = results.columns[0].values() -%}
{% else %}
{% set results_list = [] %}
{%- endif -%}

with payments as (

    select * from {{ ref('stg_payments') }}

),

pivioted as (

    select order_id,
    {%- for payment_method in results_list -%}
           sum(case when payment_method = '{{ payment_method }}' then payment_amount else 0 end ) as {{ payment_method }}_amount
        {%- if not loop.last -%}
           ,
        {%- endif %}
     {% endfor -%}   
    from payments
    where payment_status = 'success'
    group by 1

)

select * from pivioted