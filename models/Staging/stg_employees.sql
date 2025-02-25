{{config (materialized='table')}}
--, transient = false, post_hook = 'create table stg_employees_test clone stg_employees1;'

select *  from
{{source('qwt_raw','raw_employee')}}