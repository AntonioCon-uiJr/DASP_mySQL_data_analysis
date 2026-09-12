-- Cumulative % of revenue by product category (Pareto Analysis)
with product_category_revenue as (
    select pc.product_category_name_english as product_category
        , round(sum(oi.price + oi.freight_value),2) as revenue
    from order_items oi
        inner join products prd on oi.product_id = prd.product_id
        inner join product_category_name_translation pc on pc.product_category_name = prd.product_category_name
    group by pc.product_category_name_english
    )
, product_category_revenue_pct as (
    select product_category
        , revenue
        , round(revenue / sum(revenue) over() * 100, 2) as revenue_pct
    from product_category_revenue
)
select product_category
    , revenue
    , revenue_pct
    , round(sum(revenue_pct) over(order by revenue desc),2) as cumulative_pct
from product_category_revenue_pct
order by revenue desc
limit 5
;


-- What are the leading product categories purchased by customers in each spending tier? 
with customer_spending as (
    select cus.customer_id
         , round(sum(op.payment_value),2) as total_spent
    from customers cus
        inner join orders odr on cus.customer_id = odr.customer_id
        inner join order_payments op on odr.order_id = op.order_id
    group by cus.customer_id
    )

,   customer_segments as (
    select cs.customer_id
        , cs.total_spent
        , case ntile(5) over(order by cs.total_spent)
            when 1 then "Low"
            when 5 then "High"
          else "Medium" end as spending_segment
    FROM customer_spending cs
    )

,   spend_seg_by_category as (
    select cs.spending_segment
        , pc.product_category_name_english as product_category
        , round(sum(oi.price + oi.freight_value),2) as revenue
        , row_number() over (
            partition by cs.spending_segment
            order by round(sum(oi.price + oi.freight_value),2) DESC
            ) as rank_no
    from customer_segments cs
        inner join orders odr on cs.customer_id = odr.customer_id
        inner join order_items oi on odr.order_id = oi.order_id
        inner join products prd on oi.product_id = prd.product_id
        inner join product_category_name_translation pc on pc.product_category_name = prd.product_category_name
    group by cs.spending_segment, product_category
)
select * from spend_seg_by_category where rank_no <= 3;

