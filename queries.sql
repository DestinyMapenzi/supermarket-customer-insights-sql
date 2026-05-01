--===========================
--01: Peak Purchasing Time
--===========================
--What is the peak purchasing time?
SELECT
EXTRACT (HOUR FROM SAFE. PARSE_TIME ('%H:%M', Time)) AS Hour,
COUNT (*) AS Purchases, SUM (Total) AS Revenue
FROM `Supermarketsales.Supermarket sales`
GROUP BY Hour
ORDER BY Purchases DESC;
--Peaks ales occur at hour 19, which means that customers are most active around 7PM in the evening


--=============================
--02: Customer Type Analysis
--=============================
--Which customers are more likely to purchase, members or non members.

SELECT `Customer type`, COUNT(*)AS Total_Transactions, SUM(Total) AS Total_Revenue, AVG(Total) AS Avg_spend_per_trnsaction, SUM (`gross income`) AS Total_Profit, AVG(`gross income`) AS Avg_profit_per_transaction
FROM `project-11d08a4f-39cd-41a3-b46.Supermarketsales.Supermarket sales`
GROUP BY `Customer type`;

--Despite nearly equal transaction counts between members and non-members, members generate higher total revenue and profit,this makes them the more valuable customer group.


--==================================
--03: Customer Rating Consistency
--==================================
--How does the various factors affecting how the customers rate their overall experience
--Factors considered, Payment method, Product line, Quantity of items purchased, Branch, Gender and a combination of City and Payment method.
SELECT Payment, COUNT(*) AS total_transactions,AVG(Rating) AS avg_rating
FROM `Supermarketsales.Supermarket sales`
GROUP BY Payment
ORDER BY avg_rating DESC;

SELECT `Product line`, COUNT(*) AS totals_per_productline, AVG(Rating) AS avg_rating
FROM `Supermarketsales.Supermarket sales`
GROUP BY `Product line`
ORDER BY avg_rating DESC;

SELECT Quantity ,COUNT (*) AS total_quantities, AVG(Rating) AS avg_rating
FROM `Supermarketsales.Supermarket sales`
GROUP BY Quantity
ORDER BY avg_rating DESC;

SELECT 'Branch', COUNT(*) AS totals_per_branch, AVG(Rating) AS avg_rating
FROM `Supermarketsales.Supermarket sales`
GROUP BY Branch
ORDER BY avg_rating DESC;


SELECT 'Gender', COUNT(*) AS totals_genders, AVG(Rating) AS avg_rating
FROM `Supermarketsales.Supermarket sales`
GROUP BY Gender
ORDER BY avg_rating DESC;

SELECT *
FROM `Supermarketsales.Supermarket sales`
WHERE Rating=(SELECT MAX(Rating)FROM `Supermarketsales.Supermarket sales`);

SELECT City, Payment, COUNT(*) AS total_transactions, AVG(Rating) AS avg_rating
FROM `Supermarketsales.Supermarket sales`
GROUP BY City, Payment
ORDER BY avg_rating DESC;

--Customer ratings remain consistent across all factors(Payment method,Product line,Quantity,Branch, Gender and city and payment method combined), averaging about 7/10. This indicates a stable but moderate customer experience across all supermarkets.


--=============================
--04: Product lines Analysis
--=============================
--Which are the dominating product lines per sales
SELECT `Product line`,COUNT(*) AS total_transactions,SUM(Total) AS total_revenue,SUM(`Gross income`) AS total_profit,
  AVG(Rating) AS avg_rating
FROM `Supermarketsales.Supermarket sales`
GROUP BY `Product line`
ORDER BY total_transactions DESC;

--Product demand is fairly balanced across categories, with Fashion accessories highest and Health and Beauty lowest, indicating no dominant product line.


--==============================
--05: Branch and City Analysis
--==============================
--Which branch and city do customers purchase mostly from
SELECT 
  Branch,
  City,
  COUNT(*) AS total_transactions,
  SUM(Total) AS total_revenue,
  SUM(`Gross income`) AS total_profit,
  AVG(Rating) AS avg_rating
FROM `Supermarketsales.Supermarket sales`
GROUP BY Branch, City
ORDER BY total_transactions DESC;

--Branch A(Yangon) records the highest activity (340), Branch B (Mandalay,332) and Branch C (Naypyitaw,328), although slightly stronger performance in Yangon, still overall fairly balanced branch performance.


