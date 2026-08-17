# 🛒 Zepto E-commerce SQL Data Analyst Portfolio Project

## 📌 Project Overview

The goal of this project is to simulate how data analysts in the **e-commerce and retail industries** use SQL to work with real-world inventory data and generate meaningful business insights.

The project focuses on:

✅ Setting up a messy, real-world e-commerce inventory database

✅ Performing **Exploratory Data Analysis (EDA)** to understand product categories, availability, pricing, and data inconsistencies

✅ Performing **Data Cleaning** to handle NULL values, remove invalid entries, and convert pricing from paise to rupees

✅ Writing **business-driven SQL queries** to derive insights related to pricing, inventory, stock availability, potential revenue, and product value

---

## 📁 Dataset Overview

The dataset was sourced from **Kaggle** and was originally scraped from Zepto's official product listings. It represents a real-world-style e-commerce inventory dataset containing information about products, pricing, discounts, inventory, weight, and stock availability.

Each row represents a unique **SKU (Stock Keeping Unit)**. Duplicate product names may exist because the same product can appear multiple times with different package sizes, weights, discounts, or categories, which is common in real-world e-commerce catalog data.

### 🧾 Columns

* **sku_id:** Unique identifier for each product entry (Synthetic Primary Key)
* **name:** Product name as listed on the app
* **category:** Product category such as Fruits, Snacks, Beverages, etc.
* **mrp:** Maximum Retail Price (originally in paise, converted to ₹)
* **discountPercent:** Discount percentage applied to MRP
* **discountedSellingPrice:** Final selling price after discount (also converted to ₹)
* **availableQuantity:** Number of units currently available in inventory
* **weightInGms:** Product weight in grams
* **outOfStock:** Boolean flag indicating whether the product is out of stock
* **quantity:** Number of units per package (mixed with grams for loose produce)

---

## 🔧 Project Workflow

Here’s a step-by-step breakdown of the project:

### 1. 🗄️ Database & Table Creation

The project begins by creating a SQL table with appropriate data types and constraints:

```sql
CREATE TABLE zepto (
  sku_id SERIAL PRIMARY KEY,
  category VARCHAR(120),
  name VARCHAR(150) NOT NULL,
  mrp NUMERIC(8,2),
  discountPercent NUMERIC(5,2),
  availableQuantity INTEGER,
  discountedSellingPrice NUMERIC(8,2),
  weightInGms INTEGER,
  outOfStock BOOLEAN,
  quantity INTEGER
);
```

### 2. 📥 Data Import

The CSV dataset was imported into the `zepto` table within the **`zepto_SQL_project`** database.

### 3. 🔍 Data Exploration

* Counted the total number of records in the dataset
* Viewed sample records to understand the structure and contents of the data
* Checked for NULL values across columns
* Identified distinct product categories available in the dataset
* Compared in-stock and out-of-stock product counts
* Identified products appearing multiple times with different SKUs

### 4. 🧹 Data Cleaning

* Identified and removed records where MRP or discounted selling price was zero
* Converted `mrp` and `discountedSellingPrice` from paise to rupees for consistency and readability
* Handled NULL and invalid values where required

### 5. 📊 Business Insights

* Identified the **Top 10 best-value products** based on discount percentage
* Identified high-MRP products that are currently out of stock
* Estimated potential revenue for each product category
* Filtered expensive products (**MRP > ₹500**) with minimal discounts
* Ranked the **Top 5 categories** offering the highest average discounts
* Calculated price per gram to identify value-for-money products
* Grouped products based on weight into **Low, Medium, and Bulk** categories
* Measured total inventory weight for each product category
