--This is a data cleaning project, and the dataset used was obtained from Kaggle.com. 
-- The dataset used looks at customer purchases.


--Ensuring the dataset was correctly uploaded
SELECT *
FROM PortfolioProject..ecommerce_customer_data_large

-- Proceeding to removing unnessary columns

ALTER TABLE PortfolioProject..ecommerce_customer_data_large
DROP COLUMN Age, Churn

--Now changing the date format to date insteaf of date and time
ALTER TABLE PortfolioProject..ecommerce_customer_data_large
ALTER COLUMN Purchase_Date Date;

-- Adding Currency to the Product Price column

SELECT CONCAT ('$', Product_Price) AS formatted_currency 
FROM  PortfolioProject..ecommerce_customer_data_large

-- Looking at the total purchase price per individual 

SELECT Customer_ID, (CONCAT ('$',SUM(Product_price))) AS calculated_total_price
FROM PortfolioProject..ecommerce_customer_data_large
GROUP BY Customer_ID

--Summarizing all the data into 1 new table view

CREATE VIEW CustomerPurchaseSummary AS
SELECT 
	customer_ID, 
	customer_name, 
	Gender, 
	customer_age,
	(CONCAT ('$',SUM(Total_purchase_amount))) AS total_purchase

FROM PortfolioProject..ecommerce_customer_data_large
GROUP BY
	customer_ID, 
	customer_name, 
	Gender, 
	customer_age;