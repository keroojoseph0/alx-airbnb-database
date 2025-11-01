USE airbnb_db;

-- ====================================
-- query that retrieves all bookings along with the user details, property details, and payment details
-- ====================================

SELECT 
  b.booking_id,
  b.start_date,
  u.first_name,
  p.name AS property_name,
  pay.amount
FROM bookings b
INNER JOIN users u ON b.user_id = u.user_id
INNER JOIN properties p ON b.property_id = p.property_id
INNER JOIN payments pay ON b.booking_id = pay.booking_id;


EXPLAIN 
SELECT 
  b.booking_id,
  b.start_date,
  u.first_name,
  p.name AS property_name,
  pay.amount
FROM bookings b
INNER JOIN users u ON b.user_id = u.user_id
INNER JOIN properties p ON b.property_id = p.property_id
INNER JOIN payments pay ON b.booking_id = pay.booking_id;


EXPLAIN ANALYZE 
SELECT 
  b.booking_id,
  b.start_date,
  u.first_name,
  p.name AS property_name,
  pay.amount
FROM bookings b
INNER JOIN users u ON b.user_id = u.user_id
INNER JOIN properties p ON b.property_id = p.property_id
INNER JOIN payments pay ON b.booking_id = pay.booking_id;



-- For the users table
CREATE INDEX idx_users_user_id ON users(user_id);

-- For the properties table
CREATE INDEX idx_properties_property_id ON properties(property_id);

-- For the payments table
CREATE INDEX idx_payments_booking_id ON payments(booking_id);



