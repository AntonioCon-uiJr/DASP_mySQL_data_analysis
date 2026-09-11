select date_format(odr.order_purchase_timestamp, '%Y-%m') as year_mo
     , round(sum(oi.price + oi.freight_value),2) as revenue
from order_items oi
    inner join orders odr on oi.order_id = odr.order_id
group by date_format(odr.order_purchase_timestamp, '%Y-%m')
order by year_mo;
