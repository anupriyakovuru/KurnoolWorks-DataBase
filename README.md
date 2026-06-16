# 🚀 KurnoolWorks Database

A scalable MySQL database designed for **KurnoolWorks**, a platform that connects students with local businesses for jobs, internships, projects, freelance work, and part-time opportunities.

---
## Entity Relationship Diagram

![KurnoolWorks ER Diagram](images/ER_Diagram_Kurnool_Works)
## 📌 Project Overview

KurnoolWorks aims to bridge the gap between local talent and local businesses by providing a centralized platform where:

* Students can create profiles and apply for opportunities.
* Businesses can post jobs, internships, and projects.
* Administrators can verify businesses and moderate content.
* Applications can be tracked through the recruitment lifecycle.

This repository contains the complete relational database schema and sample data required to power the platform.

---

## 🎯 Problem Statement

Many students struggle to find local internships, projects, and part-time work opportunities, while businesses often find it difficult to discover suitable local talent.

KurnoolWorks solves this problem by creating a structured ecosystem where students and businesses can connect efficiently.

---

## 🏗️ Database Architecture

The database follows a normalized relational design using MySQL.

### Core Modules

#### 👤 User Management

* Student Accounts
* Business Accounts
* Admin Accounts
* Email Verification
* Mobile Verification
* Account Status Management

#### 🎓 Student Management

* Student Profiles
* Education Details
* Skills Tracking
* Resume Management
* Profile Completion Tracking

#### 🏢 Business Management

* Company Profiles
* Business Verification Workflow
* GST Information
* Company Details Management

#### 💼 Opportunity Management

* Job Postings
* Internship Postings
* Project Opportunities
* Part-Time Opportunities
* Approval Workflow

#### 📄 Application Tracking

* Opportunity Applications
* Shortlisting
* Interview Tracking
* Selection & Rejection Status

#### 🛡️ Platform Moderation

* Reporting System
* Content Moderation Support
* User Monitoring

#### 💳 Future Ready Features

* Payment Tracking
* Premium Listings
* Subscription Support

#### 🔐 Security Features

* OTP Verification
* Foreign Key Constraints
* Duplicate Prevention
* Cascading Deletes

---

## 🗄️ Database Tables

| Table             | Purpose                                    |
| ----------------- | ------------------------------------------ |
| users             | User authentication and account management |
| student_profiles  | Student information                        |
| business_profiles | Business information                       |
| opportunities     | Jobs, internships, projects                |
| applications      | Application tracking                       |
| reports           | Abuse and spam reporting                   |
| payments          | Payment records                            |
| otp_verifications | OTP management                             |

---

## 🔗 Entity Relationships

### One-to-One

* users → student_profiles
* users → business_profiles

### One-to-Many

* business_profiles → opportunities
* opportunities → applications
* student_profiles → applications
* users → reports
* users → payments
* users → otp_verifications

---

## ⚙️ Technologies Used

* MySQL 8+
* SQL
* Relational Database Design
* Foreign Key Constraints
* Indexing
* Data Normalization

---

## 📂 Project Structure

```text
kurnoolworks-database/
│
├── schema.sql
├── sample_data.sql
├── ER_Diagram.png
└── README.md
```

---

## 🚀 Getting Started

### Clone Repository

```bash
git clone https://github.com/anupriyakovuru/kurnoolworks-database.git
```

### Create Database

Run:

```sql
SOURCE schema.sql;
```

### Load Sample Data

```sql
SOURCE sample_data.sql;
```

---

## ✅ Features Implemented

* User Registration Structure
* Student Profiles
* Business Profiles
* Opportunity Posting
* Application Management
* Business Verification Workflow
* OTP Verification Support
* Reporting Mechanism
* Payment Integration Support
* Duplicate Application Prevention
* Referential Integrity

---

## 📈 Future Enhancements

* Resume Parsing
* AI Candidate Matching
* Business Subscription Plans
* Notification System
* Chat System
* Skill Assessments
* Analytics Dashboard
* Mobile Application Support

---

## 👩‍💻 Author

**Anu Priya Kovuru**

Database Designer | QA Engineer | SQL Enthusiast

---

## 🌟 Project Vision

KurnoolWorks is envisioned as a regional talent ecosystem that empowers students, supports local businesses, and creates meaningful employment opportunities through technology.

Building local talent. Empowering local businesses.
