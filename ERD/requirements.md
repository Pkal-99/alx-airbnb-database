# Airbnb Database Design
# Entity Relation Diagram
<img width="1073" height="789" alt="ERD Air BnB Database" src="https://github.com/user-attachments/assets/40c2ddcd-e4f7-44eb-a71d-c7fbb54fffdf" />
# Entities

    User: Stores guests, hosts, admins.
    Property: Listings created by hosts.
    Booking: Reservations made by users for properties.
    Payment: Payments made for bookings.
    Message: Communication between users.
    Review: Feedback from users on properties.

# Key Constraints
# User Table

    user_id: Primary Key (UUID).
    email: UNIQUE constraint.
    first_name, last_name, email, password_hash, role: NOT NULL.
# Property Table

    property_id: Primary Key (UUID).
    host_id: Foreign Key → User(user_id).
    name, location, price_per_night: NOT NULL.
# Booking Table

    booking_id: Primary Key (UUID).
    property_id: Foreign Key → Property(property_id).
    user_id: Foreign Key → User(user_id).
    status: ENUM(pending, confirmed, canceled) with NOT NULL constraint.
# Message Table

    message_id: Primary Key (UUID).
    sender_id: Foreign Key → User(user_id).
    recipient_id: Foreign Key → User(user_id).
    message_body: NOT NULL.
# Review Table

    review_id: Primary Key (UUID).
    property_id: Foreign Key → Property(property_id).
    user_id: Foreign Key → User(user_id).
    rating: CHECK (between 1 and 5), NOT NULL.
# Payment Table

    payment_id: Primary Key (UUID).
    booking_id: Foreign Key → Booking(booking_id).
    Ensures each payment is linked to a valid booking.
# Indexing
* Primary Keys: Indexed automatically (user_id, property_id, booking_id, payment_id, review_id, message_id).
* Additional Indexes: 

    User.email → speeds up login and uniqueness checks.
    Property.property_id → faster joins with bookings.
    Booking.property_id → improves query performance on reservations.
    Payment.booking_id → ensures quick lookup for payments.
# Relationship 
* User and Booking:
One-to-many. A User (as a guest) can make multiple Bookings, but each Booking is made by only one Guest.
* Property and Booking:
One-to-many. A Property can have multiple Bookings, but each Booking is for only one Property.
* User and Property:
One-to-many. A User can be a Host and own multiple Properties, but each Property is owned by only one Host
* User and Message:
One-to-many (sender) and one-to-many (receiver). A User can send multiple Messages and receive multiple Messages.
* Booking and Message:
One-to-many (optional). Messages can be related to a specific Booking for easier conversation tracking.
* User and Review:
One-to-many. A User (as a guest) can write multiple Reviews.
* Booking and Review:
One-to-one. Each Booking can have one Review associated with it (after the stay).




