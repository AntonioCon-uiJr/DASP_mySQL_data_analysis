with customer_spending as (
    select cus.customer_id
         , round(sum(op.payment_value),2) as total_spent
    from customers cus
        inner join orders odr on cus.customer_id = odr.customer_id
        inner join order_payments op on odr.order_id = op.order_id
    group by cus.customer_id
    ),

    customer_segments as (
    select cs.customer_id
        , cs.total_spent
        , ntile(5) over(order by cs.total_spent) as spending_tile
    FROM customer_spending cs
    )

select csg.customer_id
    , csg.total_spent
    , case csg.spending_tile
        when 1 then "Low"
        when 5 then "High"
      else "Medium" end as spending_segment
from customer_segments csg
order by csg.total_spent desc;