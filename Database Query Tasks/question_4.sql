SELECT SUM(TRIM('£' FROM product_price)::DECIMAL) AS "Sale(£)",
    ROUND((SUM(TRIM('£' FROM product_price)::DECIMAL) / COUNT(*)), 3) AS "% of total sales",
    COUNT(*) AS "Orders",
    store_type AS "Store Type"
FROM dim_stores, orders_powerbi, dim_products
WHERE orders_powerbi."Store Code" = dim_stores."store code"
    AND orders_powerbi.product_code = dim_products.product_code
GROUP BY "store_type"