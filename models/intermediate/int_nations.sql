{{ config(
    materialized='incremental',
    unique_key='nation_id',
    on_schema_change='sink_all_columns'
) }}

with nation as (
    select 
     n_region_id,
      nation_id,
       name,
       jodo_col,
       comment,
       updated_at
       from {{ref('stg_nations')}} 
       {% if is_incremental() %}
       where updated_at > coalesce((select max(updated_at) from {{ this }}), '1900-01-01')
       {% endif %}
)
select * from nation