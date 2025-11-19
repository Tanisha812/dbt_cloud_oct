{% macro full_name(first, last) %}
    {{ first }} || ' ' || {{ last }}
{% endmacro %}

{% macro gender_label(gender) %}
    case upper({{ gender }})
        when 'F' then 'Female'
        when 'M' then 'Male'
        else 'Other'
    end
{% endmacro %}

{% macro formatted_phone(phone) %}
    '(' || substring({{ phone }},1,3) || ') ' ||
    substring({{ phone }},4,3) || '-' ||
    substring({{ phone }},7,4)
{% endmacro %}

{% macro age_group(age) %}
    case
        when {{ age }} < 30 then 'Youngest'
        when {{ age }} between 30 and 60 then 'Middle'
        else 'Senior'
    end
{% endmacro %}


{% macro name_and_gender(first, last, gender) %}
    {{ first }} || ' ' || {{ last }} as employee_name,
    case upper({{ gender }})
        when 'F' then 'Female'
        when 'M' then 'Male'
        else 'Other'
    end as gender_label
{% endmacro %}

{% macro employee_transforms(first, last, gender, phone, age) %}
    {{ first }} || ' ' || {{ last }} as employee_name,
    case upper({{ gender }})
        when 'F' then 'Female'
        when 'M' then 'Male'
        else 'Other'
    end as gender_label,
    '(' || substring({{ phone }},1,3) || ') ' ||
    substring({{ phone }},4,3) || '-' ||
    substring({{ phone }},7,4) as formatted_phone,
    case
        when {{ age }} < 30 then 'Youngest'
        when {{ age }} between 30 and 60 then 'Middle'
        else 'Senior'
    end as age_group
{% endmacro %}
