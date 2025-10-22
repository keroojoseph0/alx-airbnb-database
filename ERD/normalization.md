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

| Table        | Validation                                                                              | Result |
| ------------ | --------------------------------------------------------------------------------------- | ------ |
| **User**     | All fields depend on `user_id`.                                                         | ✅     |
| **Property** | All attributes depend on `property_id`; `host_id` is a valid FK.                        | ✅     |
| **Booking**  | All attributes depend on `booking_id`; `total_price` is a derived field but acceptable. | ✅     |
| **Payment**  | Attributes depend on `payment_id`.                                                      | ✅     |
| **Review**   | All attributes depend on `review_id`.                                                   | ✅     |

✅ The database meets 3NF.

---

## Conclusion

The Airbnb database design is **fully normalized up to the Third Normal Form (3NF)**.

- No redundant data.
- Strong referential integrity through foreign keys.
- Efficient and scalable for production systems.
