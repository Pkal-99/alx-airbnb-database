-- PARTITIONING SETUP FOR THE 'Booking' TABLE
-- Partition the Booking table by start_date (e.g., yearly)
-- -----------------------------------------------------------------------------
-- 1. Rename the existing Booking table (if it exists) or create a new one.
-- If creating new, use CREATE TABLE ...
DROP TABLE IF EXISTS Booking;

-- 2. Create the main (parent) partitioned table
CREATE TABLE Booking (
    booking_id INT NOT NULL,
    user_id INT NOT NULL,
    property_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL(10, 2)
   
) PARTITION BY RANGE (start_date);

-- 3. Create Partitions (Child Tables)
-- Each partition covers a distinct, non-overlapping range of dates.

-- Partition for 2023 bookings
CREATE TABLE booking_2023 PARTITION OF Booking
    FOR VALUES FROM ('2023-01-01') TO ('2024-01-01');

-- Partition for 2024 bookings
CREATE TABLE booking_2024 PARTITION OF Booking
    FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

-- Partition for 2025 bookings (Current year)
CREATE TABLE booking_2025 PARTITION OF Booking
    FOR VALUES FROM ('2025-01-01') TO ('2026-01-01');

-- 4. Create a Default Partition for any unforeseen dates (Highly Recommended)
CREATE TABLE booking_default PARTITION OF Booking DEFAULT;

-- 5. Re-apply Foreign Key Indexes on the Parent Table (These are inherited by children)
-- These were already planned, but are crucial for join performance!
CREATE INDEX idx_booking_user_id ON Booking (user_id);
CREATE INDEX idx_booking_property_id ON Booking (property_id);

EXPLAIN ANALYZE
SELECT *
FROM Booking
WHERE start_date BETWEEN '2025-01-01' AND '2025-01-31';