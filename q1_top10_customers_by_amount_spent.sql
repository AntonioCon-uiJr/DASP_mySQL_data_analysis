select cus.customer_unique_id
     , round(sum(op.payment_value),2) as total_spent
from customers cus
    inner join orders odr on cus.customer_id = odr.customer_id
    inner join order_payments op on odr.order_id = op.order_id
group by cus.customer_unique_id
order by total_spent desc
limit 10;