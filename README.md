# SQL-practice-challenges
A hands-on collection of SQL exercises and solutions covering DDL, DML, filtering, and aggregations using a mock products database schema.

# 📊 SQL Practice & Database Challenges

Welcome! This repository is a documented log of my SQL learning journey. It contains a mock database schema and a series of hands-on challenges designed to build and test core SQL skills—ranging from basic data manipulation to advanced filtering, calculations, and aggregations.

## 🛠️ Skills & Concepts Showcased

*   **Data Definition Language (DDL):** Creating tables (`CREATE TABLE`), altering structures (`ALTER TABLE`), and modifying/dropping columns (`DROP COLUMN`).
*   **Data Manipulation Language (DML):** Inserting data (`INSERT INTO`), updating records with basic arithmetic operations (`UPDATE`), and removing records safely (`DELETE`).
*   **Data Querying & Filtering:** Utilizing complex conditional logic (`WHERE`, `AND`, `OR`, `BETWEEN`), pattern matching using double-wildcards (`LIKE` / `NOT LIKE`), and range exclusions.
*   **Mathematical & Calculation Power:** Designing dynamic calculated fields on the fly (e.g., potential inventory revenue), utilizing modulo arithmetic (`%`) for numeric auditing, and sorting sequentially (`ORDER BY ASC/DESC`).
*   **Aggregations & Grouping:** Summarizing data using aggregate functions (`COUNT()`, `SUM()`, `AVG()`, `MIN()`, `MAX()`) combined with `GROUP BY` and group-level filtering (`HAVING`).

---

## 🗄️ Database Schema

All queries in this repository are written against a mock `products` inventory database structured as follows:

| Column Name | Data Type | Constraints |
| :--- | :--- | :--- |
| `id` | `INT` | `PRIMARY KEY`, `NOT NULL` |
| `product_name` | `VARCHAR(100)` | `NOT NULL` |
| `category` | `VARCHAR(50)` | |
| `price` | `DECIMAL(10, 2)` | `NOT NULL` |
| `stock_quantity` | `INT` | |

---

## 📂 File Structure

The project is kept clean, organized, and contained within a single subfolder to prevent unnecessary clutter:

```text
sql-practice-challenges/
├── 01-basics-and-crud/
│   ├── schema.sql                 # Table structure initialization and seeding script
│   ├── queries.sql                # Progressive workbook of SQL challenges and modifications
│   └── filtering_practice.sql     # Advanced filtering, calculations, and modulo arithmetic queries
├── LICENSE
└── README.md                      # You are here!

## 🚀 How to Use This Repo

To run these queries and practice on your own machine, follow these steps:

### 1. Set Up the Database & Schema
First, load the table structure and mock data into your database engine (MySQL, PostgreSQL, MariaDB, or SQLite). 

* **Using a Database GUI (like DBeaver, TablePlus, or VS Code SQL Tools):**
  Open `01-basics-and-crud/schema.sql`, copy the contents, paste them into a new SQL editor, and run the script to build and seed your `products` table.
* **Using the Command Line:**
  ```bash
  # For MySQL / MariaDB
  mysql -u your_username -p your_database_name < 01-basics-and-crud/schema.sql

  # For PostgreSQL
  psql -U your_username -d your_database_name -f 01-basics-and-crud/schema.sql
