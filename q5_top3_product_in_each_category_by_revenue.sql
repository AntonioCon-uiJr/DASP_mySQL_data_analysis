with top_product_by_category as (
    select pc.product_category_name_english as product_category
    , prd.product_id
    , round(sum(oi.price + oi.freight_value), 2) as revenue
    , row_number() OVER (
        partition by pc.product_category_name_english
        order by round(sum(oi.price + oi.freight_value), 2) DESC) as rank_no
    from order_items oi
          inner join products prd on oi.product_id = prd.product_id
          inner join product_category_name_translation pc
                     on pc.product_category_name = prd.product_category_name
    group by pc.product_category_name_english, prd.product_id
    order by pc.product_category_name_english, rank_no
    )

select * from top_product_by_category
where rank_no <=3;