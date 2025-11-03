# Index Performance Report

## Before Indexing

Running queries on bookings by user or property required full table scans.
`EXPLAIN` showed high row read counts and no index usage.

## After Indexing

Added indexes on `bookings.user_id`, `bookings.property_id`, and `reviews.property_id`.
`EXPLAIN` now shows index usage, reducing execution cost significantly.

**Example:**
Before → ~10,000 rows scanned  
After → ~120 rows scanned
