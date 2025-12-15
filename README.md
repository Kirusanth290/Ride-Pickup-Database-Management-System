🛺 Ride & Pickup Database Management System (DBMS)

Oracle SQL • Unix Shell Automation • Web-Based DBMS

This repository contains a complete Ride & Pickup Database Management System implemented using Oracle SQL and Unix Shell scripting, with an additional web-based interface built using PHP and HTML. The system models a real-world ride-sharing and delivery platform (similar to Uber/Uber Eats) and demonstrates the full database lifecycle — from conceptual design and normalization to automation, analytics, and web integration.

The project integrates ride services and item pickup/delivery into a single, normalized relational database and supports both a menu-driven command-line interface and a browser-based UI, showcasing real-world DBMS usage across multiple access layers.

📌 Project Overview

The Ride & Pickup DBMS was designed and implemented following industry-standard database engineering practices:

Application scoping and requirements analysis

ER modeling and relationship design

Relational schema creation in Oracle

Normalization to 3NF and BCNF

Referential integrity with PK/FK constraints

Advanced SQL queries, views, and analytics

Unix shell automation with interactive menus

Web-based access using PHP and HTML

The database manages core entities such as customers, drivers, vehicles, merchants, service orders, locations, payments, and ratings, ensuring data consistency, integrity, and scalability.

✅ Key Features
🗄️ Full Relational Database Schema

The system includes the following fully normalized tables:

Customer – user profiles, contact information, balances

Driver – licensing, insurance, and driver details

Vehicle – registered vehicles per driver

Service_Order – ride and delivery transactions

Location – pickup and drop-off addresses

Merchant – stores and restaurants for deliveries

Payment – payment method, amount, and status

Rating_System – two-way customer ↔ driver feedback

Address – reusable address abstraction

All tables are implemented with:

Primary Keys (PK)

Foreign Keys (FK)

CHECK constraints

UNIQUE constraints

ON DELETE CASCADE where appropriate

🔁 Automated Database Lifecycle (Unix Shell)

All database operations are fully automated using executable Unix shell scripts:

Script	Description
drop_tables.sh	Drops all tables safely in dependency order
create_tables.sh	Creates the full Oracle schema with constraints
populate_tables.sh	Inserts sample data and initializes relationships
query_tables.sh	Executes advanced SQL queries and analytics
menu.sh	Interactive terminal menu to run the entire system

The menu-driven interface allows users to manage the database without manually entering SQL commands, closely mirroring production-style database automation.

📊 Advanced SQL Queries & Views

The project includes a comprehensive set of SQL queries demonstrating real-world analytics and reporting:

Multi-table JOIN queries

Aggregation using GROUP BY and HAVING

Subqueries with EXISTS

Set operations (UNION, MINUS)

Revenue analysis per driver and merchant

Customer order history

Driver performance summaries

Rating and feedback insights

Custom SQL views were created to simplify recurring access patterns, including:

Active customer orders

Driver earnings summaries

📐 Normalization & Data Integrity

All relations were verified to satisfy Third Normal Form (3NF)

Further validated against Boyce–Codd Normal Form (BCNF)

Functional Dependencies (FDs) were documented and analyzed

No partial or transitive dependencies exist

This design ensures:

Minimal redundancy

Elimination of update anomalies

Strong data integrity and consistency

🏗️ System Architecture
Oracle Database (Normalized Schema)
        ↑
     SQL Scripts
        ↑
Unix Shell Automation
        ↑
 Interactive Menu (menu.sh)
        ↑
   Web Interface (PHP / HTML)


The architecture cleanly separates:

Database logic (SQL / PL/SQL)

Automation layer (Unix Shell)

User interaction layers (CLI menu and Web UI)

🌐 Web-Based Application (Implemented)

In addition to command-line automation, the DBMS was extended into a fully functional web-based application.

🧰 Technologies Used

PHP – server-side logic and Oracle connectivity

HTML / CSS – user interface and layout

Oracle Database – backend relational DBMS

SQL / PL/SQL – queries, views, joins, and constraints

Oracle SQL Developer – schema design, testing, and debugging

🌍 Web Interface Capabilities

The web application allows users to:

Create and drop all Ride & Pickup DBMS tables

Populate the database with sample data

Run advanced SQL queries and views

View Customers, Drivers, Vehicles, Merchants, Service Orders, Payments, and Ratings

Perform search, update, and delete operations through form-based inputs

This demonstrates how a single Oracle backend can support both automation scripts and a web-based frontend, reflecting real-world full-stack database systems.

🔗 Live Demo (TMU VPN required):
https://webdev.scs.ryerson.ca/~kpalakan/assignment9.php

🚀 How to Run the Project
1️⃣ Make scripts executable
chmod +x *.sh

2️⃣ Update Oracle credentials
YOUR_USERNAME/YOUR_PASSWORD@oracle.scs.ryerson.ca:1521/orcl

3️⃣ Launch the interactive menu
bash menu.sh

4️⃣ Run scripts manually (optional)
bash drop_tables.sh
bash create_tables.sh
bash populate_tables.sh
bash query_tables.sh

📁 Repository Structure
/menu.sh
/drop_tables.sh
/create_tables.sh
/populate_tables.sh
/query_tables.sh
/ride_pickup.sql
/README.md

👨‍💻 Author

Kirusanth Palakanthan
Computer Engineering
