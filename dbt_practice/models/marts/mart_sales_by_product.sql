with purchases as (

    select * from {{ ref('fct_purchases') }}

),

aggregated as (

    select
        product_id,
        product_make,
        product_model,
        count_if(is_purchased) as quantity_sold,
        sum(iff(is_purchased, purchase_amount, 0)) as total_revenue,
        count_if(is_returned) as returns_count

    from purchases
    group by product_id, product_make, product_model

),

final as (

    select
        *,
        case
            when quantity_sold > 0 then returns_count / quantity_sold
            else 0
        end as return_rate

    from aggregated

)

select * from final
