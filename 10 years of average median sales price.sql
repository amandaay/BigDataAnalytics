SELECT
    EXTRACT(YEAR FROM period_begin) AS sale_year,
    property_type,
    state,
    ROUND(AVG(median_sale_price), 0) AS avg_median_sale_price
FROM 
    `plenary-totem-417202.redfin.redfin` 
WHERE 
    period_begin >= DATE_SUB(CURRENT_DATE(), INTERVAL 5 YEAR)
    AND period_end <= CURRENT_DATE()
GROUP BY 
    state, property_type, sale_year
ORDER BY 
    state ASC, sale_year ASC;
