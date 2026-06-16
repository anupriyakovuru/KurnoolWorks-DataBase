-- ==========================================
-- KurnoolWorks Database Schema
-- Author: Anu Priya Kovuru
-- Database: kurnoolworks
-- ==========================================

CREATE DATABASE IF NOT EXISTS kurnoolworks;

USE kurnoolworks;

-- ==========================================
-- USERS
-- ==========================================

CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,

    full_name VARCHAR(100) NOT NULL,

    email VARCHAR(100) UNIQUE NOT NULL,

    mobile VARCHAR(15) UNIQUE NOT NULL,

    password_hash VARCHAR(255) NOT NULL,

    user_type ENUM(
        'student',
        'business',
        'admin'
    ) NOT NULL,

    email_verified BOOLEAN DEFAULT FALSE,

    mobile_verified BOOLEAN DEFAULT FALSE,

    status ENUM(
        'active',
        'blocked'
    ) DEFAULT 'active',

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    ON UPDATE CURRENT_TIMESTAMP
);

-- ==========================================
-- STUDENT PROFILES
-- ==========================================

CREATE TABLE student_profiles (
    student_id INT AUTO_INCREMENT PRIMARY KEY,

    user_id INT UNIQUE NOT NULL,

    college_name VARCHAR(150),

    course VARCHAR(100),

    specialization VARCHAR(100),

    graduation_year INT,

    skills TEXT,

    city VARCHAR(100),

    resume_url VARCHAR(255),

    profile_completion TINYINT DEFAULT 0,

    FOREIGN KEY (user_id)
    REFERENCES users(user_id)
    ON DELETE CASCADE
);

-- ==========================================
-- BUSINESS PROFILES
-- ==========================================

CREATE TABLE business_profiles (
    business_id INT AUTO_INCREMENT PRIMARY KEY,

    user_id INT UNIQUE NOT NULL,

    company_name VARCHAR(150) NOT NULL,

    owner_name VARCHAR(100),

    industry VARCHAR(100),

    city VARCHAR(100),

    company_description TEXT,

    website VARCHAR(255),

    gst_number VARCHAR(20),

    verification_status ENUM(
        'pending',
        'approved',
        'rejected'
    ) DEFAULT 'pending',

    verified_by INT NULL,

    verified_at DATETIME NULL,

    FOREIGN KEY (user_id)
    REFERENCES users(user_id)
    ON DELETE CASCADE
);

-- ==========================================
-- OPPORTUNITIES
-- ==========================================

CREATE TABLE opportunities (
    opportunity_id INT AUTO_INCREMENT PRIMARY KEY,

    business_id INT NOT NULL,

    title VARCHAR(200) NOT NULL,

    opportunity_type ENUM(
        'job',
        'internship',
        'project',
        'part_time'
    ) NOT NULL,

    description TEXT NOT NULL,

    skills_required TEXT,

    location VARCHAR(100),

    stipend_salary VARCHAR(100),

    vacancies INT DEFAULT 1,

    application_deadline DATE,

    status ENUM(
        'draft',
        'pending_approval',
        'open',
        'closed',
        'rejected'
    ) DEFAULT 'pending_approval',

    approved_by INT NULL,

    approved_at DATETIME NULL,

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (business_id)
    REFERENCES business_profiles(business_id)
    ON DELETE CASCADE
);

-- ==========================================
-- APPLICATIONS
-- ==========================================

CREATE TABLE applications (
    application_id INT AUTO_INCREMENT PRIMARY KEY,

    opportunity_id INT NOT NULL,

    student_id INT NOT NULL,

    applied_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    status ENUM(
        'applied',
        'shortlisted',
        'interview',
        'selected',
        'rejected'
    ) DEFAULT 'applied',

    remarks TEXT,

    FOREIGN KEY (opportunity_id)
    REFERENCES opportunities(opportunity_id)
    ON DELETE CASCADE,

    FOREIGN KEY (student_id)
    REFERENCES student_profiles(student_id)
    ON DELETE CASCADE,

    UNIQUE(opportunity_id, student_id)
);

-- ==========================================
-- REPORTS
-- ==========================================

CREATE TABLE reports (
    report_id INT AUTO_INCREMENT PRIMARY KEY,

    reported_by INT NOT NULL,

    report_type ENUM(
        'business',
        'opportunity',
        'student'
    ) NOT NULL,

    reference_id INT NOT NULL,

    reason TEXT NOT NULL,

    status ENUM(
        'open',
        'resolved'
    ) DEFAULT 'open',

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (reported_by)
    REFERENCES users(user_id)
    ON DELETE CASCADE
);

-- ==========================================
-- PAYMENTS
-- ==========================================

CREATE TABLE payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,

    user_id INT NOT NULL,

    amount DECIMAL(10,2),

    purpose VARCHAR(100),

    payment_status ENUM(
        'pending',
        'success',
        'failed'
    ) DEFAULT 'pending',

    transaction_id VARCHAR(100),

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (user_id)
    REFERENCES users(user_id)
    ON DELETE CASCADE
);

-- ==========================================
-- OTP VERIFICATIONS
-- ==========================================

CREATE TABLE otp_verifications (
    otp_id INT AUTO_INCREMENT PRIMARY KEY,

    user_id INT NOT NULL,

    otp_code VARCHAR(10) NOT NULL,

    expires_at DATETIME NOT NULL,

    is_used BOOLEAN DEFAULT FALSE,

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (user_id)
    REFERENCES users(user_id)
    ON DELETE CASCADE
);

-- ==========================================
-- INDEXES
-- ==========================================

CREATE INDEX idx_user_email
ON users(email);

CREATE INDEX idx_user_mobile
ON users(mobile);

CREATE INDEX idx_opportunity_status
ON opportunities(status);

CREATE INDEX idx_opportunity_type
ON opportunities(opportunity_type);

CREATE INDEX idx_application_status
ON applications(status);

-- ==========================================
-- DEFAULT ADMIN USER
-- Change password in production
-- ==========================================

INSERT INTO users (
    full_name,
    email,
    mobile,
    password_hash,
    user_type
)
VALUES (
    'Admin',
    'admin@kurnoolworks.com',
    '9999999999',
    'admin123',
    'admin'
);
