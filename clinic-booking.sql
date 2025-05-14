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

-- Add foreign key to link doctor with a specialization
ALTER TABLE doctors
ADD CONSTRAINT fk_doctor_specialization
FOREIGN KEY (specialization_id)
REFERENCES specializations(specialization_id)
ON DELETE SET NULL;   -- If specialization is deleted, set to NULL 

-- Table for patients
CREATE TABLE patients (
    patient_id INT AUTO_INCREMENT PRIMARY KEY,           -- Unique ID for each patient
    full_name VARCHAR(100) NOT NULL,           
    email VARCHAR(100) UNIQUE NOT NULL,                -- Email must be unique and required
    phone VARCHAR(15),           -- Optional phone number
    date_of_birth DATE,                                      
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP       -- When the patient record was created
);

-- Table for services offred by the clinic
CREATE TABLE services (
    service_id INT AUTO_INCREMENT PRIMARY KEY,            -- Unique ID for each service
    name VARCHAR(100) NOT NULL UNIQUE,       -- Name of the service (must be unique)
    description TEXT,                        
    price DECIMAL(10, 2) NOT NULL     -- Price of the service
);

-- Table for appointments
CREATE TABLE appointments (
    appointment_id INT AUTO_INCREMENT PRIMARY KEY,          
    doctor_id INT NOT NULL,                   -- Doctor assigned to appointment
    patient_id INT NOT NULL,            -- Patient attending the appointment
    appointment_date DATETIME NOT NULL,          -- Date and time of the appointment
    notes TEXT,              -- Optional notes about the appointment
    status ENUM('Scheduled', 'Completed', 'Cancelled') 
           DEFAULT 'Scheduled',             -- Appointment status
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,  -- When appointment was booked

    -- Foreign key constraints
    CONSTRAINT fk_appointment_doctor 
        FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id)
        ON DELETE CASCADE,

    CONSTRAINT fk_appointment_patient 
        FOREIGN KEY (patient_id) REFERENCES patients(patient_id)
        ON DELETE CASCADE
);