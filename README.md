# 🛺 Ride & Pickup DBMS — Oracle SQL, Unix Shell & Web Application

This project implements a complete **Ride & Pickup Database Management System** using **Oracle SQL**, fully automated with **Unix Shell scripting**, and extended with a **web-based interface built using PHP and HTML**.

It demonstrates end-to-end database lifecycle management — including schema creation, data population, teardown, and advanced analytics — accessible through both **command-line automation** and a **browser-based UI** using the same Oracle backend.

---

## ✅ Key Features

### 🗄️ Full Relational Database Schema
- Customers  
- Drivers  
- Vehicles  
- Service Orders (Rides & Deliveries)  
- Merchants  
- Pickup & Drop-off Locations  
- Payments  
- Customer ↔ Driver Ratings  
- Address abstraction  

✔ Fully normalized design  
✔ Primary & Foreign Keys  
✔ CHECK & UNIQUE constraints  
✔ Referential integrity enforced  

---

### 🔁 Automated DB Lifecycle (Unix Shell Scripts)

All database operations are executed through dedicated `.sh` scripts:

| Script | Purpose |
|------|--------|
| `drop_tables.sh` | Safely removes all tables in dependency order |
| `create_tables.sh` | Builds the full relational schema |
| `populate_tables.sh` | Inserts sample data and initializes relationships |
| `query_tables.sh` | Runs analytics, joins, and advanced SQL queries |
| `menu.sh` | Interactive terminal menu to manage the entire system |

The menu-driven interface allows full database control without manually entering SQL commands.

---

### 📊 Advanced SQL Queries Included
- Aggregation with `GROUP BY` & `HAVING`  
- Multi-table JOIN analytics  
- `EXISTS` subqueries  
- Set operations (`UNION`, `MINUS`)  
- Ride revenue analysis  
- Driver performance summaries  
- Merchant delivery reports  
- Customer & driver rating insights  

---

### 🌐 Web-Based Application (Implemented)

The system was extended into a **fully functional web application** using the same Oracle backend.

#### 🧰 Technologies Used
- **PHP** – server-side logic and Oracle connectivity  
- **HTML / CSS** – user interface and layout  
- **Oracle Database** – relational backend  
- **SQL / PL/SQL** – queries, views, joins, and constraints  
- **Oracle SQL Developer** – schema design and testing  

#### 🌍 Web Interface Capabilities
- Create and drop all Ride & Pickup DBMS tables  
- Populate the database with sample data  
- Run advanced SQL queries and views  
- View Customers, Drivers, Vehicles, Merchants, Service Orders, Payments, and Ratings  
- Perform search, update, and delete operations via form inputs  

🔗 **Live Demo (TMU VPN required):**  
https://webdev.scs.ryerson.ca/~kpalakan/assignment9.php  

This demonstrates how the same Oracle database supports both **automation scripts** and a **web-based frontend**, reflecting real-world full-stack DBMS architecture.

---

## 🚀 How to Use

### 1️⃣ Make scripts executable
```bash
chmod +x *.sh

