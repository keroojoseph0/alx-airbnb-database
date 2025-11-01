# Performance Monitoring and Refinement

## 6. Monitor and Refine Database Performance

**Mandatory Task**

### 🎯 Objective

Continuously monitor and refine your database performance by analyzing query execution plans and making schema adjustments.

---

### 🪄 Step 1: Monitor Query Performance

Use `EXPLAIN`, `EXPLAIN ANALYZE`, or `SHOW PROFILE` in MySQL to see how your queries run and identify slow parts.

**Example Query:**

```sql
SELECT
  b.booking_id,
  u.first_name,
  p.name AS property_name,
  pay.amount
FROM bookings b
LEFT JOIN users u ON b.user_id = u.user_id
LEFT JOIN properties p ON b.property_id = p.property_id
LEFT JOIN payments pay ON b.booking_id = pay.booking_id;
```

---

### 🔍 Step 2: Use EXPLAIN

```sql
EXPLAIN SELECT
  b.booking_id,
  u.first_name,
  p.name AS property_name,
  pay.amount
FROM bookings b
LEFT JOIN users u ON b.user_id = u.user_id
LEFT JOIN properties p ON b.property_id = p.property_id
LEFT JOIN payments pay ON b.booking_id = pay.booking_id;
```

Shows:

* Table read order
* Index usage
* Rows scanned
* Join types

---

### ⚡ Step 3: Use EXPLAIN ANALYZE

```sql
EXPLAIN ANALYZE
SELECT
  b.booking_id,
  u.first_name,
  p.name AS property_name,
  pay.amount
FROM bookings b
LEFT JOIN users u ON b.user_id = u.user_id
LEFT JOIN properties p ON b.property_id = p.property_id
LEFT JOIN payments pay ON b.booking_id = pay.booking_id;
```

Shows **actual timing** and identifies slow steps.

---

### 🧩 Step 4: Identify Bottlenecks

Look for:

* `type: ALL` → Full table scan, slow
* `Using where` → extra filtering without index
* `ref` / `eq_ref` → good, uses index

---

### 🧱 Step 5: Apply Index Improvements

```sql
CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_bookings_property_id ON bookings(property_id);
CREATE INDEX idx_payments_booking_id ON payments(booking_id);
```

Indexes make lookups much faster.

---

### 🔄 Step 6: Compare Before and After

Use `EXPLAIN ANALYZE` again to see improvements:

* Type changes from `ALL` to `ref`
* Rows scanned decrease
* Execution time decreases

**Example Report:**

| Step           | Action                | Before                                           | After   |
| -------------- | --------------------- | ------------------------------------------------ | ------- |
| Query run time | Base query (no index) | 2.4 sec                                          | 0.3 sec |
| Rows scanned   | 50,000                | 1,200                                            |         |
| Index used     | ❌ None                | ✅ idx_bookings_user_id, idx_bookings_property_id |         |
| Query type     | Table scan            | Index lookup                                     |         |

---

### 🧮 Step 7: Optional - SHOW PROFILE

```sql
SET profiling = 1;
-- Run query
SHOW PROFILES;
SHOW PROFILE FOR QUERY 1;
```

Shows where time was spent (e.g., Sending data, Opening tables).

---

### ✅ Summary

| Step | Action               | Tool/Command                 |
| ---- | -------------------- | ---------------------------- |
| 1    | Monitor queries      | EXPLAIN, SHOW PROFILE        |
| 2    | Check execution plan | EXPLAIN ANALYZE              |
| 3    | Identify slow parts  | Look for ALL / Table scan    |
| 4    | Add indexes          | CREATE INDEX ...             |
| 5    | Test again           | Compare with EXPLAIN ANALYZE |
| 6    | Report improvements  | Record time & rows scanned   |

