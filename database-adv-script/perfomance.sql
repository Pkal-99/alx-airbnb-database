-- Initial complex query (unoptimized)
SELECT b.booking_id, u.name, p.location, pay.amount, pay.status
FROM bookings b
JOIN users u ON b.user_id = u.user_id
JOIN properties p ON b.property_id = p.property_id
JOIN payments pay ON b.booking_id = pay.booking_id;

-- Use EXPLAIN to check performance
EXPLAIN SELECT ... (same query);
