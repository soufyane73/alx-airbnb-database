# Partition Performance Analysis

## Background

The `Booking` table was identified as large, leading to slow query performance. To address this, we implemented partitioning based on the `start_date` column.

## Partitioning Implementation

The following partitions were created for the `Booking` table:

- **Booking2023**: Contains bookings from January 1, 2023, to December 31, 2023.
- **Booking2024**: Contains bookings from January 1, 2024, to December 31, 2024.

## Performance Testing

### Query Before Partitioning

- Example Query:
  ```sql
  SELECT *
  FROM Booking
  WHERE start_date BETWEEN '2023-01-01' AND '2023-12-31';
  # Performance Monitoring and Refinement

## Query Analysis

### Frequently Used Queries

1. **Fetch Bookings by User**
   ```sql
   EXPLAIN ANALYZE
   SELECT *
   FROM Booking
   WHERE user_id = 1;
