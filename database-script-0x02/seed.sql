-- Insert Sample Data into Users Table
INSERT INTO Users (user_id, first_name, last_name, email, password_hash, phone_number, role) VALUES
    (uuid_generate_v4(), 'Alice', 'Johnson', 'alice.johnson@example.com', 'hashed_password1', '123-456-7890', 'guest'),
    (uuid_generate_v4(), 'Bob', 'Smith', 'bob.smith@example.com', 'hashed_password2', '234-567-8901', 'host'),
    (uuid_generate_v4(), 'Charlie', 'Brown', 'charlie.brown@example.com', 'hashed_password3', '345-678-9012', 'admin'),
    (uuid_generate_v4(), 'Diana', 'Prince', 'diana.prince@example.com', 'hashed_password4', '456-789-0123', 'guest');

-- Insert Sample Data into Property Table
INSERT INTO Property (property_id, host_id, name, description, location, pricepernight) VALUES
    (uuid_generate_v4(), (SELECT user_id FROM Users WHERE email = 'bob.smith@example.com'), 'Cozy Cottage', 'A lovely cottage in the countryside.', 'Countryside', 100.00),
    (uuid_generate_v4(), (SELECT user_id FROM Users WHERE email = 'bob.smith@example.com'), 'Downtown Apartment', 'A modern apartment in the city center.', 'City Center', 150.00),
    (uuid_generate_v4(), (SELECT user_id FROM Users WHERE email = 'alice.johnson@example.com'), 'Beach House', 'A beautiful house by the beach.', 'Beachside', 200.00);

-- Insert Sample Data into Booking Table
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status) VALUES
    (uuid_generate_v4(), (SELECT property_id FROM Property WHERE name = 'Cozy Cottage'), (SELECT user_id FROM Users WHERE email = 'alice.johnson@example.com'), '2025-07-10', '2025-07-15', 500.00, 'confirmed'),
    (uuid_generate_v4(), (SELECT property_id FROM Property WHERE name = 'Downtown Apartment'), (SELECT user_id FROM Users WHERE email = 'alice.johnson@example.com'), '2025-08-01', '2025-08-05', 600.00, 'pending'),
    (uuid_generate_v4(), (SELECT property_id FROM Property WHERE name = 'Beach House'), (SELECT user_id FROM Users WHERE email = 'diana.prince@example.com'), '2025-09-01', '2025-09-10', 1800.00, 'confirmed');

-- Insert Sample Data into Payment Table
INSERT INTO Payment (payment_id, booking_id, amount, payment_method) VALUES
    (uuid_generate_v4(), (SELECT booking_id FROM Booking WHERE status = 'confirmed' AND user_id = (SELECT user_id FROM Users WHERE email = 'alice.johnson@example.com')), 500.00, 'credit_card'),
    (uuid_generate_v4(), (SELECT booking_id FROM Booking WHERE status = 'pending' AND user_id = (SELECT user_id FROM Users WHERE email = 'alice.johnson@example.com')), 600.00, 'paypal'),
    (uuid_generate_v4(), (SELECT booking_id FROM Booking WHERE status = 'confirmed' AND user_id = (SELECT user_id FROM Users WHERE email = 'diana.prince@example.com')), 1800.00, 'stripe');

-- Insert Sample Data into Review Table
INSERT INTO Review (review_id, property_id, user_id, rating, comment) VALUES
    (uuid_generate_v4(), (SELECT property_id FROM Property WHERE name = 'Cozy Cottage'), (SELECT user_id FROM Users WHERE email = 'diana.prince@example.com'), 5, 'Amazing experience! Highly recommend.'),
    (uuid_generate_v4(), (SELECT property_id FROM Property WHERE name = 'Downtown Apartment'), (SELECT user_id FROM Users WHERE email = 'alice.johnson@example.com'), 4, 'Great location, but a bit noisy.'),
    (uuid_generate_v4(), (SELECT property_id FROM Property WHERE name = 'Beach House'), (SELECT user_id FROM Users WHERE email = 'bob.smith@example.com'), 5, 'Beautiful house with stunning views!');

-- Insert Sample Data into Message Table
INSERT INTO Message (message_id, sender_id, recipient_id, message_body) VALUES
    (uuid_generate_v4(), (SELECT user_id FROM Users WHERE email = 'alice.johnson@example.com'), (SELECT user_id FROM Users WHERE email = 'bob.smith@example.com'), 'Hi Bob, is your cottage available for the weekend?'),
    (uuid_generate_v4(), (SELECT user_id FROM Users WHERE email = 'bob.smith@example.com'), (SELECT user_id FROM Users WHERE email = 'alice.johnson@example.com'), 'Yes, it is available! Let me know if you want to book it.');
