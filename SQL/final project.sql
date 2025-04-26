-- TOTAL SALES

select sum(SalesAmount) as total_sales from sales;

-- TOTAL PROFIT

select sum(profit) as Total_Profit from sales;

-- Total Order Quantity

select sum(OrderQuantity) as Total_Order_Quantity from sales;

-- Total Customers
SELECT count(CustomerKey) as Total_Customer from customer;

-- MONTHWISE SALES

SELECT
	OrderdateMonthName AS Month,
    sum(SalesAmount) as sales
FROM
	sales
GROUP BY 
	OrderdateMonthName
ORDER BY 
	MIN(OrderdateMonthNo);
    
-- YEARWISE SALES

SELECT
	OrderDateYear as Year,
    sum(SalesAmount) as Total_Sales
FROM
	sales
GROUP BY
	OrderDateYear
order by
	OrderDateYear;
    
-- QUARTERWISE SALES

SELECT 
    OrderdateQuarter AS Quarter,
    SUM(SalesAmount) AS Sales
FROM 
	Sales
GROUP BY 
	OrderdateQuarter
ORDER by
	OrderdateQuarter;

-- TOTAL SALES AMOUNT AND PRODUCTION COST 

SELECT 
    OrderdateYear AS Year,
    SUM(SalesAmount) AS Total_Sales,
    SUM(ProductionCost) AS Total_ProductionCost
FROM Sales
GROUP BY 
	OrderdateYear
order by 
	orderdateyear;
    
-- Top 10 Customers

SELECT 
    Customerfullname AS Customer,
    SUM(SalesAmount) AS TotalSales
FROM
    Sales
GROUP BY 
    Customerfullname
ORDER BY 
    TotalSales DESC
LIMIT 10;

-- Yearly Profit Margin

SELECT 
    OrderDateYear AS Year,
    SUM(Profit) AS TotalProfit,
    SUM(SalesAmount) AS TotalSales,
    (SUM(Profit) / SUM(SalesAmount)) * 100 AS ProfitMargin
FROM 
    Sales
GROUP BY 
    OrderDateYear
ORDER BY 
    Year;

-- Average Order Value (AOV)

SELECT AVG(SalesAmount) AS AverageOrderValue FROM Sales;

-- Yearly average income by customer 
SELECT CustomerKey, FullName, YearlyIncome
FROM customer
WHERE YearlyIncome > (SELECT AVG(YearlyIncome) 
                      FROM customer);
                      
-- avg stock level by products

SELECT ProductKey, ProductName, SafetyStockLevel
FROM product
WHERE SafetyStockLevel < (
    SELECT AVG(SafetyStockLevel)
    FROM product
);

-- Total Sales by Region

SELECT 
    st.SalesTerritoryRegion AS Region,
    SUM(s.SalesAmount) AS TotalSales
FROM 
    Sales s
JOIN 
    SalesTerritory st
ON 
    s.SalesTerritoryKey = st.SalesTerritoryKey
GROUP BY 
    st.SalesTerritoryRegion
ORDER BY 
    TotalSales ASC;

-- Sales by Country

SELECT 
    st.SalesTerritoryCountry AS Country,
    SUM(s.SalesAmount) AS TotalSales
FROM 
    Sales s
JOIN 
    SalesTerritory st
ON 
    s.SalesTerritoryKey = st.SalesTerritoryKey
GROUP BY 
    st.SalesTerritoryCountry
ORDER BY 
    TotalSales DESC;