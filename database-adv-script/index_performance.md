# Index Performance Analysis

## Indexes Created

1. **User Table**:
   - `idx_users_email`: Index on `email` for faster lookups.

2. **Booking Table**:
   - `idx_booking_user_id`: Index on `user_id` for JOINs with Users.
   - `idx_booking_property_id`: Index on `property_id` for JOINs with Property.

3. **Property Table**:
   - `idx_property_host_id`: Index on `host_id` for JOINs with Users.

## Performance Measurement

### Query Performance Before Adding Indexes

- Example Query: 
  ```sql
  EXPLAIN SELECT * FROM Booking WHERE user_id = 'some_user_id';
