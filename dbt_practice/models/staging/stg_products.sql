with source as (

    select * from {{ source('bronze', 'products') }}

),

renamed as (

    select
        id as product_id,
        make as product_make,
        model as product_model,
        year as product_year,
        price as product_price,
        created_at,
        updated_at

    from source

)

select * from renamed
