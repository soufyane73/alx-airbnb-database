-- Create indexes for optimization

-- User table indexes
CREATE INDEX idx_users_email ON Users(email);

-- Booking table indexes
CREATE INDEX idx_booking_user_id ON Booking(user_id);
CREATE INDEX idx_booking_property_id ON Booking(property_id);

-- Property table indexes
CREATE INDEX idx_property_host_id ON Property(host_id);

EXPLAIN SELECT * FROM Booking WHERE user_id = 'some_user_id';
