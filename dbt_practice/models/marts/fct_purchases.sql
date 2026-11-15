with purchases as (

    select * from {{ ref('stg_purchases') }}

),

users as (

    select * from {{ ref('stg_users') }}

),

products as (

    select * from {{ ref('stg_products') }}

),

joined as (

    select
        purchases.purchase_id,
        purchases.user_id,
        users.user_name,
        users.nationality,
        users.gender,
        purchases.product_id,
        products.product_make,
        products.product_model,
        products.product_price as purchase_amount,
        purchases.added_to_cart_at,
        purchases.purchased_at,
        purchases.returned_at,
        purchases.purchased_at is not null as is_purchased,
        purchases.returned_at is not null as is_returned

    from purchases
    left join users on purchases.user_id = users.user_id
    left join products on purchases.product_id = products.product_id

)

select * from joined
