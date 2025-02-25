{{config(materialized = 'table', schema =env_var('DBT_TRANSFORMSCHEMA', 'TRANSFORMING_DEV'))}}


{% set v_min_order_dt = get_min_order_date() %}
{% set v_max_order_dt = get_max_order_date() %}

{{ dbt_date.get_date_dimension(v_min_order_dt, v_max_order_dt) }}