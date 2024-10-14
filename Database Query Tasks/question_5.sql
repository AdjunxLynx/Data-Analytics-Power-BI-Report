SELECT category, SUM(TRIM('£' FROM product_price)::DECIMAL) AS profit, country_region

FROM orders_powerbi, dim_products, dim_stores

WHERE country_region = 'Wiltshire'
    AND EXTRACT(YEAR FROM orders_powerbi."Order Date"::DATE) = '2021'
    AND orders_powerbi.product_code = dim_products.product_code
    AND orders_powerbi."Store Code" = dim_stores."store code"

GROUP BY category, country_region
ORDER BY profit DESC