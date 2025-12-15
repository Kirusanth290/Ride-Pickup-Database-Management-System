-------------------------------------------------------------
-- CPS510 – Assignment 4 (Part 1)
-- Ride & Pickup DBMS – Queries
-- FIXED FOR ASSIGNMENT 9 (Payment column names updated)
-------------------------------------------------------------

-- Q1. Toronto addresses
SELECT Address_ID, Street_Address AS Street, City, Province, Postal_Code
FROM   Address
WHERE  City = 'Toronto';

-- Q2. Customer balances with active/inactive status
SELECT Customer_ID,
       First_Name || ' ' || Last_Name AS Customer_Name,
       Balance,
       CASE WHEN Balance > 0 THEN 'Active' ELSE 'Inactive' END AS Status
FROM   Customer
ORDER BY Balance DESC;

-- Q3. Drivers with insurance info
SELECT Driver_ID,
       First_Name || ' ' || Last_Name AS Driver_Name,
       License_Info,
       Insurance_Info
FROM   Driver
WHERE  Insurance_Info IS NOT NULL;

-- Q4. Vehicles manufactured after 2015
SELECT Vehicle_ID, License_Plate, Make, Model, Year, Vehicle_Type
FROM   Vehicle
WHERE  Year > 2015;

-- Q5. Merchants and their cities
SELECT DISTINCT M.Merchant_ID, M.Name AS Merchant_Name, A.City, A.Province
FROM   Merchant M, Address A
WHERE  M.Address_ID = A.Address_ID;

-- Q6. Ontario locations
SELECT Location_ID, Street_Address, City, Province, Postal_Code
FROM   Location
WHERE  Province = 'Ontario';

-- Q7. Completed service orders > $20
SELECT Order_ID, Customer_ID, Driver_ID, Fare, Status
FROM   Service_Order
WHERE  Status = 'Completed'
AND    Fare > 20;

-- Q8. Count credit payments (FIXED)
SELECT COUNT(*) AS Credit_Payments
FROM   Payment
WHERE  Method = 'Credit';

-- Q9. Low ratings (< 3 stars)
SELECT Rating_ID, Order_ID, Customer_Stars, Customer_Feedback
FROM   Rating_System
WHERE  Customer_Stars < 3;

-- Q10. Completed orders with customer & driver
SELECT so.Order_ID,
       c.First_Name || ' ' || c.Last_Name AS Customer_Name,
       d.First_Name || ' ' || d.Last_Name AS Driver_Name,
       so.Fare
FROM   Service_Order so, Customer c, Driver d
WHERE  so.Customer_ID = c.Customer_ID
AND    so.Driver_ID   = d.Driver_ID
AND    so.Status = 'Completed'
ORDER BY so.Fare DESC;

-- Q11. Payment + Order + Customer (FIXED)
SELECT p.Payment_ID, p.Method, p.Amount,
       so.Order_ID,
       c.First_Name || ' ' || c.Last_Name AS Customer_Name
FROM   Payment p, Service_Order so, Customer c
WHERE  p.Order_ID = so.Order_ID
AND    so.Customer_ID = c.Customer_ID
ORDER BY p.Amount DESC;

-- Q12. Total orders per customer
SELECT c.Customer_ID,
       c.First_Name || ' ' || c.Last_Name AS Customer_Name,
       COUNT(so.Order_ID) AS Total_Orders
FROM   Customer c LEFT JOIN Service_Order so
       ON c.Customer_ID = so.Customer_ID
GROUP BY c.Customer_ID, c.First_Name || ' ' || c.Last_Name
ORDER BY Total_Orders DESC;

-- Q13. Average fare per driver
SELECT d.Driver_ID,
       d.First_Name || ' ' || d.Last_Name AS Driver_Name,
       ROUND(AVG(so.Fare),2) AS Avg_Fare
FROM   Driver d JOIN Service_Order so
       ON d.Driver_ID = so.Driver_ID
WHERE  so.Status = 'Completed'
GROUP BY d.Driver_ID, d.First_Name || ' ' || d.Last_Name
ORDER BY Avg_Fare DESC;
