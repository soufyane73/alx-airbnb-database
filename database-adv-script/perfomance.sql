-- Initial Query to Retrieve All Bookings with User, Property, and Payment Details

-- Initial Query to Retrieve All Bookings with User, Property, and Payment Details

SELECT 
    b.booking_id,
    b.user_id,
    b.property_id,
    u.first_name AS user_first_name,
    u.last_name AS user_last_name,
    p.name AS property_name,
    p.location AS property_location,
    pay.payment_id,
    pay.amount AS payment_amount,
    pay.payment_date
FROM 
    Booking b
JOIN 
    Users u ON b.user_id = u.user_id
JOIN 
    Property p ON b.property_id = p.property_id
JOIN 
    Payment pay ON b.booking_id = pay.booking_id
WHERE 
    pay.payment_date >= '2023-01-01';  -- Example filter for bookings after January 1, 2023


EXPLAIN SELECT 
    b.booking_id,
    b.user_id,
    b.property_id,
    u.first_name AS user_first_name,
    u.last_name AS user_last_name,
    p.name AS property_name,
    p.location AS property_location,
    pay.payment_id,
    pay.amount AS payment_amount,
    pay.payment_date
FROM 
    Booking b
JOIN 
    Users u ON b.user_id = u.user_id
JOIN 
    Property p ON b.property_id = p.property_id
JOIN 
    Payment pay ON b.booking_id = pay.booking_id;
