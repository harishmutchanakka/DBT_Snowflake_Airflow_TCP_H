WITH source AS (
    SELECT * FROM {{ source('raw', 'nation') }}
),
renamed AS (
    SELECT
        N_NATIONKEY AS nation_id,
        N_NAME      AS name,
        N_REGIONKEY AS region_id
    FROM source
)
SELECT * FROM renamed