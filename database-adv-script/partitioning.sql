-- Partitioning the Booking table based on start_date

-- Assuming the Booking table is already created, we will create a new partitioned table
CREATE TABLE BookingPartitioned (
    booking_id SERIAL PRIMARY KEY,
    user_id INT,
    property_id INT,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    amount DECIMAL(10, 2),
    -- other relevant columns
    CHECK (start_date >= '2020-01-01' AND start_date < '2025-01-01')  -- Example check constraint
) PARTITION BY RANGE (start_date);

-- Creating partitions for the Booking table
CREATE TABLE Booking2023 PARTITION OF BookingPartitioned
    FOR VALUES FROM ('2023-01-01') TO ('2024-01-01');

CREATE TABLE Booking2024 PARTITION OF BookingPartitioned
    FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

-- Add more partitions as needed for other years
-- Test query for fetching bookings by date range
SELECT *
FROM BookingPartitioned
WHERE start_date BETWEEN '2023-01-01' AND '2023-12-31';
-- Example Query 1: Fetching bookings by user
EXPLAIN ANALYZE
SELECT *
FROM Booking
WHERE user_id = 1;

-- Example Query 2: Fetching bookings by date
EXPLAIN ANALYZE
SELECT *
FROM Booking
WHERE start_date BETWEEN '2023-01-01' AND '2023-12-31';
