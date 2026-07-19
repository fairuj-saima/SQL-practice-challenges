# SQL-practice-challenges

A hands-on collection of SQL exercises and solutions covering DDL, DML, filtering, joins, set operations, and aggregations using a mock ecommerce inventory and sales channel schema.

---

## 📊 SQL Practice & Database Challenges

Welcome! This repository is a documented log of my SQL learning journey. It contains a mock database schema and a series of hands-on workbooks designed to build and test core relational database skills—ranging from basic data manipulation to advanced relational calculations, cross-table connections, and set theory analysis.

## 🛠️ Skills & Concepts Showcased

* **Data Definition Language (DDL):** Creating tables (`CREATE TABLE`) and enforcing referential integrity with constraints.
* **Data Manipulation Language (DML):** Inserting transactional rows safely (`INSERT INTO`), mass-updating relational foreign keys (`UPDATE`), and staging clean rebuilds.
* **Data Querying & Filtering:** Utilizing conditional logic (`WHERE`, `AND`, `OR`, `BETWEEN`), pattern matching using wildcards (`LIKE`), and sorting sequentially (`ORDER BY`).
* **Mathematical & Calculation Power:** Designing dynamic calculated fields on the fly and utilizing modulo arithmetic (`%`) for inventory audits.
* **Multi-Table Relational Queries:** Connecting datasets using `INNER JOIN`, `LEFT JOIN`, and `RIGHT JOIN` based on explicit primary-to-foreign key alignments.
* **Set Operations:** Implementing set theory logic using `UNION`, `UNION ALL`, `INTERSECT`, and `EXCEPT` to run cross-channel auditing between separate retail and online datasets.

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
│   └── schema.sql                  # Centralized setup: Cascading table schemas and 20+ row seed script
├── 01-basics-and-crud/
│   ├── queries.sql                 # Workbook: Single-table core CRUD modifications
│   └── filtering_practice.sql      # Workbook: Dynamic calculations and price-modulo audits
├── 02-multi-table-queries/
│   ├── joins_practice.sql          # Workbook: Relational analysis using INNER, LEFT, & RIGHT joins
│   └── set_operations.sql          # Workbook: Combining and intersecting web vs retail data pipelines
├── LICENSE
└── README.md                       # You are here!
