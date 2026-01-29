{{config(materialized = 'ephemeral')}}

select 
f.value:order_id:: string as order_id,
f.value:customer:: string as c_details,
f.value:amount::int as amount,
f.value:order_date::date as day
from {{source('raw','raw_json')}},lateral flatten(details) f