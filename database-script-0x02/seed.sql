-- ===========================================
-- 🏡 ALX Airbnb Database — Sample Data Script
-- ===========================================

-- Make sure you have already run `create_tables.sql` before executing this!
USE airbnb_db;
-- ===========================================
-- 👤 USERS
-- ===========================================
INSERT INTO users (user_id, first_name, last_name, email, password_hash, phone_number, role, created_at)
VALUES
(UUID(), 'Alice', 'Johnson', 'alice.johnson@example.com', 'hashed_password_1', '+201001234567', 'guest', NOW()),
(UUID(), 'Michael', 'Smith', 'michael.smith@example.com', 'hashed_password_2', '+201002345678', 'host', NOW()),
(UUID(), 'Sarah', 'Lee', 'sarah.lee@example.com', 'hashed_password_3', '+201003456789', 'host', NOW()),
(UUID(), 'David', 'Brown', 'david.brown@example.com', 'hashed_password_4', '+201004567890', 'guest', NOW()),
(UUID(), 'Admin', 'User', 'admin@example.com', 'hashed_password_5', NULL, 'admin', NOW());

-- ===========================================
-- 🏠 PROPERTIES
-- ===========================================
-- First, retrieve host UUIDs (you can adapt if needed):
-- SELECT user_id, first_name FROM users WHERE role = 'host';

INSERT INTO properties (property_id, host_id, name, description, location, price_per_night, created_at, updated_at)
VALUES
(UUID(), 
 (SELECT user_id FROM users WHERE email = 'michael.smith@example.com'),
 'Seaside Villa',
 'Luxury villa with ocean view and private pool.',
 'Alexandria, Egypt',
 250.00, NOW(), NOW()),

(UUID(), 
 (SELECT user_id FROM users WHERE email = 'sarah.lee@example.com'),
 'Downtown Apartment',
 'Cozy apartment in the city center with modern amenities.',
 'Cairo, Egypt',
 120.00, NOW(), NOW()),

(UUID(), 
 (SELECT user_id FROM users WHERE email = 'sarah.lee@example.com'),
 'Mountain Cabin',
 'Quiet cabin surrounded by nature, perfect for relaxation.',
 'Saint Catherine, Egypt',
 180.00, NOW(), NOW());

-- ===========================================
-- 📅 BOOKINGS
-- ===========================================
-- Get property IDs and user IDs to link bookings.
-- SELECT property_id, name FROM properties;
-- SELECT user_id, first_name FROM users WHERE role = 'guest';

INSERT INTO bookings (booking_id, property_id, user_id, start_date, end_date, total_price, status, created_at)
VALUES
(UUID(),
 (SELECT property_id FROM properties WHERE name = 'Seaside Villa'),
 (SELECT user_id FROM users WHERE email = 'alice.johnson@example.com'),
 '2025-11-10', '2025-11-15', 1250.00, 'confirmed', NOW()),

(UUID(),
 (SELECT property_id FROM properties WHERE name = 'Downtown Apartment'),
 (SELECT user_id FROM users WHERE email = 'david.brown@example.com'),
 '2025-12-01', '2025-12-05', 480.00, 'pending', NOW()),

(UUID(),
 (SELECT property_id FROM properties WHERE name = 'Mountain Cabin'),
 (SELECT user_id FROM users WHERE email = 'alice.johnson@example.com'),
 '2025-12-20', '2025-12-25', 900.00, 'confirmed', NOW());

-- ===========================================
-- 💳 PAYMENTS
-- ===========================================
-- SELECT booking_id, total_price FROM bookings;

INSERT INTO payments (payment_id, booking_id, amount, payment_date, payment_method)
VALUES
(UUID(),
 (SELECT booking_id FROM bookings WHERE total_price = 1250.00),
 1250.00, NOW(), 'credit_card'),

(UUID(),
 (SELECT booking_id FROM bookings WHERE total_price = 900.00),
 900.00, NOW(), 'paypal');

-- ===========================================
-- 🌟 REVIEWS
-- ===========================================
-- SELECT property_id, name FROM properties;
-- SELECT user_id, first_name FROM users WHERE role = 'guest';

INSERT INTO reviews (review_id, property_id, user_id, rating, comment, created_at)
VALUES
(UUID(),
 (SELECT property_id FROM properties WHERE name = 'Seaside Villa'),
 (SELECT user_id FROM users WHERE email = 'alice.johnson@example.com'),
 5, 'Amazing view and great hospitality. Highly recommend!', NOW()),

(UUID(),
 (SELECT property_id FROM properties WHERE name = 'Mountain Cabin'),
 (SELECT user_id FROM users WHERE email = 'alice.johnson@example.com'),
 4, 'Very peaceful and beautiful, but a bit hard to reach.', NOW()),

(UUID(),
 (SELECT property_id FROM properties WHERE name = 'Downtown Apartment'),
 (SELECT user_id FROM users WHERE email = 'david.brown@example.com'),
 5, 'Clean, comfortable, and close to everything.', NOW());
 
