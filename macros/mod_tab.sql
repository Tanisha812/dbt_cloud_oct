{% macro mod_tab_pre() %}
    current_timestamp() as updated_at
{% endmacro %} 

{% macro mod_tab(table_name, column_name, data_type) %}
    alter table {{ table_name }}
    add column if not exists {{ column_name }} {{ data_type }};
{% endmacro %}

{% macro mod_tab_update(table_name, column_name, value_expr) %}
    update {{ table_name }}
    set {{ column_name }} = {{ value_expr }};
{% endmacro %}

