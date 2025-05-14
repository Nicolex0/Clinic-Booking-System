# Clinic-Booking-System

## Description

This project is a **Clinic Booking System** built entirely using **MySQL**. It serves as a backend relational database for managing appointments, doctors, patients, medical services, and specializations. The system handles key operations such as:

- Booking and managing appointments
- Managing doctor specializations
- Recording services rendered to patients
- Automatically handling related deletions using foreign key constraints

This system is designed to mimic the real-world workflows of a small to mid-sized clinic.

---

## How to Setup the Project

1. **Clone the repository** or download the `.sql` file.
2. **Open your MySQL environment** (e.g., MySQL Workbench or CLI).
3. **Create and switch to a new database**:
   ```sql
   CREATE DATABASE clinic_db;
   USE clinic_db;
   
## File Structure 
clinic-booking-system/
├── clinic_booking.sql       # Contains all CREATE TABLE and INSERT statements
└── README.md                       # Project documentation

## Database Structure
### Tables
`patients` – Stores patient details

`doctors` – Stores doctor profiles

`specializations` – Stores medical specialties

`services` – Stores services offered by the clinic

`appointments` – Records appointment bookings

`patient_services` – Tracks services received by each patient

## Relationships
### One-to-Many:
`specializations` ➝ `doctors`

`doctors` ➝ `appointments`

`patients` ➝ `appointments`

### Many-to-Many
`patients` ⬌ `services` (via `patient_services`)

## 🖼️ ERD (Entity Relationship Diagram)

Here’s the visual representation of the Clinic Booking System database schema:

![Image](https://github.com/user-attachments/assets/2b2368dd-fc7c-4043-b87e-ef822dc2ab96)
