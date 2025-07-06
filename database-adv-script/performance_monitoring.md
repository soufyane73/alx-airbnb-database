# Performance Monitoring and Refinement

## Query Analysis

### Frequently Used Queries

1. **Fetch Bookings by User**
   ```sql
   EXPLAIN ANALYZE
   SELECT *
   FROM Booking
   WHERE user_id = 1;
