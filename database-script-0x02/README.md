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
- Add **sample data** to simulate real-world Airbnb usage.

---

## 🧩 Database Entities

### 1️⃣ Users

| Attribute     | Type                     | Description           |
| ------------- | ------------------------ | --------------------- |
| user_id       | CHAR(36), PK             | Unique user ID (UUID) |
| first_name    | VARCHAR(100)             | User’s first name     |
| last_name     | VARCHAR(100)             | User’s last name      |
| email         | VARCHAR(150), UNIQUE     | User email            |
| password_hash | VARCHAR(255)             | Hashed password       |
| phone_number  | VARCHAR(20)              | Optional phone number |
| role          | ENUM(guest, host, admin) | Defines user role     |
| created_at    | TIMESTAMP                | Creation time         |

### 2️⃣ Properties

| Attribute       | Type                         | Description               |
| --------------- | ---------------------------- | ------------------------- |
| property_id     | CHAR(36), PK                 | Unique property ID (UUID) |
| host_id         | CHAR(36), FK → users.user_id | Property owner            |
| name            | VARCHAR(150)                 | Property title            |
| description     | TEXT                         | Details of the property   |
| location        | VARCHAR(255)                 | Address or city           |
| price_per_night | DECIMAL(10,2)                | Price per night           |
| created_at      | TIMESTAMP                    | Created date              |
| updated_at      | TIMESTAMP                    | Updated automatically     |

### 3️⃣ Bookings

| Attribute   | Type                                  | Description                |
| ----------- | ------------------------------------- | -------------------------- |
| booking_id  | CHAR(36), PK                          | Unique booking ID (UUID)   |
| property_id | CHAR(36), FK → properties.property_id | Booked property            |
| user_id     | CHAR(36), FK → users.user_id          | Guest who made the booking |
| start_date  | DATE                                  | Booking start date         |
| end_date    | DATE                                  | Booking end date           |
| total_price | DECIMAL(10,2)                         | Total booking price        |
| status      | ENUM(pending, confirmed, canceled)    | Booking status             |
| created_at  | TIMESTAMP                             | Booking creation date      |

### 4️⃣ Payments

| Attribute      | Type                               | Description              |
| -------------- | ---------------------------------- | ------------------------ |
| payment_id     | CHAR(36), PK                       | Unique payment ID (UUID) |
| booking_id     | CHAR(36), FK → bookings.booking_id | Linked booking           |
| amount         | DECIMAL(10,2)                      | Payment amount           |
| payment_date   | TIMESTAMP                          | Date of payment          |
| payment_method | ENUM(credit_card, paypal, stripe)  | Payment type             |

### 5️⃣ Reviews

| Attribute   | Type                                  | Description             |
| ----------- | ------------------------------------- | ----------------------- |
| review_id   | CHAR(36), PK                          | Unique review ID (UUID) |
| property_id | CHAR(36), FK → properties.property_id | Reviewed property       |
| user_id     | CHAR(36), FK → users.user_id          | Reviewer (guest)        |
| rating      | INT CHECK (1–5)                       | Rating value            |
| comment     | TEXT                                  | Review text             |
| created_at  | TIMESTAMP                             | Creation date           |

---

## 🔗 Relationships Summary

| Relationship       | Type  | Description                           |
| ------------------ | ----- | ------------------------------------- |
| User → Property    | 1 : N | One host can own many properties      |
| User → Booking     | 1 : N | One guest can make many bookings      |
| Property → Booking | 1 : N | A property can have multiple bookings |
| Booking → Payment  | 1 : 1 | One payment per booking               |
| Property → Review  | 1 : N | One property can have many reviews    |
| User → Review      | 1 : N | One guest can leave many reviews      |

---

## 🧠 Normalization (3NF)

All tables are normalized up to **Third Normal Form (3NF):**

1️⃣ **1NF** — All attributes are atomic.  
2️⃣ **2NF** — Non-key attributes depend on the full primary key.  
3️⃣ **3NF** — No transitive dependencies exist.

✅ This ensures **no data redundancy** and **consistent relationships**.

---

## ⚙️ SQL Implementation

The full SQL schema is defined in:

📄 **`create_tables.sql`**

It includes:

- `UUID()` for unique record IDs
- `FOREIGN KEY` constraints for referential integrity
- `CREATE INDEX` statements for query performance
- `ENUM` and `CHECK` constraints for data consistency
- `TIMESTAMP` for tracking record creation and updates

---

## 💾 Sample Data — `insert_sample_data.sql`

The following file adds **real-world sample data** for testing and demonstration.

### 🧠 Example Data

- **Users:** Guests, hosts, and admin accounts.
- **Properties:** Listings by hosts (apartments, villas, cabins).
- **Bookings:** Guests book properties for date ranges.
- **Payments:** Each booking has one payment.
- **Reviews:** Guests leave ratings and feedback for properties.

### ⚙️ Execution

```bash
# Run after creating tables
mysql -u root -p
SOURCE insert_sample_data.sql;
```
