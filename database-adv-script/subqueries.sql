USE airbnb_db;

-- ==================================
-- query to find all properties where the average rating is greater than 4.0 using a subquery.
-- ==================================

SELECT property_id
FROM (
    SELECT property_id, AVG(rating) AS avg_rating
    FROM reviews
    GROUP BY property_id
) AS property_avg
WHERE avg_rating > 4.0;

-- ==================================
-- find users who have made more than 3 bookings.
-- ==================================

SELECT user_id 
FROM (
	SELECT booking_id, user_id, count(user_id) AS num_of_booking
    FROM bookings
    GROUP BY booking_id
    ) AS booking_count
WHERE num_of_booking > 3;

