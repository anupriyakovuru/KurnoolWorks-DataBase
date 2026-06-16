USE kurnoolworks;

-- ==========================================
-- USERS
-- ==========================================

INSERT INTO users
(full_name,email,mobile,password_hash,user_type,email_verified,mobile_verified)
VALUES
('Admin','admin@kurnoolworks.com','9999999999','admin123','admin',1,1),

('Anu Priya','anu@student.com','9000000001','password123','student',1,1),

('Rahul Kumar','rahul@student.com','9000000002','password123','student',1,1),

('Tech Solutions Owner','owner@techsolutions.com','9000000003','password123','business',1,1),

('ABC CA Firm Owner','owner@abcfirm.com','9000000004','password123','business',1,1);

-- ==========================================
-- STUDENT PROFILES
-- ==========================================

INSERT INTO student_profiles
(
user_id,
college_name,
course,
specialization,
graduation_year,
experience_months,
skills,
linkedin_url,
portfolio_url,
city,
resume_url,
profile_completion
)
VALUES

(
2,
'Rayalaseema University',
'B.Tech',
'Computer Science',
2026,
6,
'Python, SQL, HTML, CSS',
'https://linkedin.com/in/anu',
'https://github.com/anu',
'Kurnool',
'/resumes/anu.pdf',
100
),

(
3,
'Osmania University',
'B.Com',
'Commerce',
2025,
3,
'Tally, GST, Excel',
'https://linkedin.com/in/rahul',
NULL,
'Kurnool',
'/resumes/rahul.pdf',
90
);

-- ==========================================
-- BUSINESS PROFILES
-- ==========================================

INSERT INTO business_profiles
(
user_id,
company_name,
owner_name,
industry,
city,
company_description,
website,
gst_number,
company_logo_url,
company_size,
verification_status
)
VALUES

(
4,
'Tech Solutions Pvt Ltd',
'Ramesh Kumar',
'Software',
'Kurnool',
'Software development company',
'https://techsolutions.com',
'GST123456789',
'/logos/techsolutions.png',
'11-50',
'approved'
),

(
5,
'ABC CA Firm',
'Suresh Kumar',
'Accounting',
'Kurnool',
'CA and Tax Consultancy',
'https://abccafirm.com',
'GST987654321',
'/logos/abccafirm.png',
'1-10',
'approved'
);

-- ==========================================
-- OPPORTUNITIES
-- ==========================================

INSERT INTO opportunities
(
business_id,
title,
opportunity_type,
description,
skills_required,
location,
salary_min,
salary_max,
salary_period,
vacancies,
application_deadline,
status
)
VALUES

(
1,
'Python Intern',
'internship',
'Looking for Python interns',
'Python, SQL',
'Kurnool',
5000,
8000,
'month',
3,
'2026-12-31',
'open'
),

(
1,
'Frontend Developer',
'job',
'React developer required',
'React, JavaScript',
'Kurnool',
25000,
40000,
'month',
2,
'2026-12-31',
'open'
),

(
2,
'GST Assistant',
'internship',
'Assist in GST filing',
'GST, Excel',
'Kurnool',
4000,
7000,
'month',
5,
'2026-12-31',
'open'
);

-- ==========================================
-- APPLICATIONS
-- ==========================================

INSERT INTO applications
(
opportunity_id,
student_id,
status,
remarks
)
VALUES

(
1,
1,
'applied',
'Interested in Python development'
),

(
2,
1,
'shortlisted',
'Good profile'
),

(
3,
2,
'applied',
'Commerce background'
);

-- ==========================================
-- REPORTS
-- ==========================================

INSERT INTO reports
(
reported_by,
report_type,
reference_id,
reason,
status
)
VALUES

(
2,
'opportunity',
1,
'Testing report functionality',
'open'
);

-- ==========================================
-- PAYMENTS
-- ==========================================

INSERT INTO payments
(
user_id,
amount,
purpose,
payment_status,
transaction_id
)
VALUES

(
4,
199.00,
'Featured Job Posting',
'success',
'TXN100001'
),

(
5,
499.00,
'Premium Business Subscription',
'success',
'TXN100002'
);

-- ==========================================
-- OTP VERIFICATIONS
-- ==========================================

INSERT INTO otp_verifications
(
user_id,
otp_code,
expires_at,
is_used
)
VALUES

(
2,
'123456',
DATE_ADD(NOW(), INTERVAL 10 MINUTE),
1
),

(
3,
'654321',
DATE_ADD(NOW(), INTERVAL 10 MINUTE),
0
);
