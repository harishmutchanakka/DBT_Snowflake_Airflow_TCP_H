{{ config(
    materialized = 'incremental',
    unique_key   = 'order_id'
) }}

WITH order_items AS (
    SELECT * FROM {{ ref('int_order_items') }}
    {% if is_incremental() %}
        WHERE order_date > (SELECT MAX(order_date) FROM {{ this }})
    {% endif %}
),
aggregated AS (
    SELECT
        order_id,
        customer_id,
        order_date,
        status,
        priority,
        SUM(net_price)              AS total_net_revenue,
        SUM(gross_price)            AS total_gross_revenue,
        COUNT(DISTINCT line_number) AS total_line_items,
        SUM(quantity)               AS total_quantity,
        MIN(ship_date)              AS first_ship_date,
        MAX(ship_date)              AS last_ship_date,
        SUM(extended_price)         AS total_extended_price,
        AVG(discount)               AS avg_discount
    FROM order_items
    GROUP BY 1, 2, 3, 4, 5
)
SELECT
    order_id,
    customer_id,
    order_date,
    status,
    priority,
    total_net_revenue,
    total_gross_revenue,
    total_line_items,
    total_quantity,
    first_ship_date,
    last_ship_date,
    {{ discount_price('total_extended_price', 'avg_discount') }} AS avg_discounted_price,
    {{ current_timestamp_kl() }}                                  AS loaded_at
FROM aggregated