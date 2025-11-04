
-- Retrieve all bookings and the respective users who made those bookings
SELECT b.booking_id, b.property_id, b.start_date, b.end_date, u.user_id, u.name, u.email
FROM bookings b
INNER JOIN users u ON b.user_id = u.user_id;

-- Retrieve all properties and their reviews (include properties with no reviews)
SELECT p.property_id,p.description, p.location, p.pricepernight r.review_id, r.rating, r.comment
FROM properties p
LEFT JOIN reviews r ON p.property_id = r.property_id
ORDER BY p.property_id;

-- Retrieve all users and all bookings, even if not linked
SELECT
    u.user_id,
    u.username, -- Or other user details
    b.booking_id,
    b.booking_date, -- Or other booking details
    b.amount
FROM
    users AS u
FULL OUTER JOIN
    bookings AS b
ON
    u.user_id = b.user_id;
