{% macro current_timestamp_kl() %}
    CONVERT_TIMEZONE('Asia/Kuala_Lumpur', CURRENT_TIMESTAMP())
{% endmacro %}