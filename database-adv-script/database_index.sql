-- Index on foreign key relationships
CREATE INDEX idx_booking_user ON bookings(user_id);
CREATE INDEX idx_booking_property ON bookings(property_id);
CREATE INDEX idx_review_property ON reviews(property_id);

-- Index for frequent filters or sorting
CREATE INDEX idx_property_location ON properties(location);
CREATE INDEX idx_user_email ON users(email);
