USE airbnb_db;

-- =====================================
-- use INNER JOIN to retrieve all bookings and the respective users who made
-- =====================================

SELECT b.booking_id, u.first_name, u.last_name FROM bookings b INNER JOIN  users u;


-- =====================================
-- use LEFT JOIN to retrieve all properties and their reviews, including properties that have no reviews
-- =====================================

SELECT p.property_id, r.review_id FROM properties p LEFT JOIN reviews r USING(property_id);

-- =====================================
-- use  FULL OUTER JOIN to retrieve all users and all bookings, even if the user has no booking 
-- or a booking is not linked to a user.
-- =====================================

SELECT u.user_id, b.booking_id FROM users u RIGHT JOIN bookings b USING(user_id) UNION 
SELECT u.user_id, b.booking_id FROM users u LEFT JOIN bookings b USING(user_id);

