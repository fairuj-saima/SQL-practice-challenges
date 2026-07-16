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

---

## 🚀 How to Use This Repo

Follow these step-by-step instructions to run the schema and execute the practice challenges on your local machine.

### 1. Clone the Repository
Open your terminal or command prompt and clone this repository to your computer:

```bash
git clone [https://github.com/YOUR_USERNAME/sql-practice-challenges.git](https://github.com/YOUR_USERNAME/sql-practice-challenges.git)
cd sql-practice-challenges
```

### 2. Initialize and Seed the Database
Before running any practice queries, you must build the tables and insert the mock data.

* **Option A: Using the Command Line (CLI)**
  Run the `schema.sql` script directly into your database management system:
  \`\`\`bash
  # For PostgreSQL
  psql -U your_username -d your_database_name -f Database/schema.sql

  # For MySQL / MariaDB
  mysql -u your_username -p your_database_name < Database/schema.sql
  \`\`\`

* **Option B: Using a Database GUI (DBeaver, TablePlus, or VS Code SQL Tools)**
  1. Open your database GUI tool and connect to your database.
  2. Open the file `Database/schema.sql` inside the tool (or copy-paste its contents into a new SQL editor tab).
  3. Execute the entire script to clear out any old data, set up the tables, and seed the new aligned data.

### 3. Run the Practice Workbooks
Once your tables are ready, navigate to the workbook files to practice your queries. 

* **To Practice Basics & Filtering:** Open and run individual queries from `01-basics-and-crud/queries.sql` or `01-basics-and-crud/filtering_practice.sql`.
* **To Practice Multi-Table Joins:** Open `02-multi-table-queries/joins_practice.sql` to work on relational syntax connecting products to their vendors.

> **💡 Pro-Tip for Interactive Execution:** Instead of running an entire workbook script at once, open the `.sql` file in your favorite editor, **highlight a single query with your cursor**, and press `Cmd + Enter` (Mac) or `Ctrl + Enter` (Windows/Linux) to isolate and run only that specific challenge!

