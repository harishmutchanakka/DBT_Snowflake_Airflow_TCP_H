WITH source AS (
    SELECT * FROM {{ source('raw', 'orders') }}
),
renamed AS (
    SELECT
        O_ORDERKEY      AS order_id,
        O_CUSTKEY       AS customer_id,
        O_ORDERSTATUS   AS status,
        O_TOTALPRICE    AS total_price,
        O_ORDERDATE     AS order_date,
        O_ORDERPRIORITY AS priority,
        O_CLERK         AS clerk,
        O_COMMENT       AS comment
    FROM source
)
SELECT * FROM renamed