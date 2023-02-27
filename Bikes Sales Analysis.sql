/****** Script for SelectTopNRows command from SSMS  ******/
SELECT *
FROM [Bike Sales]

--Checking whether queries are working efficiently or not--

select *
from [Bike Sales]
--where Product IS NULL
order by 3, 4


--Data that we are going to use--

Select Date, Product_Category, Sub_Category,  Product, Order_Quantity, Unit_Cost
FROM [Bike Sales]
order by 1, 5 desc

--Total no.of customer orders in Canada Country

Select *
FROM [Bike Sales]
Where Country LIKE 'Canada'
order by 1,2


--Total order vs Revenue
--orders that falls under 'MALE' category
select date, Customer_Gender, COUNT(Order_Quantity) as total_orders, Revenue
FROM [Bike Sales]
WHERE Customer_Gender LIKE 'M'
GROUP BY Date, Customer_Gender, Revenue

--States with Highest profits

select Product, State, MAX(cast(Profit as INT)) as Maximum_profits
from [Bike Sales]
GROUP BY Product, State
ORDER BY MAX(cast(Profit as INT)) desc


--Lowest Revenue Products in 2015

select Product, Product_Category, Sub_Category, MIN(Revenue) as Lowest_Revenue
from [Bike Sales] 
where year(Date)='2015' 
GROUP BY Product, Product_Category, Sub_Category
ORDER BY MIN(Revenue) 


--Monthly Order whose COST is highest i,e = 1

select * from 
(select MONTH,Year, Cost, Product,
row_number() over(partition by MONTH order by Cost desc) as rn
FROM [Bike Sales])B
where rn = 1
order by Year

--Using CTE trying to find AVG_Unit Price under the Age_Group of >= 18

With Unitprice 
as
(
select AVG(Unit_Price) as avg_unitprice, Customer_Age, Age_Group
FROM [Bike Sales]
WHERE Age_Group >= 18
)
 
select * 
from Unitprice

