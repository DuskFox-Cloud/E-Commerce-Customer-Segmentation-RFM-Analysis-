/*
Part B: SQL Queries (The Analysis Core)
 
- The Task: Calculate the RFM metrics for each customer.
- Key Queries to Write:
	- Recency (R): Calculate the number of days since the customer's last purchase.
		- DATEDIFF(day, MAX(InvoiceDate), '2025-01-01')
	
    - Frequency (F): Count how many distinct invoices each customer has generated.
		- COUNT(DISTINCT InvoiceNo)

	- Monetary (M): Sum the total spend for each customer.
		- SUM(Quantity * UnitPrice)

	- Segmentation: Use CASE statements to label customers. For example, if R is low and F/M are high, label them as "Champions." 
	  If R is high and F/M are high, label them "At Risk."
*/

-- Checking the table
show tables;
select * from Superstore_Sales;
select count(*) from Superstore_Sales;

-- Recency (R): Calculate the number of days since the customer's last purchase.
select customerid, DATEDIFF((SELECT MAX(InvoiceDate) FROM Superstore_Sales), MAX(InvoiceDate)) AS Recency
from Superstore_Sales
where customerid is not null
and invoice not like "C%"
group by customerid;

-- Frequency (F): Count how many distinct invoices each customer has generated.
select customerid, count(distinct invoice) as Frequency
from Superstore_Sales
where customerid is not null and invoice not like "c%" group by customerid;

-- Monetary (M): Sum the total spend for each customer.
select customerid, sum(quantity * price) as monetory
from Superstore_Sales
where customerid is not null and invoice not like "c%" group by customerid;

-- The RFM metrics 
SELECT
    CustomerID,

    -- Recency (Days since last purchase)
    DATEDIFF((SELECT MAX(InvoiceDate) FROM Superstore_Sales), MAX(InvoiceDate)) AS Recency,

    -- Frequency (Number of distinct invoices)
    COUNT(DISTINCT invoice) AS Frequency,

    -- Monetary (Total spend)
    SUM(Quantity * price) AS Monetary

FROM Superstore_Sales
WHERE CustomerID IS NOT NULL AND invoice NOT LIKE "C%"
GROUP BY CustomerID;

-- Segmentation:

WITH rfm AS (
    SELECT
        CustomerID,
        DATEDIFF((SELECT MAX(InvoiceDate) FROM Superstore_Sales), MAX(InvoiceDate)) AS Recency,
        COUNT(DISTINCT Invoice) AS Frequency,
        SUM(Quantity * Price) AS Monetary
    FROM Superstore_Sales
    WHERE CustomerID IS NOT NULL
      AND Invoice NOT LIKE 'C%'
    GROUP BY CustomerID
),

avg_values AS (
    SELECT
        AVG(Recency) AS avg_recency,
        AVG(Frequency) AS avg_frequency,
        AVG(Monetary) AS avg_monetary
    FROM rfm
)

SELECT 
    r.*,
    CASE
        WHEN r.Recency < a.avg_recency 
             AND r.Frequency > a.avg_frequency 
             AND r.Monetary > a.avg_monetary
        THEN 'Champions'

        WHEN r.Recency > a.avg_recency 
             AND r.Frequency > a.avg_frequency 
             AND r.Monetary > a.avg_monetary
        THEN 'At Risk'

        WHEN r.Recency < a.avg_recency
        THEN 'Active Customers'

        ELSE 'Low Value Customers'
    END AS Customer_Segment

FROM rfm r
CROSS JOIN avg_values a;