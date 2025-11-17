#!/bin/sh
echo -n "Enter Oracle password: "
read -s PASSWORD
echo
sqlplus64 "cs_username/$PASSWORD@(DESCRIPTION=
(ADDRESS=(PROTOCOL=TCP)(Host=oracle.scs.ryerson.ca)(Port=1521))
(CONNECT_DATA=(SID=orcl)))" <<EOF

-- Clear any existing data before inserting new records
DELETE FROM Rating_System;
DELETE FROM Payment;
DELETE FROM Service_Order;
DELETE FROM Vehicle;
DELETE FROM Driver;
DELETE FROM Customer;
DELETE FROM Merchant;
DELETE FROM Location;
DELETE FROM Address;

-----------------------------------
-- Addresses
-----------------------------------
INSERT INTO Address VALUES (1, 'Canada', 'Ontario', 'Toronto',      '123 King St',       'M5G1X5');
INSERT INTO Address VALUES (2, 'Canada', 'Ontario', 'Mississauga',  '50 Lakeshore Rd',   'L5E2N2');
INSERT INTO Address VALUES (3, 'Canada', 'Ontario', 'Toronto',      '321 Front St',      'M5V2T3');
INSERT INTO Address VALUES (4, 'Canada', 'Ontario', 'Oakville',     '123 Oak St',        'L6J4L4');

-----------------------------------
-- Locations
-----------------------------------
INSERT INTO Location VALUES (1, '456 Queen St',     'Toronto',     'Ontario', 'M5H2N2', 'Canada', NULL);
INSERT INTO Location VALUES (2, '789 Bay St',       'Toronto',     'Ontario', 'M5B2C5', 'Canada', NULL);
INSERT INTO Location VALUES (3, '200 Dundas St',    'Mississauga', 'Ontario', 'L5A1X2', 'Canada', NULL);
INSERT INTO Location VALUES (4, '120 Lakeshore Rd','Mississauga', 'Ontario', 'L5G4G2', 'Canada', NULL);

-----------------------------------
-- Customers
-----------------------------------
INSERT INTO Customer VALUES
(1, 'John',  'Doe',   '4161234567', 'john.doe@email.com',
 TO_DATE('1990-05-20','YYYY-MM-DD'), SYSDATE, 50.00, 1);

INSERT INTO Customer VALUES
(2, 'Alice', 'Wong',  '4165551234', 'alice.wong@email.com',
 TO_DATE('1992-07-15','YYYY-MM-DD'), SYSDATE, 100.00, 2);

INSERT INTO Customer VALUES
(3, 'Bob',   'Singh', '6471112222', 'bob.singh@email.com',
 TO_DATE('1988-09-10','YYYY-MM-DD'), SYSDATE, 0.00, 3);

INSERT INTO Customer VALUES
(4, 'Mia',   'Kim',   '6471234567', 'mia.kim@email.com',
 TO_DATE('1995-04-25','YYYY-MM-DD'), SYSDATE, 75.00, 4);

-----------------------------------
-- Drivers
-----------------------------------
INSERT INTO Driver VALUES
(1, 'Jane', 'Smith', '4169876543',
 TO_DATE('1985-10-10','YYYY-MM-DD'),
 'LIC12345', 'InsureCo #123', 1);

INSERT INTO Driver VALUES
(2, 'Mark', 'Brown', '6472229999',
 TO_DATE('1990-03-12','YYYY-MM-DD'),
 'LIC54321', NULL, 2);

INSERT INTO Driver VALUES
(3, 'Ravi', 'Kumar', '9057778888',
 TO_DATE('1982-01-25','YYYY-MM-DD'),
 'LIC98765', 'SafeDrive #456', 3);

INSERT INTO Driver VALUES
(4, 'Sarah','Jones', '4166667777',
 TO_DATE('1989-11-14','YYYY-MM-DD'),
 'LIC24680', 'BestDrive #789', 4);

-----------------------------------
-- Vehicles
-----------------------------------
INSERT INTO Vehicle VALUES (1, 'ABC123', 'Toyota', 'Camry', 'Black',  2020, 'Sedan', 1);
INSERT INTO Vehicle VALUES (2, 'XYZ987', 'Honda',  'Civic', 'Blue',   2018, 'Sedan', 2);
INSERT INTO Vehicle VALUES (3, 'LMN456', 'Ford',   'Escape','White',  2022, 'SUV',   3);
INSERT INTO Vehicle VALUES (4, 'DEF567', 'Nissan', 'Altima','Silver', 2021, 'Sedan', 4);

-----------------------------------
-- Merchants
-----------------------------------
INSERT INTO Merchant VALUES (1, 'Pizza Place',   1);
INSERT INTO Merchant VALUES (2, 'Coffee Corner', 2);
INSERT INTO Merchant VALUES (3, 'Sushi Express', 3);
INSERT INTO Merchant VALUES (4, 'Burger King',   4);

-----------------------------------
-- Service Orders
-----------------------------------
INSERT INTO Service_Order VALUES
(1, 1, 1, 1, 'Completed', CURRENT_TIMESTAMP, 25.50, 1, 2);

INSERT INTO Service_Order VALUES
(2, 2, 2, 2, 'Pending', CURRENT_TIMESTAMP, 12.00, 2, 1);

INSERT INTO Service_Order VALUES
(3, 3, 3, 3, 'Cancelled', CURRENT_TIMESTAMP, 30.00, 3, 1);

INSERT INTO Service_Order VALUES
(4, 2, 1, 1, 'Completed', CURRENT_TIMESTAMP, 45.00, 1, 3);

INSERT INTO Service_Order VALUES
(5, 4, 4, 4, 'Completed', CURRENT_TIMESTAMP, 40.00, 4, 2);

-----------------------------------
-- Payments
-----------------------------------
INSERT INTO Payment VALUES (1, 1, 'Credit',  25.50, 'Paid');
INSERT INTO Payment VALUES (2, 2, 'Debit',   12.00, 'Pending');
INSERT INTO Payment VALUES (3, 3, 'Balance', 30.00, 'Failed');
INSERT INTO Payment VALUES (4, 4, 'Credit',  45.00, 'Paid');
INSERT INTO Payment VALUES (5, 5, 'Debit',   40.00, 'Paid');

-----------------------------------
-- Ratings
-----------------------------------
INSERT INTO Rating_System VALUES
(1, 1, 1, 1, 5, 'Great driver!', 5, 'Polite customer');

INSERT INTO Rating_System VALUES
(2, 2, 2, 2, 2, 'Driver was late', 3, 'Customer was fine');

INSERT INTO Rating_System VALUES
(3, 3, 3, 3, 3, 'Trip cancelled',   3, 'No show');

INSERT INTO Rating_System VALUES
(4, 4, 2, 1, 4, 'Fast delivery!',   5, 'Great customer');

INSERT INTO Rating_System VALUES
(5, 5, 4, 4, 5, 'Excellent ride!',  5, 'Friendly driver');

COMMIT;

EXIT;
EOF
