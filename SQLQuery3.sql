--find top 10 highest reveue generating products 
select Top 10  product_id,sum(sale_price) as Sales 
from df_orders
group by product_id
order by Sales desc



--find top 5 highest selling products in each region
select region,  product_id,sum(sale_price) as Sales 
from df_orders
group by region, product_id
order by region, Sales desc

--find month over month growth comparison for 2022 and 2023 sales eg : jan 2022 vs jan 2023
WITH cte AS (
  SELECT 
    YEAR(order_date) AS order_year,
    MONTH(order_date) AS order_month,
    SUM(sale_price) AS Sales
  FROM df_orders
  GROUP BY YEAR(order_date), MONTH(order_date)
)
SELECT 
  order_month,
  SUM(CASE WHEN order_year = 2022 THEN Sales ELSE 0 END) AS sales_2022,
  SUM(CASE WHEN order_year = 2023 THEN Sales ELSE 0 END) AS sales_2023
FROM cte
GROUP BY order_month
ORDER BY order_month;


--for each category which month had highest sales 
with cte as (
Select category, format(order_date,'yyyyMM')as Order_Year_month , 
sum(sale_price) as sales 
from df_orders
group by category ,format(order_date,'yyyyMM')
--order by category ,format(order_date,'yyyyMM')
)
select * from (
select *,
row_number() over(partition by category order by sales desc) as rn
from cte
) a 
where rn=1


--which sub category had highest growth by profit in 2023 compare to 2022

WITH cte AS (
  SELECT 
    sub_category,
    YEAR(order_date) AS order_year,
 
    SUM(sale_price) AS Sales
  FROM df_orders
  GROUP BY sub_category, YEAR(order_date)
)
,cte2 as (
SELECT 
 sub_category,
  SUM(CASE WHEN order_year = 2022 THEN Sales ELSE 0 END) AS sales_2022,
  SUM(CASE WHEN order_year = 2023 THEN Sales ELSE 0 END) AS sales_2023
FROM cte
GROUP BY sub_category
)
select top 1  * 
, (sales_2023 - sales_2022)* 100/sales_2022
from cte2
order by (sales_2023 - sales_2022)* 100/sales_2022 desc


