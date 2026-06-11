{% macro discount_price(extended_price, discount) %}
    ROUND({{ extended_price }} * (1 - {{ discount }}), 2)
{% endmacro %}