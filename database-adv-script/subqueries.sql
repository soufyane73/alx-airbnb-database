-- Subqueries for ALX Airbnb Database Project

-- Non-Correlated Subquery
-- Find all properties with an average rating greater than 4.0
SELECT 
    p.property_id,
    p.name,
    p.description,
    p.location
FROM 
    Property p
WHERE 
    p.property_id IN (
        SELECT 
            r.property_id 
        FROM 
            Review r 
        GROUP BY 
            r.property_id 
        HAVING 
            AVG(r.rating) > 4.0
    );

-- Correlated Subquery
-- Find users with more than 3 bookings
SELECT 
    u.user_id,
    u.first_name,
    u.last_name
FROM 
    Users u
WHERE 
    (SELECT COUNT(*) 
     FROM Booking b 
     WHERE b.user_id = u.user_id) > 3;
