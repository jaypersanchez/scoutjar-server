CREATE TABLE skills (
    skill_id SERIAL PRIMARY KEY,
    skill_name VARCHAR(255) NOT NULL,
    category VARCHAR(100) NOT NULL
);

INSERT INTO skills (skill_name, category) VALUES
-- IT Skills
('Software Development', 'IT'),
('Cybersecurity', 'IT'),
('Cloud Computing', 'IT'),
('Data Science', 'IT'),
('Machine Learning', 'IT'),
('Blockchain Development', 'IT'),
('DevOps', 'IT'),
('Database Administration', 'IT'),
('Network Engineering', 'IT'),
('UI/UX Design', 'IT'),
('Game Development', 'IT'),
('IT Support', 'IT'),

-- Business Administration
('Project Management', 'Business Administration'),
('Operations Management', 'Business Administration'),
('Human Resources Management', 'Business Administration'),
('Supply Chain Management', 'Business Administration'),
('Marketing Strategy', 'Business Administration'),
('Sales Management', 'Business Administration'),

-- Accounting & Finance
('Financial Analysis', 'Accounting & Finance'),
('Auditing', 'Accounting & Finance'),
('Taxation', 'Accounting & Finance'),
('Risk Management', 'Accounting & Finance'),
('Investment Management', 'Accounting & Finance'),
('Payroll Processing', 'Accounting & Finance'),

-- Legal Field
('Corporate Law', 'Law'),
('Intellectual Property Law', 'Law'),
('Contract Law', 'Law'),
('Litigation', 'Law'),
('International Law', 'Law'),
('Criminal Law', 'Law'),

-- Healthcare
('Medical Administration', 'Healthcare'),
('Nursing', 'Healthcare'),
('Pharmacy', 'Healthcare'),
('Physical Therapy', 'Healthcare'),
('Public Health', 'Healthcare'),

-- Engineering
('Mechanical Engineering', 'Engineering'),
('Electrical Engineering', 'Engineering'),
('Civil Engineering', 'Engineering'),
('Chemical Engineering', 'Engineering'),
('Aerospace Engineering', 'Engineering'),

-- Education
('Curriculum Development', 'Education'),
('Teaching', 'Education'),
('Educational Psychology', 'Education'),
('Special Education', 'Education'),
('Higher Education Administration', 'Education');
