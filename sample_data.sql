USE kurnoolworks;

-- ==========================================
-- USERS
-- ==========================================

INSERT INTO users
(full_name,email,mobile,password_hash,user_type)
VALUES
('Anu Priya','[anu@student.com](mailto:anu@student.com)','9000000001','password123','student'),

('Rahul Kumar','[rahul@student.com](mailto:rahul@student.com)','9000000002','password123','student'),

('Tech Solutions Owner','[owner@techsolutions.com](mailto:owner@techsolutions.com)','9000000003','password123','business'),

('ABC CA Firm Owner','[owner@abccafirm.com](mailto:owner@abccafirm.com)','9000000004','password123','business');

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
skills,
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
'Python, SQL, HTML, CSS',
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
'Tally, GST, Excel',
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
verification_status
)
VALUES

(
4,
'Tech Solutions Pvt Ltd',
'Ramesh Kumar',
'Software',
'Kurnool',
'Software Development Company',
'https://techsolutions.com',
'GST123456789',
'approved'
),

(
5,
'ABC CA Firm',
'Suresh Kumar',
'Accounting',
'Kurnool',
'CA and Tax Consultancy Services',
'https://abccafirm.com',
'GST987654321',
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
stipend_salary,
vacancies,
application_deadline,
status
)
VALUES

(
1,
'Python Intern',
'internship',
'Looking for Python Interns',
'Python, SQL',
'Kurnool',
'5000-8000 Per Month',
3,
'2026-12-31',
'open'
),

(
1,
'Frontend Developer',
'job',
'React Developer Required',
'React, JavaScript',
'Kurnool',
'25000-40000 Per Month',
2,
'2026-12-31',
'open'
),

(
2,
'GST Assistant',
'internship',
'Assist In GST Filing',
'GST, Excel',
'Kurnool',
'4000-7000 Per Month',
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
'Interested In Python Development'
),

(
2,
1,
'shortlisted',
'Good Technical Profile'
),

(
3,
2,
'applied',
'Commerce Background'
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
'Testing Report Feature',
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
TRUE
);
