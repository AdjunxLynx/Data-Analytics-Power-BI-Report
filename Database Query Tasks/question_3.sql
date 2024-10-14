SELECT "store_type" AS "Store Type" ,SUM(orders_powerbi."Product Quantity" * TRIM('£' FROM dim_products.product_price)::DECIMAL) AS Revenue
FROM orders_powerbi, dim_stores, dim_products
WHERE orders_powerbi."Store Code" = dim_stores."store code"
   AND EXTRACT(YEAR FROM "Order Date"::DATE)= '2022' 
GROUP BY store_type 
ORDER BY Revenue DESC
LIMIT 1