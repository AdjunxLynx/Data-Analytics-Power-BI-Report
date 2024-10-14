SELECT SUM(orders_powerbi."Product Quantity" * TRIM('£' FROM dim_products.product_price)::DECIMAL) AS Revenue,
CASE
   WHEN Extract(MONTH FROM orders_powerbi."Order Date"::DATE) = '1' THEN 'January'
   WHEN Extract(MONTH FROM orders_powerbi."Order Date"::DATE) = '2' THEN 'February'
   WHEN Extract(MONTH FROM orders_powerbi."Order Date"::DATE) = '3' THEN 'March'
   WHEN Extract(MONTH FROM orders_powerbi."Order Date"::DATE) = '4' THEN 'April'
   WHEN Extract(MONTH FROM orders_powerbi."Order Date"::DATE) = '5' THEN 'May'
   WHEN Extract(MONTH FROM orders_powerbi."Order Date"::DATE) = '6' THEN 'June'
   WHEN Extract(MONTH FROM orders_powerbi."Order Date"::DATE) = '7' THEN 'July'
   WHEN Extract(MONTH FROM orders_powerbi."Order Date"::DATE) = '8' THEN 'August'
   WHEN Extract(MONTH FROM orders_powerbi."Order Date"::DATE) = '9' THEN 'September'
   WHEN Extract(MONTH FROM orders_powerbi."Order Date"::DATE) = '10' THEN 'October'
   WHEN Extract(MONTH FROM orders_powerbi."Order Date"::DATE) = '11' THEN 'November'
   WHEN Extract(MONTH FROM orders_powerbi."Order Date"::DATE) = '12' THEN 'December'
END as "Month"
FROM orders_powerbi, dim_products
WHERE orders_powerbi.product_code = dim_products.product_code
AND EXTRACT(YEAR FROM orders_powerbi."Order Date"::DATE) = '2022'
GROUP BY "Month"
ORDER BY Revenue DESC
LIMIT 1