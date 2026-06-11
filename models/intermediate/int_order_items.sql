WITH orders AS (
    SELECT * FROM {{ ref('stg_orders') }}
),
lineitems AS (
    SELECT * FROM {{ ref('stg_lineitem') }}
),
joined AS (
    SELECT
        o.order_id,
        o.customer_id,
        o.order_date,
        o.status,
        o.priority,
        l.line_number,
        l.quantity,
        l.extended_price,
        l.discount,
        l.tax,
        l.ship_date,
        l.extended_price * (1 - l.discount)               AS net_price,
        l.extended_price * (1 - l.discount) * (1 + l.tax) AS gross_price
    FROM orders o
    JOIN lineitems l ON o.order_id = l.order_id
)
SELECT * FROM joined