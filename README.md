# Data Digger – SQL Project

---

## Project Overview

**Data Digger** is a foundational SQL project built using MySQL to simulate an E-Commerce database system.

The project focuses on applying core SQL concepts including CRUD operations, filtering, sorting, aggregate functions, relationships, and data integrity using primary and foreign keys.

It provides practical experience in managing relational data and generating business insights from transactional records.

---

## Project Objective

* Build a structured relational database
* Understand table relationships (One-to-Many, Many-to-Many)
* Perform core SQL operations in a real-world business scenario
* Generate insights using aggregation and grouping
* Strengthen SQL fundamentals before advanced database systems

---

## Database Structure

The system consists of four interrelated tables:

### 1. Customers

Stores customer information such as name, contact details, and customer ID.

### 2. Products

Maintains product inventory, pricing, and stock details.

### 3. Orders

Contains order-level data linked to customers through a foreign key.

### 4. OrderDetails

A junction (linking) table that handles the many-to-many relationship between Orders and Products.
It stores product quantity and subtotal per order.

---

## Database Relationships

* Customers → Orders: One-to-Many (via CustomerID)
* Orders ↔ Products: Many-to-Many (via OrderDetails)

This structure ensures proper relational mapping and referential integrity.

---

## SQL Concepts Demonstrated

### Customers Table

* Insert, Update, Delete operations
* Filtering using WHERE
* Searching records by name
* Record modification and deletion

---

### Products Table

* Sorting using ORDER BY (ascending & descending)
* Filtering with BETWEEN
* Aggregate functions:

  * MAX(price) – Highest priced product
  * MIN(price) – Lowest priced product

---

### Orders Table

* Foreign key usage (CustomerID relationship)
* Date filtering using DATE_SUB
* Aggregations such as:

  * MAX(total_amount)
  * MIN(total_amount)
  * AVG(total_amount)

---

### OrderDetails Table

* Managing many-to-many relationships
* Revenue calculation using SUM
* Grouping and joins for business insights

---

## Business Insights Generated

* Top 3 most sold products
* Customers with the highest total purchase value
* Total revenue generated
* Order activity within specific time ranges

---

## Skills Demonstrated

* Relational Database Design
* Primary & Foreign Key Implementation
* CRUD Operations
* Filtering & Sorting
* Aggregate Functions
* GROUP BY & Joins
* Basic Business Reporting with SQL

---

## Conclusion

Data Digger builds a strong foundation in SQL by applying essential database operations in an E-Commerce use case. It serves as a stepping stone toward more advanced database projects involving triggers, window functions, and complex reporting systems.

---

## Author

Rajvi Trivedi
Data Analyst | Business Analyst

---

