CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- Insert locations
INSERT INTO "locations" (location_id, country, state, city, postal_code, lat, lng) VALUES
	(uuid_generate_v4(), 'ETH01', 'ETHIOPIA', 'Addis Ababa', '01000', 9.0192, 38.7525),
	(uuid_generate_v4(), 'ETH02', 'ETHIOPIA', 'Hawasa', '01010', 7.0477, 38.4958),
	(uuid_generate_v4(), 'ETH02', 'ETHIOPIA', 'Mekelle', '01050', -0.267643, 45.737534);

-- Insert users with different roles
INSERT INTO users (user_id, first_name, last_name, email, password_hash, phone_number, role) VALUES
    (uuid_generate_v4(), 'Matiwos', 'Ayele', 'kal33@gmail.com', 'hashed_password_1', '+25109456789', 'host'),
    (uuid_generate_v4(), 'Selamawit', 'Teshome', 'Selipapa@gmail.com', 'hashed_password_2', '+25109654321', 'guest'),
    (uuid_generate_v4(), 'Selomon', 'Kebede', 'sol2001@gmail.com.com', 'hashed_password_3', '+25109533444', 'host'),
    (uuid_generate_v4(), 'Wayne', 'Rooney', 'Waza2008@gmail.com', 'hashed_password_4', '+3544332211', 'guest'),
    (uuid_generate_v4(), 'Kaleab', 'Ayele', 'kal0009@gmail.com', 'hashed_password_5', '+25109877665', 'admin');

-- Insert properties
INSERT INTO properties (property_id, host_id, name, description, location, pricepernight) VALUES
    (uuid_generate_v4(), 
     (SELECT user_id FROM users WHERE first_name = 'Matiwos'), 
     'Cozy SF Loft', 
     'Beautiful downtown loft with amazing city views', 
     (SELECT location_id FROM locations WHERE city = 'Addis Ababa'), 
     7000.00),
    (uuid_generate_v4(), 
     (SELECT user_id FROM users WHERE first_name = 'Solomon'), 
     'Welosefer Studio Apartment', 
     'Modern studio in the heart of Hawasa', 
     (SELECT location_id FROM locations WHERE city = 'Hawasa'), 
     10000.00),
    (uuid_generate_v4(), 
     (SELECT user_id FROM users WHERE first_name = 'Matiwos'), 
     'City View Condo', 
     'Spacious condo with panoramic ocean views', 
     (SELECT location_id FROM locations WHERE city = 'Mekelle'), 
     40000.00);

-- Insert bookings
INSERT INTO bookings (booking_id, property_id, user_id, start_date, end_date, total_price, status) VALUES
    (uuid_generate_v4(), 
     (SELECT property_id FROM properties WHERE name = 'Cozy SF Loft'), 
     (SELECT user_id FROM users WHERE first_name = 'Wayne'), 
     '2024-07-15', '2024-07-20', 14000.00, 'confirmed'),
    (uuid_generate_v4(), 
     (SELECT property_id FROM properties WHERE name = 'Welosefer Studio Apartment'), 
     (SELECT user_id FROM users WHERE first_name = 'Selamawit'), 
     '2024-07-15', '2024-07-20', 10000.00, 'confirmed');

-- Insert payments
INSERT INTO payments (payment_id, booking_id, amount, payment_method) VALUES
    (uuid_generate_v4(), 
     (SELECT booking_id FROM bookings WHERE total_price = 14000.00), 
     14000, 'credit_card'),
    (uuid_generate_v4(), 
     (SELECT booking_id FROM bookings WHERE total_price = 10000.00), 
     10000.00, 'paypal');

-- Insert reviews
INSERT INTO reviews (review_id, property_id, user_id, rating, comment) VALUES
    (uuid_generate_v4(), 
     (SELECT property_id FROM properties WHERE name = 'Cozy SF Loft'), 
     (SELECT user_id FROM users WHERE first_name = 'Wayne'), 
     4, 'Great stay, very comfortable and clean!'),
    (uuid_generate_v4(), 
     (SELECT property_id FROM properties WHERE name = 'Welosefer Studio Apartment'), 
     (SELECT user_id FROM users WHERE first_name = 'Selamawit'), 
     5, 'Perfect location and amazing amenities!');

-- Insert messages
INSERT INTO messages (message_id, sender_id, recipient_id, message_body) VALUES
    (uuid_generate_v4(), 
     (SELECT user_id FROM users WHERE first_name = 'Wayne'), 
     (SELECT user_id FROM users WHERE first_name = 'Matiwos'), 
     'Hi, I have a question about the booking.'),
    (uuid_generate_v4(), 
     (SELECT user_id FROM users WHERE first_name = 'Selamawit'), 
     (SELECT user_id FROM users WHERE first_name = 'Solomon'), 
     'Can you provide more details about the property?');