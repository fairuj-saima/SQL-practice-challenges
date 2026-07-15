# SQL-practice-challenges
A hands-on collection of SQL exercises and solutions covering DDL, DML, filtering, and aggregations using a mock products database schema.

# 📊 SQL Practice & Database Challenges

Welcome! This repository is a documented log of my SQL learning journey. It contains a mock database schema and a series of hands-on challenges designed to build and test core SQL skills—ranging from basic data manipulation to advanced filtering and aggregations.

## 🛠️ Skills & Concepts Showcased

*   **Data Definition Language (DDL):** Creating tables (`CREATE TABLE`), altering structures (`ALTER TABLE`), and modifying/dropping columns (`DROP COLUMN`).
*   **Data Manipulation Language (DML):** Inserting data (`INSERT INTO`), updating records with basic arithmetic operations (`UPDATE`), and removing records safely (`DELETE`).
*   **Data Querying & Filtering:** Utilizing complex conditional logic (`WHERE`, `AND`, `BETWEEN`), preventing duplicates (`DISTINCT`), and handling limits (`TOP` / `LIMIT`).
*   **Aggregations & Grouping:** Summarizing data using aggregate functions (`COUNT()`, `SUM()`, `AVG()`, `MIN()`, `MAX()`) combined with `GROUP BY` and group-level filtering (`HAVING`).
*   **Sorting:** Organizing output datasets sequentially (`ORDER BY ASC/DESC`).

---

## 🗄️ Database Schema

All queries in this repository are written against a mock `products` inventory database structured as follows:

| Column Name | Data Type | Constraints |
| :--- | :--- | :--- |
| `id` (or `product_id`) | `INT` | `PRIMARY KEY`, `NOT NULL` |
| `product_name` | `VARCHAR(100)` | `NOT NULL` |
| `category` | `VARCHAR(50)` | |
| `price` | `DECIMAL(10, 2)` | `NOT NULL` |
| `stock_quantity` | `INT` | |
| `release_date` | `DATE` | |

---

## 📂 File Structure

*   **`schema.sql`**: The setup script containing the table initialization and the initial mock dataset inserts.
*   **`queries.sql`**: My progressive workbook of 24 completed challenges testing analytical queries and structural modifications.

---

## 🚀 How to Use This Repo

1. Load the schema from `schema.sql` into your SQL database engine of choice (PostgreSQL, MySQL, SQL Server, etc.).
2. Run the queries inside `queries.sql` to see the logic in action or to practice modifying the data yourself!
