# Advanced SQL Scripts – Airbnb Clone

## Overview

This directory contains advanced SQL scripts for joins, subqueries, aggregation, indexing, optimization, partitioning, and performance monitoring.

## Structure

- **joins_queries.sql** – Practice inner, left, and full outer joins.
- **subqueries.sql** – Includes correlated and non-correlated subqueries.
- **aggregations_and_window_functions.sql** – Uses COUNT, GROUP BY, and window functions.
- **database_index.sql** – Index creation commands for optimization.
- **index_performance.md** – Performance comparison before and after indexing.
- **perfomance.sql** – Complex query for optimization testing.
- **optimization_report.md** – Analysis and improvements.
- **partitioning.sql** – Table partitioning by date.
- **partition_performance.md** – Performance improvement report.
- **performance_monitoring.md** – Query profiling and tuning documentation.

## Usage

1. Load schema and seed data:
   ```sql
   SOURCE database-script-0x01/schema.sql;
   SOURCE database-script-0x02/seed.sql;
   ```
