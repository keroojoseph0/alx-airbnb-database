# 🏡 ALX Airbnb Database Project

## 📘 Overview

This project is a **relational database system** designed for an **Airbnb-style platform**, developed as part of the **ALX Backend Engineering track**.  
It models how users, properties, bookings, payments, and reviews interact in a real-world booking platform.

The database ensures **data integrity**, **scalability**, and **optimized performance** through normalization (up to **Third Normal Form**) and proper **indexing**.

---

## 🎯 Objectives

- Design an **Entity-Relationship Diagram (ERD)** for the Airbnb database.  
- Apply **normalization principles** (up to **3NF**) to remove redundancy.  
- Implement the design using **MySQL** with proper constraints and relationships.  
- Optimize performance using **UUIDs** and **Indexes**.  

---

## 🧩 Database Entities

### 1️⃣ Users
Represents all registered users — guests, hosts, and admins.

| Attribute | Type | Description |
|------------|------|-------------|
| user_id | CHAR(36), PK | Unique user ID (UUID) |
| first_name | VARCHAR(100) | User’s first name |
| last_name | VARCHAR(100) | User’s last name |
| email | VARCHAR(150), UNIQUE | User email |
| password_hash | VARCHAR(255) | Hashed password |
| phone_number | VARCHAR(20) | Optional phone number |
| role | ENUM(guest, host, admin) | Defines user role |
| created_at | TIMESTAMP | Creation time |

---

### 2️⃣ Properties
Represents listings posted by hosts.

| Attribute | Type | Description |
|------------|------|-------------|
| property_id | CHAR(36), PK | Unique property ID (UUID) |
| host_id | CHAR(36), FK → users.user_id | Property owner |
| name | VARCHAR(150) | Property title |
| description | TEXT | Details of the property |
| location | VARCHAR(255) | Address or city |
| price_per_night | DECIMAL(10,2) | Price per night |
| created_at | TIMESTAMP | Created date |
| updated_at | TIMESTAMP | Updated automatically |

---

### 3️⃣ Bookings
Links guests with properties for specific dates.

| Attribute | Type | Description |
|------------|------|-------------|
| booking_id | CHAR(36), PK | Unique booking ID (UUID) |
| property_id | CHAR(36), FK → properties.property_id | Booked property |
| user_id | CHAR(36), FK → users.user_id | Guest who made the booking |
| start_date | DATE | Booking start date |
| end_date | DATE | Booking end date |
| total_price | DECIMAL(10,2) | Total booking price |
| status | ENUM(pending, confirmed, canceled) | Booking status |
| created_at | TIMESTAMP | Booking creation date |

---

### 4️⃣ Payments
Tracks all booking payments.

| Attribute | Type | Description |
|------------|------|-------------|
| payment_id | CHAR(36), PK | Unique payment ID (UUID) |
| booking_id | CHAR(36), FK → bookings.booking_id | Linked booking |
| amount | DECIMAL(10,2) | Payment amount |
| payment_date | TIMESTAMP | Date of payment |
| payment_method | ENUM(credit_card, paypal, stripe) | Payment type |

---

### 5️⃣ Reviews
Stores feedback and ratings for properties.

| Attribute | Type | Description |
|------------|------|-------------|
| review_id | CHAR(36), PK | Unique review ID (UUID) |
| property_id | CHAR(36), FK → properties.property_id | Reviewed property |
| user_id | CHAR(36), FK → users.user_id | Reviewer (guest) |
| rating | INT CHECK (1–5) | Rating value |
| comment | TEXT | Review text |
| created_at | TIMESTAMP | Creation date |

---

## 🔗 Relationships Summary

| Relationship | Type | Description |
|---------------|------|-------------|
| User → Property | 1 : N | One host can own many properties |
| User → Booking | 1 : N | One guest can make many bookings |
| Property → Booking | 1 : N | A property can have multiple bookings |
| Booking → Payment | 1 : 1 | One payment per booking |
| Property → Review | 1 : N | One property can have many reviews |
| User → Review | 1 : N | One guest can leave many reviews |

---

## 🧠 Normalization (3NF)

All tables are normalized up to the **Third Normal Form (3NF)**:

1️⃣ **1NF** — All attributes are atomic.  
2️⃣ **2NF** — All non-key attributes depend entirely on their primary key.  
3️⃣ **3NF** — No transitive dependencies exist.  

✅ This ensures **no data redundancy** and **clean relationships**.

---

## ⚙️ SQL Implementation

The full SQL schema is defined in:

📄 **`create_tables.sql`**

It includes:
- `UUID()` for unique record IDs  
- `FOREIGN KEY` constraints for referential integrity  
- `CREATE INDEX` statements for query performance  
- `ENUM` and `CHECK` constraints for data consistency  
- `TIMESTAMP` for automatic tracking of record creation and updates  

---

## 🚀 Setup Instructions

### 🧰 Prerequisites
- MySQL 8.0+
- A terminal or MySQL Workbench

### 🧩 Steps
```bash
# 1. Clone the repository
git clone https://github.com/<your-username>/alx-airbnb-database.git
cd alx-airbnb-database

# 2. Start MySQL and log in
mysql -u root -p

# 3. Run the SQL script
SOURCE create_tables.sql;

# 4. Verify the tables
SHOW TABLES;

