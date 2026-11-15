with source as (

    select * from {{ source('bronze', 'purchases') }}

),

renamed as (

    select
        id as purchase_id,
        user_id,
        product_id,
        added_to_cart_at,
        purchased_at,
        returned_at,
        created_at,
        updated_at

    from source

)

select * from renamed
