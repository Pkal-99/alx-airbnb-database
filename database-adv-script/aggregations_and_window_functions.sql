--- Count total bookings per user
SELECT u.user_id, u.name, COUNT(b.booking_id) AS total_bookings
FROM users u
LEFT JOIN bookings b ON u.user_id = b.user_id
GROUP BY u.user_id, u.name;


--- Rank properties based on the number of bookings (using ROW_NUMBER and RANK)
SELECT
    p.property_id,
    p.property_name,
    COUNT(b.booking_id) AS total_bookings,
    -- 1. Using RANK(): Skips ranks in case of ties.
    RANK() OVER (ORDER BY COUNT(b.booking_id) DESC) AS property_rank_rank,
    -- 2. Using ROW_NUMBER(): Assigns a unique rank (no ties).
    ROW_NUMBER() OVER (ORDER BY COUNT(b.booking_id) DESC) AS property_rank_row_number
FROM
    properties p
JOIN
    bookings b ON p.property_id = b.property_id
GROUP BY
    p.property_id,
    p.property_name
ORDER BY
    total_bookings DESC;