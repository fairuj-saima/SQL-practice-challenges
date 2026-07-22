# SQL Practice & Database Challenges

A hands-on collection of SQL exercises and solutions covering DDL, DML, filtering, joins, set operations, and string/numeric data transformations using a mock ecommerce inventory and sales channel schema.

---

## 📊 About This Repository

Welcome! This repository is a documented log of my SQL learning journey built with **Microsoft SQL Server (T-SQL)**. It contains a mock ecommerce database schema and a series of hands-on workbooks designed to build and test core relational database skills—ranging from basic data manipulation to advanced joins, set theory analysis, and scalar data transformation.

---

## 🛠️ Skills & Concepts Showcased

* **Data Definition Language (DDL):** Creating tables (`CREATE TABLE`) and enforcing referential integrity with primary/foreign key constraints.
* **Data Manipulation Language (DML):** Inserting transactional rows safely (`INSERT INTO`), updating records (`UPDATE`), and staging clean rebuilds.
* **Data Querying & Filtering:** Utilizing conditional logic (`WHERE`, `AND`, `OR`), pattern matching (`LIKE`), and sorting (`ORDER BY`).
* **Multi-Table Relational Queries:** Connecting datasets using `INNER JOIN`, `LEFT JOIN`, and `RIGHT JOIN` based on explicit key alignments.
* **Set Operations:** Combining and auditing cross-channel data pipelines using `UNION`, `UNION ALL`, `INTERSECT`, and `EXCEPT`.
* **Data Transformation & Cleaning:** Manipulating text, precision math, and scalar expressions using functions such as `UPPER()`, `LOWER()`, `TRIM()`, `LEFT()`, `RIGHT()`, `REPLACE()`, `ROUND()`, `CEILING()`, `ABS()`, and `%` (modulo).

---

## 🗄️ Database Schema

All queries in this repository are written against a mock relational database tracking inventory and omnichannel sales transactions. 

### 🏢 `suppliers` Table
| Column Name | Data Type | Constraints |
| :--- | :--- | :--- |
| `supplier_id` | `INT` | `PRIMARY KEY`, `NOT NULL` |
| `supplier_name` | `VARCHAR(100)` | `NOT NULL` |
| `country` | `VARCHAR(50)` | |

### 📦 `products` Table
| Column Name | Data Type | Constraints |
| :--- | :--- | :--- |
| `id` | `INT` | `PRIMARY KEY`, `NOT NULL` |
| `product_name` | `VARCHAR(100)` | `NOT NULL` |
| `category` | `VARCHAR(50)` | |
| `price` | `DECIMAL(10, 2)` | `NOT NULL` |
| `stock_quantity` | `INT` | |
| `release_date` | `DATE` | |
| `supplier_id` | `INT` | `FOREIGN KEY` references `suppliers.supplier_id` |

### 💻 `orders_online` Table
| Column Name | Data Type | Constraints |
| :--- | :--- | :--- |
| `order_id` | `INT` | `PRIMARY KEY`, `NOT NULL` |
| `customer_id` | `INT` | `NOT NULL` |
| `product_id` | `INT` | `FOREIGN KEY` references `products.id`, `NOT NULL` |
| `quantity` | `INT` | |
| `order_date` | `DATE` | |

### 🏪 `orders_retail` Table
| Column Name | Data Type | Constraints |
| :--- | :--- | :--- |
| `order_id` | `INT` | `PRIMARY KEY`, `NOT NULL` |
| `customer_id` | `INT` | `NOT NULL` |
| `product_id` | `INT` | `FOREIGN KEY` references `products.id`, `NOT NULL` |
| `quantity` | `INT` | |
| `order_date` | `DATE` | |

---

## 📂 File Structure

The project separates database setup and raw table infrastructure from query practice workbooks:

```text
sql-practice-challenges/
├── Database/
│   └── schema.sql                        # Centralized setup: Cascading table schemas and seed scripts
├── 01-basics-and-crud/
│   ├── queries.sql                       # Workbook: Single-table core CRUD modifications
│   └── filtering_practice.sql            # Workbook: Dynamic calculations and price-modulo audits
├── 02-multi-table-queries/
│   ├── joins_practice.sql                # Workbook: Relational analysis using INNER, LEFT, & RIGHT joins
│   └── set_operations.sql                # Workbook: Combining and intersecting web vs retail data pipelines
├── 03-data-transformation/
│   └── string_and_numeric_functions.sql  # Workbook: Data cleaning, text extraction, precision math, and masking
├── LICENSE
└── README.md                             # You are here!
