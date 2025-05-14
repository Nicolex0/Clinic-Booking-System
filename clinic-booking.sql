-- Create database
CREATE DATABASE clinic_bookings;

-- Use the database
USE clinic_bookings;

-- Table for specialization e.g dermatology, cardiology
CREATE TABLE specializations (
    specialization_id INT AUTO_INCREMENT PRIMARY KEY,      -- Unique ID for each specialization
    name VARCHAR(100) NOT NULL UNIQUE           
);

-- Table for doctors
CREATE TABLE doctors (
    doctor_id INT AUTO_INCREMENT PRIMARY KEY,      -- Unique ID for each doctor
    full_name VARCHAR(100) NOT NULL,                  
    email VARCHAR(100) UNIQUE NOT NULL,            -- Email must be unique and required
    phone VARCHAR(15),         -- Optional phone number
    specialization_id INT,     -- Foreign key to specializations
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP        -- When the doctor was added
);