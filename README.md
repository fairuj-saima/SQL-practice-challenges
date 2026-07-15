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

