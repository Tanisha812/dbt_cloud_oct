{{ config(
    materialized='incremental',
    tags='sample') }}

with supplier as (
    select *
    from {{ ref('stg_suppliers') }}
),

nation as (
    select *
    from {{ ref('stg_nations') }}
),

region as (
    select *
    from {{ ref('stg_regions') }}
)

select 
    s.supplier_id,
    s.supplier_name,
    s.account_balance,
    s.phone_number,
    s.supplier_address,
    n.name as nation,
    r.name as region,
    s.updated_time as supplier_updated_time,
    {{ dbt_meta()}}
from supplier s
join nation n
    on s.nation_id = n.nation_id
join region r
    on n.region_id = r.region_id
