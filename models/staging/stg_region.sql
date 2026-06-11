WITH source AS (
    SELECT * FROM {{ source('raw', 'region') }}
),
renamed AS (
    SELECT
        R_REGIONKEY AS region_id,
        R_NAME      AS name
    FROM source
)
SELECT * FROM renamed