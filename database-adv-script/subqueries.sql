-- Find properties with an average review rating greater than 4.0
SELECT property_id, location
FROM properties
WHERE property_id IN (
  SELECT property_id
  FROM reviews
  GROUP BY property_id
  HAVING AVG(rating) > 4.0
);

-- Retrieve users who have made more than 3 bookings
SELECT u.user_id, u.name, u.email
FROM users u
WHERE (
  SELECT COUNT(*)
  FROM bookings b
  WHERE b.user_id = u.user_id
) > 3;
