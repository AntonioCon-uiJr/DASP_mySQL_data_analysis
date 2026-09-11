WITH monthly_revenue AS (
    SELECT
        DATE_FORMAT(odr.order_purchase_timestamp, '%Y-%m') as year_mo,
        ROUND(SUM(oi.price + oi.freight_value),2) as revenue
    FROM order_items oi
        INNER JOIN orders odr ON oi.order_id = odr.order_id
    GROUP BY DATE_FORMAT(odr.order_purchase_timestamp, '%Y-%m')
)

SELECT mr.year_mo,
      mr.revenue,
      LAG(mr.revenue) OVER (ORDER BY mr.year_mo) AS prev_month,
      ROUND(
        ((mr.revenue / LAG(mr.revenue) OVER (ORDER BY mr.year_mo)) - 1) * 100,
        2) AS mom_change_pct
FROM monthly_revenue mr;