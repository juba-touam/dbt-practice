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
        address:city::varchar as address_city,
        address:country_code::varchar as address_country_code,
        address:postal_code::varchar as address_postal_code,
        address:state::varchar as address_state,
        occupation,
        nationality,
        created_at,
        updated_at

    from source

)

select * from renamed
