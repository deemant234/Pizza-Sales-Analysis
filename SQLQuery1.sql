select * from [Pizza DB].dbo.pizza_sales;

SELECT SUM(total_price)AS Total_Revenue from [Pizza DB].dbo.pizza_sales ;

 SELECT SUM(total_price) / (COUNT(DISTINCT(order_id))) AS Avg_Order_Value FROM [Pizza DB].dbo.pizza_sales ;


 SELECT SUM(quantity)AS Total_Pizza_Sold FROM [Pizza DB].dbo.pizza_sales  ;


 SELECT COUNT(DISTINCT(order_id)) AS Total_Orders FROM [Pizza DB].dbo.pizza_sales ;


 --Average Pizza Per Order : number of pizzas sold / number of orders 
 SELECT CAST(CAST(SUM(quantity)AS decimal(10,2)) /
 CAST(COUNT(DISTINCT(order_id))AS decimal(10,2))AS decimal(10,2))AS Avg_Pizzas_Per_Order FROM [Pizza DB].dbo.pizza_sales ;


 --Daily Trend for Orders 
SELECT DATENAME(DW ,order_date)AS order_day,COUNT(DISTINCT(order_id)) AS Total_Orders FROM [Pizza DB].dbo.pizza_sales 
GROUP BY DATENAME(DW , order_date) ;

--Monthly Trend For Total Orders 
SELECT DATENAME(MONTH,order_date) AS month_name , COUNT (DISTINCT(order_id)) AS Total_Orders
FROM [Pizza DB].dbo.pizza_sales 
GROUP BY DATENAME(MONTH,order_date)
ORDER BY Total_Orders DESC ;


-- Perncentage Of Sales By Pizza Catgory  Month Wise
SELECT pizza_category ,SUM(total_price) AS Total_Sales, SUM(total_price) * 100 / (SELECT SUM(total_price) FROM [Pizza DB].dbo.pizza_sales WHERE MONTH(order_date)=1) AS PCT 
FROM [Pizza DB].dbo.pizza_sales 
WHERE MONTH(order_date) = 1
GROUP BY pizza_category ;


-- Percentage Of Sales By Pizza Category 
SELECT pizza_category ,SUM(total_price) AS Total_Sales, SUM(total_price) * 100 / (SELECT SUM(total_price) FROM [Pizza DB].dbo.pizza_sales) AS PCT 
FROM [Pizza DB].dbo.pizza_sales 
GROUP BY pizza_category ;


--Percentage of Sales by pizza size 
SELECT pizza_size ,CAST(SUM(total_price)AS decimal(10,2)) AS Total_Sales, CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) FROM [Pizza DB].dbo.pizza_sales )AS decimal(10,2)) AS PCT 
FROM [Pizza DB].dbo.pizza_sales 
WHERE DATEPART(QUARTER,order_date)=1 
GROUP BY pizza_size
ORDER BY PCT DESC ;

--Top 5 pizzas By Revenue
SELECT TOP 5 pizza_name , SUM(total_price)AS Total_Revenue FROM [Pizza DB].dbo.pizza_sales 
GROUP BY pizza_name 
ORDER BY Total_Revenue DESC  ;

--Bottom 5 pizza by Revenue
SELECT TOP 5 pizza_name , CAST(SUM(total_price)AS DECIMAL(10,2)) AS Total_Revenue FROM [Pizza DB].dbo.pizza_sales 
GROUP BY pizza_name 
ORDER BY Total_Revenue ASC  ;

--Top 5 pizza by quantity 
SELECT TOP 5 pizza_name , SUM(quantity)AS Total_Quantiy FROM [Pizza DB].dbo.pizza_sales 
GROUP BY pizza_name 
ORDER BY Total_Quantiy DESC  ;


--Bottom 5 pizza by quantity month wise

SELECT TOP 5 pizza_name , SUM(quantity)AS Total_Quantiy FROM [Pizza DB].dbo.pizza_sales 
WHERE MONTH(order_date)=8
GROUP BY pizza_name 
ORDER BY Total_Quantiy ASC  ;


 