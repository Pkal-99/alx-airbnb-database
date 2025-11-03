# Partitioning Performance Report

Partitioned `bookings` by `start_date` year to improve filtering by date range.

Before partitioning: Query on bookings between 2019–2020 scanned full table (~100k rows).  
After partitioning: Query scanned only 2 partitions (~20k rows).

**Improvement:** 80% reduction in scan cost.
