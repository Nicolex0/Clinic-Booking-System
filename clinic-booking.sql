-- Create database
CREATE DATABASE clinic_bookings;

-- Use the database
USE clinic_bookings;

-- Table for specialization e.g dermatology, cardiology
CREATE TABLE specializations (
    specialization_id INT AUTO_INCREMENT PRIMARY KEY,         -- Unique ID for each specialization
    name VARCHAR(100) NOT NULL UNIQUE                         -- Name of the specialization (must be unique)
);