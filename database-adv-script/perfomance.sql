-- Initial complex query (unoptimized)
SELECT b.booking_id, u.name, p.location, pay.amount, pay.status
FROM bookings b
JOIN users u ON b.user_id = u.user_id
JOIN properties p ON b.property_id = p.property_id
JOIN payments pay ON b.booking_id = pay.booking_id;

-- Use EXPLAIN to check performance
-- EXPLAIN SELECT ... (same query);
EXPLAIN (ANALYZE, FORMAT TEXT)

SELECT
    b.booking_id,
    b.start_date,
    b.end_date,
    -- User Details
    u.user_id,
    u.first_name AS user_first_name,
    u.last_name AS user_last_name,
    u.email AS user_email,
    -- Property Details
    p.property_id,
    p.property_name,
    p.city AS property_city,
    p.price_per_night,
    -- Payment Details
    pm.payment_id,
    pm.amount AS payment_amount,
    pm.payment_date,
    pm.payment_method

FROM
    Booking b
JOIN
    Property p ON b.property_id = p.property_id
WHERE
    b.user_id = 1001 -- Filter by User ID
    AND b.start_date >= '2025-10-01' -- Filter by Date Range
ORDER BY
    b.start_date DESC;