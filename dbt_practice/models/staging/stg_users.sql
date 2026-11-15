with source as (

    select * from {{ source('bronze', 'users') }}

),

renamed as (

    select
        id as user_id,
        name as user_name,
        email,
        gender,
        cast(height as float) as height_m,
        weight as weight_kg,
        cast(address:city as varchar) as address_city,
        cast(address:country_code as varchar) as address_country_code,
        cast(address:postal_code as varchar) as address_postal_code,
        cast(address:state as varchar) as address_state,
        occupation,
        nationality,
        created_at,
        updated_at

    from source

)

select * from renamed
