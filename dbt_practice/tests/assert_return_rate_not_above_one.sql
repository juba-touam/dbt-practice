-- A return rate above 100% would indicate a broken aggregation
-- (more returns than units sold for that product).

select
    product_id,
    quantity_sold,
    returns_count,
    return_rate
from {{ ref('mart_sales_by_product') }}
where return_rate > 1
