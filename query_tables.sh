#!/bin/sh
echo -n "Enter Oracle password: "
read -s PASSWORD
echo
sqlplus64 "cs_username/$PASSWORD@(DESCRIPTION=
(ADDRESS=(PROTOCOL=TCP)(Host=oracle.scs.ryerson.ca)(Port=1521))
(CONNECT_DATA=(SID=orcl)))" <<EOF

-- Formatting for cleaner query outputs
SET PAGESIZE 200
SET LINESIZE 200
COLUMN Customer FORMAT A25
COLUMN Driver   FORMAT A25
COLUMN City     FORMAT A20

PROMPT
PROMPT === 1) Join: Completed orders with customer and driver names ===
SELECT so.Order_ID,
       c.First_Name || ' ' || c.Last_Name AS Customer,
       d.First_Name || ' ' || d.Last_Name AS Driver,
       so.Status,
       so.Fare
FROM   Service_Order so
JOIN   Customer c ON so.Customer_ID = c.Customer_ID
JOIN   Driver   d ON so.Driver_ID   = d.Driver_ID
WHERE  so.Status = 'Completed'
ORDER  BY so.Order_ID;

PROMPT
PROMPT === 2) Aggregation: Average fare per driver ===
SELECT d.Driver_ID,
       d.First_Name || ' ' || d.Last_Name AS Driver,
       ROUND(AVG(so.Fare), 2) AS AvgFare
FROM   Driver d
JOIN   Service_Order so ON d.Driver_ID = so.Driver_ID
WHERE  so.Status = 'Completed'
GROUP  BY d.Driver_ID, d.First_Name, d.Last_Name
ORDER  BY AvgFare DESC;

PROMPT
PROMPT === 3) Set Operation: Customers with completed orders but no ratings ===
SELECT c.Customer_ID,
       c.First_Name || ' ' || c.Last_Name AS Customer
FROM   Customer c
WHERE  c.Customer_ID IN (
           SELECT Customer_ID
           FROM   Service_Order
           WHERE  Status = 'Completed'
       )
AND    c.Customer_ID NOT IN (
           SELECT DISTINCT Customer_ID
           FROM   Rating_System
       )
ORDER  BY c.Customer_ID;

PROMPT
PROMPT === 4) Nested Query: Drivers with total earnings above average ===
SELECT d.Driver_ID,
       d.First_Name || ' ' || d.Last_Name AS Driver,
       SUM(so.Fare) AS TotalEarnings
FROM   Driver d
JOIN   Service_Order so ON d.Driver_ID = so.Driver_ID
WHERE  so.Status = 'Completed'
GROUP  BY d.Driver_ID, d.First_Name, d.Last_Name
HAVING SUM(so.Fare) >
       (
           SELECT AVG(TotalFare)
           FROM (
                 SELECT SUM(Fare) AS TotalFare
                 FROM   Service_Order
                 WHERE  Status = 'Completed'
                 GROUP  BY Driver_ID
           )
       )
ORDER  BY TotalEarnings DESC;

PROMPT
PROMPT === 5) Statistical Query: Total earnings by drop-off city ===
SELECT l.City,
       SUM(so.Fare) AS TotalEarnings
FROM   Service_Order so
JOIN   Location l ON so.Dropoff_Location_ID = l.Location_ID
WHERE  so.Status = 'Completed'
GROUP  BY l.City
ORDER  BY TotalEarnings DESC;

EXIT;
EOF
