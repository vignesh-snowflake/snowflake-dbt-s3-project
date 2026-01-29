{{ config(
    materialized = 'incremental',
    unique_key = 'order_id',
    incremental_strategy = 'merge',

) }}

SELECT
  order_id,
  c_details,
  amount,
  day
FROM {{ ref('query1') }}

{% if is_incremental() %}
  -- Only load new or updated records
  WHERE day >= (SELECT max(day) 
    FROM {{ this }})
{% endif %}
