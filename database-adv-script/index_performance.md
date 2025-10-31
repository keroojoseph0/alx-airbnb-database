# ⚡ Database Index Optimization

## 🧠 Objective
Identify and create **indexes** to improve SQL **query performance**.

---

## 📝 Instructions

### 1. Identify High-Usage Columns
Review your **User**, **Booking**, and **Property** tables to find columns frequently used in:
- **WHERE** clauses (for filtering)
- **JOIN** conditions (for table linking)
- **ORDER BY** clauses (for sorting)

💡 Examples of high-usage columns:
- `users.email`, `users.id`
- `bookings.user_id`, `bookings.property_id`, `bookings.date`
- `properties.id`, `properties.city`

---

### 2. Create Indexes
Use the `CREATE INDEX` command to add indexes on the identified columns.  
Save all SQL statements in a file named **`database_index.sql`**.

#### ✅ Example SQL Commands
```sql
-- Create index on users table
CREATE INDEX idx_users_email ON users(email);

-- Create index on bookings table
CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_bookings_property_id ON bookings(property_id);
CREATE INDEX idx_bookings_date ON bookings(date);

-- Create index on properties table
CREATE INDEX idx_properties_city ON properties(city);

