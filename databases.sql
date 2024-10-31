-- Switch to root user and create databases
CREATE DATABASE IF NOT EXISTS users;
CREATE DATABASE IF NOT EXISTS professionals;
CREATE DATABASE IF NOT EXISTS appointments;

-- Switch to user_db and create tables
USE users;

CREATE TABLE IF NOT EXISTS users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(80) NOT NULL,
    last_name VARCHAR(80) NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    email VARCHAR(120) UNIQUE NOT NULL,
    phone VARCHAR(20) UNIQUE NOT NULL,
    location VARCHAR(100),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Switch to professional_db and create tables
USE professionals;

CREATE TABLE IF NOT EXISTS professionals (
    professional_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(80) NOT NULL,
    last_name VARCHAR(80) NOT NULL,
    specialization VARCHAR(120) NOT NULL,
    email VARCHAR(120) UNIQUE NOT NULL,
    phone VARCHAR(20) UNIQUE NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

INSERT INTO professionals (first_name, last_name, specialization, email, phone) VALUES
('Emily', 'Smith', 'Dermatologist', 'emily.smith@example.com', '+1234567890'),
('Josh', 'Robinson', 'Cardiologist', 'john.doe@example.com', '+1234567891'),
('Jane', 'Johnson', 'Pediatrician', 'jane.johnson@example.com', '+1234567892'),
('Michael', 'Brown', 'Orthopedic Surgeon', 'michael.brown@example.com', '+1234567893'),
('Sarah', 'Davis', 'Psychiatrist', 'sarah.davis@example.com', '+1234567894'),
('David', 'Wilson', 'Dentist', 'david.wilson@example.com', '+1234567895'),
('Laura', 'Garcia', 'Neurologist', 'laura.garcia@example.com', '+1234567896'),
('James', 'Martinez', 'General Practitioner', 'james.martinez@example.com', '+1234567897'),
('Mary', 'Hernandez', 'Endocrinologist', 'mary.hernandez@example.com', '+1234567898'),
('Robert', 'Lopez', 'Ophthalmologist', 'robert.lopez@example.com', '+1234567899');

-- Switch to availability_db and create tables
USE appointments;

-- Create the status table
CREATE TABLE IF NOT EXISTS status (
    status_id INT PRIMARY KEY AUTO_INCREMENT,
    status_name VARCHAR(50) NOT NULL
);

-- Create the slots table
CREATE TABLE IF NOT EXISTS slots (
    slot_id INT PRIMARY KEY AUTO_INCREMENT,
    slot_time VARCHAR(20) NOT NULL
);

-- Create the appointments table
CREATE TABLE IF NOT EXISTS appointments (
    appointment_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    professional_id INT NOT NULL,
    appointment_date DATE NOT NULL,
    appointment_slot_id INT,
    status_id INT,
    notes TEXT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (appointment_slot_id) REFERENCES slots(slot_id),
    FOREIGN KEY (status_id) REFERENCES status(status_id)
);
