with unique_customers as (
    select cus.customer_unique_id
        , if(count(odr.order_id) > 1, 1, 0) as repeat_tag
        , if(count(odr.order_id) > 1, 0, 1) as one_time_tag
    from customers cus
        inner join orders odr on cus.customer_id = odr.customer_id
    group by cus.customer_unique_id
)
SELECT sum(repeat_tag)   as no_of_repeat_customers
     , sum(one_time_tag) as no_of_one_time_buyers
from unique_customers;