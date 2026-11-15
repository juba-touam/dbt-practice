-- A return can only happen after the purchase itself.
-- This test fails if it finds any row violating that rule.

select
    purchase_id,
    purchased_at,
    returned_at
from {{ ref('stg_purchases') }}
where returned_at is not null
  and purchased_at is not null
  and returned_at < purchased_at
