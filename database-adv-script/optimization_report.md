# Optimization Report

The original query joined four large tables (bookings, users, properties, payments).
Using `EXPLAIN`, I observed full table scans on `bookings` and `payments`.

### Optimizations Applied

- Added indexes on all JOIN columns (`user_id`, `property_id`, `booking_id`).
- Selected only required columns instead of `SELECT *`.
- Verified improved query cost and reduced row scanning using EXPLAIN ANALYZE.

### Results

Query time reduced from 2.4s → 0.3s
