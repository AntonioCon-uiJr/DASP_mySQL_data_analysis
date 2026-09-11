select pc.product_category_name_english as product_category
     , round(sum(oi.price + oi.freight_value),2) as revenue
from order_items oi
    inner join products prd on oi.product_id = prd.product_id
    inner join product_category_name_translation pc on pc.product_category_name = prd.product_category_name
group by pc.product_category_name_english
order by revenue DESC
limit 1;