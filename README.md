# Database Schema for Airbnb Clone

This repository contains the SQL schema for the Airbnb Clone project.

## Overview

The schema defines six main entities:

1. **Users**: Contains user information and roles.
2. **Property**: Represents properties listed by users.
3. **Booking**: Records bookings made by users for properties.
4. **Payment**: Tracks payments made for bookings.
5. **Review**: Stores user reviews for properties.
6. **Message**: Manages messages between users.

## SQL Script

The `schema.sql` file contains the SQL statements to create the necessary tables, set constraints, and establish relationships between entities. 

### How to Use

1. Run the SQL script in your preferred SQL database management tool to create the database schema.
2. Ensure that you have the necessary permissions to create tables and indexes.

## Indexing

Indexes are created on columns that are frequently used in query conditions to enhance performance, including:
- Email in the Users table.
- Property IDs in the Property, Booking, and Review tables.

## License

This project is licensed under the MIT License.
