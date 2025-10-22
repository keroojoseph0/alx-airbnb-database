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
