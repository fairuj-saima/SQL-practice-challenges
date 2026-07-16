# SQL-practice-challenges

A hands-on collection of SQL exercises and solutions covering DDL, DML, filtering, joins, and aggregations using a mock inventory database schema.

---

## 📊 SQL Practice & Database Challenges

Welcome! This repository is a documented log of my SQL learning journey. It contains a mock database schema and a series of hands-on workbooks designed to build and test core relational database skills—ranging from basic data manipulation to advanced calculations and multi-table joins.

## 🛠️ Skills & Concepts Showcased

* **Data Definition Language (DDL):** Creating tables (`CREATE TABLE`) and modifying schemas.
* **Data Manipulation Language (DML):** Inserting data (`INSERT INTO`), updating records (`UPDATE`), and removing records safely (`DELETE`).
* **Data Querying & Filtering:** Utilizing conditional logic (`WHERE`, `AND`, `OR`, `BETWEEN`), pattern matching using wildcards (`LIKE`), and sorting sequentially (`ORDER BY`).
* **Mathematical & Calculation Power:** Designing dynamic calculated fields on the fly and utilizing modulo arithmetic (`%`) for inventory audits.
* **Multi-Table Relational Queries:** Connecting datasets using `INNER JOIN`, `LEFT JOIN`, and `RIGHT JOIN` based on aligned key relationships.

---

## 🗄️ Database Schema

All queries in this repository are written against a mock `products` and `suppliers` relational inventory layout. For ease of join practice, the primary keys share symmetric numerical matching ranges:

### `suppliers` Table
| Column Name | Data Type | Constraints |
| :--- | :--- | :--- |
| `supplier_id` | `INT` | `PRIMARY KEY`, `NOT NULL` |
| `supplier_name` | `VARCHAR(100)` | `NOT NULL` |
| `country` | `VARCHAR(50)` | |

### `products` Table
| Column Name | Data Type | Constraints |
| :--- | :--- | :--- |
| `id` | `INT` | `PRIMARY KEY`, `NOT NULL` |
| `product_name` | `VARCHAR(100)` | `NOT NULL` |
| `category` | `VARCHAR(50)` | |
| `price` | `DECIMAL(10, 2)` | `NOT NULL` |
| `stock_quantity` | `INT` | |
| `supplier_id` | `INT` | Maps to `suppliers.supplier_id` during joins |

---

## 📂 File Structure

The project separates database setup and raw table infrastructure from query practice workbooks:

```text
sql-practice-challenges/
├── Database/
│   └── schema.sql                 # Centralized setup: Aligned table keys and seed data script
├── 01-basics-and-crud/
│   ├── queries.sql                # Workbook: Single-table core CRUD modifications
│   └── filtering_practice.sql     # Workbook: Dynamic calculations and price-modulo audits
├── 02-multi-table-queries/
│   └── joins_practice.sql         # Workbook: Relational analysis using INNER, LEFT, & RIGHT joins
├── LICENSE
└── README.md                      # You are here!
```

