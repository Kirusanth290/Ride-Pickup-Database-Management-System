-----------------------------------------------------------------
-- RIDE & PICKUP DBMS - Updated Schema (Assignment 9)
-- Authors: Shayaan Kirubakaran, Kirusanth Palakanthan, Ahmed Hasan
-- NOTE:
--  • This schema matches the working implementation used in A4/A5.
--  • Payment table updated to satisfy Assignment 8 BCNF (R6).
--  • All names match your queries and populate scripts exactly.
-----------------------------------------------------------------

-----------------------------
-- ADDRESS TABLE
-----------------------------
CREATE TABLE Address (
    Address_ID NUMBER PRIMARY KEY,
    Country VARCHAR2(50) NOT NULL,
    Province VARCHAR2(50) NOT NULL,
    City VARCHAR2(50) NOT NULL,
    Street_Address VARCHAR2(100) NOT NULL,
    Postal_Code VARCHAR2(10) NOT NULL
);

-----------------------------
-- CUSTOMER TABLE
-----------------------------
CREATE TABLE Customer (
    Customer_ID NUMBER PRIMARY KEY,
    First_Name VARCHAR2(50) NOT NULL,
    Last_Name VARCHAR2(50) NOT NULL,
    Phone_Number VARCHAR2(15) UNIQUE NOT NULL,
    Email_Address VARCHAR2(100) UNIQUE NOT NULL,
    Date_Of_Birth DATE,
    Signup_Date DATE DEFAULT SYSDATE,
    Balance NUMBER(10,2) DEFAULT 0 CHECK (Balance >= 0),
    Address_ID NUMBER NOT NULL,
    FOREIGN KEY (Address_ID) REFERENCES Address(Address_ID)
);

-----------------------------
-- DRIVER TABLE
-----------------------------
CREATE TABLE Driver (
    Driver_ID NUMBER PRIMARY KEY,
    First_Name VARCHAR2(50) NOT NULL,
    Last_Name VARCHAR2(50) NOT NULL,
    Phone_Number VARCHAR2(15) UNIQUE NOT NULL,
    Date_Of_Birth DATE,
    License_Info VARCHAR2(50) NOT NULL,
    Insurance_Info VARCHAR2(100),
    Address_ID NUMBER NOT NULL,
    FOREIGN KEY (Address_ID) REFERENCES Address(Address_ID)
);

-----------------------------
-- VEHICLE TABLE
-----------------------------
CREATE TABLE Vehicle (
    Vehicle_ID NUMBER PRIMARY KEY,
    License_Plate VARCHAR2(20) UNIQUE NOT NULL,
    Make VARCHAR2(50) NOT NULL,
    Model VARCHAR2(50) NOT NULL,
    Colour VARCHAR2(20),
    Year NUMBER(4) CHECK (Year >= 1980),
    Vehicle_Type VARCHAR2(50),
    Driver_ID NUMBER NOT NULL,
    FOREIGN KEY (Driver_ID) REFERENCES Driver(Driver_ID)
);

-----------------------------
-- MERCHANT TABLE
-----------------------------
CREATE TABLE Merchant (
    Merchant_ID NUMBER PRIMARY KEY,
    Name VARCHAR2(100) NOT NULL,
    Address_ID NUMBER NOT NULL,
    FOREIGN KEY (Address_ID) REFERENCES Address(Address_ID)
);

-----------------------------
-- LOCATION TABLE
-----------------------------
CREATE TABLE Location (
    Location_ID NUMBER PRIMARY KEY,
    Street_Address VARCHAR2(100) NOT NULL,
    City VARCHAR2(50) NOT NULL,
    Province VARCHAR2(50) NOT NULL,
    Postal_Code VARCHAR2(10) NOT NULL,
    Country VARCHAR2(50) NOT NULL,
    GPS_Coordinates VARCHAR2(100)
);

-----------------------------
-- SERVICE_ORDER TABLE
-----------------------------
CREATE TABLE Service_Order (
    Order_ID NUMBER PRIMARY KEY,
    Customer_ID NUMBER NOT NULL,
    Driver_ID NUMBER NOT NULL,
    Merchant_ID NUMBER,
    Status VARCHAR2(20) DEFAULT 'Pending'
           CHECK (Status IN ('Pending','Completed','Cancelled')),
    Order_Time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Fare NUMBER(10,2) CHECK (Fare >= 0),
    Pickup_Location_ID NUMBER NOT NULL,
    Dropoff_Location_ID NUMBER NOT NULL,

    FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID),
    FOREIGN KEY (Driver_ID) REFERENCES Driver(Driver_ID),
    FOREIGN KEY (Merchant_ID) REFERENCES Merchant(Merchant_ID),
    FOREIGN KEY (Pickup_Location_ID) REFERENCES Location(Location_ID),
    FOREIGN KEY (Dropoff_Location_ID) REFERENCES Location(Location_ID)
);

-----------------------------
-- PAYMENT TABLE (UPDATED)
-- Matches A8 R6 exactly
-- PaymentID → OrderID, Method, Amount, PaymentDate, CompletionStatus
-----------------------------
CREATE TABLE Payment (
    Payment_ID NUMBER PRIMARY KEY,
    Order_ID NUMBER NOT NULL,
    Method VARCHAR2(20) NOT NULL,             -- Credit, Debit, Balance
    Amount NUMBER(10,2) CHECK (Amount >= 0),
    Payment_Date DATE DEFAULT SYSDATE,
    CompletionStatus VARCHAR2(20)             -- Paid, Pending, Failed
        CHECK (CompletionStatus IN ('Paid','Pending','Failed')),
    FOREIGN KEY (Order_ID) REFERENCES Service_Order(Order_ID)
);

-----------------------------
-- RATING_SYSTEM TABLE
-----------------------------
CREATE TABLE Rating_System (
    Rating_ID NUMBER PRIMARY KEY,
    Order_ID NUMBER NOT NULL,
    Customer_ID NUMBER NOT NULL,
    Driver_ID NUMBER NOT NULL,
    Customer_Stars NUMBER(1) CHECK (Customer_Stars BETWEEN 1 AND 5),
    Customer_Feedback VARCHAR2(255),
    Driver_Stars NUMBER(1) CHECK (Driver_Stars BETWEEN 1 AND 5),
    Driver_Feedback VARCHAR2(255),
    FOREIGN KEY (Order_ID) REFERENCES Service_Order(Order_ID),
    FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID),
    FOREIGN KEY (Driver_ID) REFERENCES Driver(Driver_ID)
);
