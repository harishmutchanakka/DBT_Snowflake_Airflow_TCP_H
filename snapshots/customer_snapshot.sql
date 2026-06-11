{% snapshot customer_snapshot %}

  {{ config(
      target_schema = 'snapshots',
      unique_key    = 'customer_id',
      strategy      = 'check',
      check_cols    = ['account_balance', 'market_segment'],
  ) }}

  SELECT
      customer_id,
      customer_name,
      market_segment,
      account_balance,
      nation,
      region
  FROM {{ ref('dim_customers') }}

{% endsnapshot %}