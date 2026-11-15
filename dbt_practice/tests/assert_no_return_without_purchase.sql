-- A product can only be returned if it was actually purchased first.
-- This test fails if it finds a return with no corresponding purchase.

select
    purchase_id,
    purchased_at,
    returned_at
from {{ ref('fct_purchases') }}
where is_returned
  and not is_purchased
