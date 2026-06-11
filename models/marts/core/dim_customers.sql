{{ config(materialized = 'table') }}

SELECT
    c.customer_id,
    c.customer_name,
    c.market_segment,
    c.account_balance,
    c.phone,
    n.name AS nation,
    r.name AS region
FROM {{ ref('stg_customer') }} c
LEFT JOIN {{ ref('stg_nation') }} n ON c.nation_id  = n.nation_id
LEFT JOIN {{ ref('stg_region') }} r ON n.region_id  = r.region_id