USE airbnb_db;

-- =============================
-- query to find the total number of bookings made by each user, using the COUNT function and GROUP BY clause.
-- =============================

SELECT booking_id, COUNT(user_id) 
FROM bookings 
GROUP BY booking_id;

-- =============================
--  window function (ROW_NUMBER, RANK) to rank properties based on the total number of bookings they have received.
-- =============================

SELECT 
    property_id,
    COUNT(booking_id) AS total_bookings,
    RANK() OVER (ORDER BY COUNT(booking_id) DESC) AS rank_by_bookings,
    ROW_NUMBER() OVER (ORDER BY COUNT(booking_id) DESC) AS rows_number
FROM bookings
GROUP BY property_id;