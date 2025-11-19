{% macro generate_schema_name(custome_schema_name,node) -%}
    {%- set default_schema=target.schema -%}
    {%- if custom_schema_name is not none -%}
        {{ defult_schema }}
    {%- else -%}
        {{ custome_schema_name }}
    {%- endif -%}
{%- endmacro %}   