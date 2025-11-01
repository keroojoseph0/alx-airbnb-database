# 5. Partitioning Large Tables  

## 🎯 Objective  
Implement table partitioning to optimize queries on large datasets.

---

## 🧩 Instructions  

### Step 1: Understand the Problem  
Assume the **`bookings`** table is very large, causing queries (especially those filtering by date) to run slowly.  
To improve performance, we will **partition** the table based on the `start_date` column.

---

### Step 2: Implement Partitioning  
We’ll use **RANGE partitioning** so that each partition stores data for a specific year (or month, depending on data volume).  
Save your SQL commands in a file named **`partitioning.sql`**.
