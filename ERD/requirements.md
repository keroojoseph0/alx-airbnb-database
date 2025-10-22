# DataScape: Mastering Database Design

## 0. Define Entities and Relationships in ER Diagram

## Objective

Create an Entity-Relationship (ER) diagram based on the Airbnb database schema.

## Entities and Attributes

### User

- user_id (PK, UUID)
- first_name, last_name, email (unique)
- password_hash
- phone_number
- role (ENUM: guest, host, admin)
- created_at (timestamp)

### Property

- property_id (PK, UUID)
- host_id (FK → User)
- name, description, location
- pricepernight
- created_at, updated_at

### Booking

- booking_id (PK, UUID)
- property_id (FK → Property)
- user_id (FK → User)
- start_date, end_date
- total_price
- status (ENUM: pending, confirmed, canceled)
- created_at

### Payment

- payment_id (PK, UUID)
- booking_id (FK → Booking)
- amount
- payment_date
- payment_method (ENUM: credit_card, paypal, stripe)

### Review

- review_id (PK, UUID)
- property_id (FK → Property)
- user_id (FK → User)
- rating (1–5)
- comment
- created_at

## Relationships

- A User (host) can have many Properties.
- A User (guest) can make many Bookings.
- A Property can have many Bookings.
- Each Booking has one Payment.
- A Property can have many Reviews.
- A User can write many Reviews.

## Files

- ERD/airbnb_erd.drawio
- ERD/airbnb_erd.png

![Airbnb Schema](https://github.com/user-attachments/assets/5080fdf0-853c-4e8a-a6e8-00efdcd7aa41)

# 1. Apply Normalization Principles (Up to 3NF)

## Objective
Ensure that the Airbnb database schema adheres to the Third Normal Form (3NF) by eliminating redundancy and maintaining data integrity.

---

## Step 1: First Normal Form (1NF)
**Rule:** Each column holds atomic values and every record is unique.

**Validation:**
- All attributes (e.g., `email`, `phone_number`, `location`) are atomic.
- Each table has a primary key (`user_id`, `property_id`, etc.).
- No repeating groups or multi-valued attributes.

✅ The database meets 1NF.

---

## Step 2: Second Normal Form (2NF)
**Rule:** Must be in 1NF, and all non-key attributes must depend on the whole primary key.

**Validation:**
- Each table uses a single-column primary key.
- No partial dependencies exist.

✅ The database meets 2NF.

---

## Step 3: Third Normal Form (3NF)
**Rule:** Must be in 2NF, and all non-key attributes must depend directly on the primary key, not on other non-key attributes.

**Validation by Table:**

| Table | Validation | Result |
|--------|-------------|---------|
| **User** | All fields depend on `user_id`. | ✅ |
| **Property** | All attributes depend on `property_id`; `host_id` is a valid FK. | ✅ |
| **Booking** | All attributes depend on `booking_id`; `total_price` is a derived field but acceptable. | ✅ |
| **Payment** | Attributes depend on `payment_id`. | ✅ |
| **Review** | All attributes depend on `review_id`. | ✅ |

✅ The database meets 3NF.

---

## Conclusion
The Airbnb database design is **fully normalized up to the Third Normal Form (3NF)**.

- No redundant data.
- Strong referential integrity through foreign keys.
- Efficient and scalable for production systems.
