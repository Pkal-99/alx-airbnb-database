-- Retrieve all bookings and the respective users who made those bookings
SELECT b.booking_id, b.property_id, b.start_date, b.end_date, u.user_id, u.name, u.email
FROM bookings b
INNER JOIN users u ON b.user_id = u.user_id;

-- Retrieve all properties and their reviews (include properties with no reviews)
SELECT p.property_id, p.location, r.review_id, r.rating, r.comment
FROM properties p
LEFT JOIN reviews r ON p.property_id = r.property_id;

-- Retrieve all users and all bookings, even if not linked
SELECT u.user_id, u.name, b.booking_id, b.property_id
FROM users u
LEFT JOIN bookings b ON u.user_id = b.user_id
UNION
SELECT u.user_id, u.name, b.booking_id, b.property_id
FROM users u
RIGHT JOIN bookings b ON u.user_id = b.user_id;
