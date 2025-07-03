[Airbnb.drawio.pdf](https://github.com/user-attachments/files/21047508/Airbnb.drawio.pdf)
![Airbnb drawio](https://github.com/user-attachments/assets/3fd5fd7f-c6ca-4170-aef5-bfd828120f00)
# Database Normalization to Third Normal Form (3NF)

Normalization is a critical process in database design that organizes data to reduce redundancy and improve data integrity. This document outlines the steps taken to normalize the Airbnb Clone database schema to Third Normal Form (3NF).

## Overview of Normal Forms

1. **First Normal Form (1NF)**: 
   - All attributes must contain atomic (indivisible) values.
   - Each record must be unique.

2. **Second Normal Form (2NF)**:
   - Must be in 1NF.
   - All non-key attributes must be fully functionally dependent on the primary key.

3. **Third Normal Form (3NF)**:
   - Must be in 2NF.
   - There should be no transitive dependencies (non-key attributes should not depend on other non-key attributes).

## Initial Schema Review

### Entities and Attributes

1. **Customers**
   - user_id (PK)
   - first_name
   - last_name
   - email
   - phone_number
   - password_hash
   - role
   - created_at

2. **Property**
   - property_id (PK)
   - host_id (FK)
   - name
   - description
   - location
   - price_per_night
   - created_at
   - updated_at

3. **Booking**
   - booking_id (PK)
   - property_id (FK)
   - user_id (FK)
   - start_date
   - end_date
   - total_price
   - role
   - created_at

4. **Payment**
   - payment_id (PK)
   - booking_id (FK)
   - amount
   - payment_date
   - payment_method

5. **Message**
   - message_id (PK)
   - sender_id (FK)
   - recipient_id (FK)
   - message_body
   - sent_at

6. **Review**
   - review_id (PK)
   - property_id (FK)
   - user_id (FK)
   - rating
   - comment
   - created_at

## Steps to Achieve 3NF

### Step 1: Ensure 1NF
- All attributes in each table contain atomic values.
- Each table has a primary key.

### Step 2: Ensure 2NF
- All non-key attributes are fully dependent on the primary key.
- For instance, in the **Booking** table, `total_price` is derived from `property_id`, `start_date`, and `end_date`, which may need to be computed rather than stored directly to avoid redundancy.

### Step 3: Achieve 3NF
- Identify and remove transitive dependencies:
  - In the **Payment** table, attributes like `payment_method` can be standardized into a separate table if necessary to avoid redundancy.
  - Ensure that attributes in the **Customers** table are only dependent on `user_id` and not on each other.

### Adjusted Schema

1. **Customers**
   - Remains unchanged.

2. **Property**
   - Remains unchanged.

3. **Booking**
   - Adjusted to remove `total_price` as a stored value; it can be computed based on related `property` and `booking` details.

4. **Payment**
   - Remains unchanged but may link to a `PaymentMethod` table if more methods are introduced.

5. **Message**
   - Remains unchanged.

6. **Review**
   - Remains unchanged.

## Conclusion

The normalization process has led to a schema that is now in Third Normal Form (3NF). This design minimizes redundancy, ensures data integrity, and facilitates easier maintenance and scalability of the database. Future adjustments may include further normalization of the **Payment** method or exploring additional tables for more complex relationships as needed.
