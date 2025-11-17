🚗 Ride & Pickup DBMS — Oracle SQL + Unix Shell Automation

This project implements a complete Ride & Pickup Database Management System using Oracle SQL, fully automated with Unix Shell scripting.
It provides end-to-end control over the database lifecycle — including schema creation, table population, teardown, and analytical queries — all executed through modular .sh scripts.

The repository includes a unified SQL file along with shell automation scripts, structured to support future development into mobile, desktop, or full web-based applications using the same backend.

✅ Key Features
🗄️ Full Relational Database Schema

The system models core ride-sharing and delivery entities:

Customers

Drivers

Vehicles

Service Orders (Rides & Deliveries)

Merchants

Pickup & Drop-off Locations

Payments

Customer ↔ Driver Ratings

Designed using normalized principles with:

Primary & Foreign Keys

CHECK constraints

Relationship integrity

Real-world business rules (vehicle linkage, order assignment, payment flows)

🔁 Automated DB Lifecycle (Unix Shell Scripts)

Each system operation is executed through dedicated shell scripts:

Script	Purpose
drop_tables.sh	Safely removes all tables in correct dependency order
create_tables.sh	Builds the full relational schema
populate_tables.sh	Inserts sample data and initializes entity relationships
query_tables.sh	Runs analytics, joins, summaries, and advanced SQL queries
menu.sh	Interactive terminal menu to operate the DBMS
📊 Advanced SQL Queries Included

The system includes a variety of analytical and operational SQL queries:

Aggregations & HAVING

JOIN-based reporting

EXISTS subqueries

MINUS & UNION

Ride fare analysis

Driver and merchant activity summaries

Customer/driver rating analytics

🏗️ Future Extensions

The DBMS is designed for easy expansion into:

Java Application (JDBC)

Python Backend (Flask / FastAPI + cx_Oracle)

Web App (React / Node.js / Spring Boot)

Mobile App (Android/iOS with API integration)

A clean, modular backend foundation ready for full-stack implementation.

✅ How to Use
1. Make scripts executable
chmod +x *.sh

2. Launch the interactive menu
bash menu.sh

3. Run operations manually
bash drop_tables.sh
bash create_tables.sh
bash populate_tables.sh
bash query_tables.sh

4. Update Oracle login credentials

Inside each script, replace the placeholder:

YOUR_USERNAME/YOUR_PASSWORD@oracle.scs.ryerson.ca:1521/orcl

✅ Repository Structure
/menu.sh
/drop_tables.sh
/create_tables.sh
/populate_tables.sh
/query_tables.sh
/ride_pickup.sql
/README.md

👨‍💻 Author

Kirusanth Palakanthan
Toronto Metropolitan University — Computer Engineering
