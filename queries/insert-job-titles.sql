INSERT INTO public.job_titles (job_category, job_title, job_description)
VALUES 
-- Executive & Leadership
('Executive & Leadership', 'Chief Executive Officer (CEO)', 'Responsible for overall strategic leadership and company vision.'),
('Executive & Leadership', 'Chief Operating Officer (COO)', 'Oversees daily operations and implements strategies for growth and efficiency.'),
('Executive & Leadership', 'Chief Technology Officer (CTO)', 'Leads technology strategy, research, and development initiatives.'),
('Executive & Leadership', 'Chief Financial Officer (CFO)', 'Manages financial planning, risk management, and financial reporting.'),
('Executive & Leadership', 'Chief Marketing Officer (CMO)', 'Directs marketing strategy, brand management, and customer engagement.'),
('Executive & Leadership', 'Chief Revenue Officer (CRO)', 'Focuses on revenue growth, sales strategy, and customer retention initiatives.'),
('Executive & Leadership', 'Chief Product Officer (CPO)', 'Guides product vision, development, and lifecycle management.'),
('Executive & Leadership', 'Vice President (VP) of Sales', 'Leads the sales organization to drive revenue and market expansion.'),
('Executive & Leadership', 'VP of Marketing', 'Develops and executes marketing strategies to build brand value.'),
('Executive & Leadership', 'VP of Engineering', 'Oversees engineering teams, ensuring high-quality and timely project delivery.'),
('Executive & Leadership', 'VP of Product', 'Directs product strategy and development to meet market needs.'),
('Executive & Leadership', 'VP of Customer Success', 'Drives customer satisfaction, retention, and overall success.'),
('Executive & Leadership', 'VP of Human Resources', 'Manages HR strategy, talent development, and organizational culture.'),
('Executive & Leadership', 'Director of Sales', 'Manages sales teams and develops strategic sales initiatives.'),
('Executive & Leadership', 'Director of Marketing', 'Oversees marketing campaigns, digital strategies, and brand messaging.'),
('Executive & Leadership', 'Director of Engineering', 'Leads engineering projects and mentors technical teams.'),
('Executive & Leadership', 'Director of Product', 'Responsible for product planning, strategy, and execution.'),
('Executive & Leadership', 'Director of Customer Success', 'Develops customer support strategies to enhance satisfaction.'),
('Executive & Leadership', 'Director of Human Resources', 'Oversees HR operations, recruitment, and employee engagement.'),

-- Sales & Business Development
('Sales & Business Development', 'Account Executive (AE)', 'Manages client relationships and drives new sales opportunities.'),
('Sales & Business Development', 'Senior Account Executive', 'Handles high-value accounts and complex sales negotiations.'),
('Sales & Business Development', 'Enterprise Account Executive', 'Focuses on large enterprise customers with strategic sales initiatives.'),
('Sales & Business Development', 'Sales Development Representative (SDR) / Business Development Representative (BDR)', 'Generates leads and qualifies prospects to support the sales team.'),
('Sales & Business Development', 'Sales Manager', 'Leads and manages the sales team to achieve revenue targets.'),
('Sales & Business Development', 'Sales Operations Manager', 'Optimizes sales processes and supports team performance with analytics.'),
('Sales & Business Development', 'Channel Sales Manager', 'Develops partner relationships and manages indirect sales channels.'),
('Sales & Business Development', 'Strategic Partnerships Manager', 'Builds and maintains strategic alliances to drive business growth.'),
('Sales & Business Development', 'Sales Engineer (Pre-Sales)', 'Provides technical expertise during the sales process and customizes solutions.'),
('Sales & Business Development', 'Solutions Architect (Pre-Sales)', 'Designs tailored technical solutions that meet customer requirements.'),
('Sales & Business Development', 'Revenue Operations Manager', 'Aligns marketing, sales, and customer success to maximize revenue.'),

-- Marketing & Communications
('Marketing & Communications', 'Marketing Manager', 'Develops and executes marketing strategies to increase brand awareness and engagement.'),
('Marketing & Communications', 'Digital Marketing Manager', 'Focuses on online marketing strategies including SEO, PPC, and social media.'),
('Marketing & Communications', 'Content Marketing Manager', 'Oversees content creation and distribution to drive customer engagement.'),
('Marketing & Communications', 'Social Media Manager', 'Manages social media channels and develops engaging digital content.'),
('Marketing & Communications', 'Product Marketing Manager', 'Positions products in the market and drives adoption through targeted campaigns.'),
('Marketing & Communications', 'Brand Manager', 'Ensures consistent brand messaging across all channels and initiatives.'),
('Marketing & Communications', 'SEO/SEM Specialist', 'Optimizes web content to improve search rankings and drive traffic.'),
('Marketing & Communications', 'Marketing Analyst', 'Analyzes marketing data to evaluate campaign performance and ROI.'),
('Marketing & Communications', 'Public Relations Manager', 'Manages public image and media relations for the company.'),
('Marketing & Communications', 'Communications Specialist', 'Develops and implements internal and external communications strategies.'),
('Marketing & Communications', 'Graphic Designer', 'Creates visual content for digital and print media.'),
('Marketing & Communications', 'UX/UI Designer (Marketing Focused)', 'Designs user interfaces that enhance marketing efforts and user engagement.'),
('Marketing & Communications', 'Email Marketing Specialist', 'Manages email campaigns and nurtures leads through targeted communication.'),
('Marketing & Communications', 'Demand Generation Manager', 'Develops strategies to generate and nurture high-quality leads.'),

-- Product & Engineering
('Product & Engineering', 'Product Manager', 'Guides the development and lifecycle of a product to meet market demands.'),
('Product & Engineering', 'Senior Product Manager', 'Leads product strategy for complex and high-impact products.'),
('Product & Engineering', 'Product Owner', 'Prioritizes product features and manages the product backlog with a customer focus.'),
('Product & Engineering', 'UX/UI Designer (Product Focused)', 'Designs user-centered interfaces to enhance product usability and experience.'),
('Product & Engineering', 'Software Engineer (Front-End, Back-End, Full-Stack)', 'Develops software solutions across various technology stacks.'),
('Product & Engineering', 'Senior Software Engineer', 'Leads complex development projects and mentors junior engineers.'),
('Product & Engineering', 'Software Architect', 'Designs and oversees the overall architecture of software systems.'),
('Product & Engineering', 'DevOps Engineer', 'Automates and improves development and deployment processes.'),
('Product & Engineering', 'Quality Assurance (QA) Engineer', 'Ensures the quality and reliability of software through testing and validation.'),
('Product & Engineering', 'Data Engineer', 'Builds and maintains scalable data pipelines for analytics and reporting.'),
('Product & Engineering', 'Data Scientist', 'Analyzes large datasets to extract insights and inform strategic decisions.'),
('Product & Engineering', 'Machine Learning Engineer', 'Develops and deploys machine learning models to solve business problems.'),
('Product & Engineering', 'Database Administrator', 'Maintains database systems ensuring performance, security, and availability.'),
('Product & Engineering', 'Systems Administrator', 'Manages and maintains IT infrastructure for optimal performance.'),
('Product & Engineering', 'Technical Lead', 'Guides technical teams and oversees the implementation of software solutions.'),
('Product & Engineering', 'Engineering Manager', 'Leads engineering teams and manages project delivery and performance.'),
('Product & Engineering', 'Information Security Analyst', 'Monitors and protects systems against security threats and vulnerabilities.'),

-- Customer Success & Support
('Customer Success & Support', 'Customer Success Manager (CSM)', 'Ensures customers achieve their goals using the product and maintains high satisfaction levels.'),
('Customer Success & Support', 'Senior Customer Success Manager', 'Manages key accounts and develops strategies to improve customer retention.'),
('Customer Success & Support', 'Customer Support Representative', 'Provides front-line support and resolves customer inquiries efficiently.'),
('Customer Success & Support', 'Technical Support Engineer', 'Assists customers with technical issues and ensures smooth product usage.'),
('Customer Success & Support', 'Implementation Specialist', 'Guides customers through product implementation and integration.'),
('Customer Success & Support', 'Onboarding Specialist', 'Ensures new customers are effectively onboarded and trained.'),
('Customer Success & Support', 'Customer Education Specialist', 'Develops training programs and materials to educate customers.'),
('Customer Success & Support', 'Customer Support Manager', 'Leads the support team to deliver exceptional customer service.'),
('Customer Success & Support', 'Knowledge Base Manager', 'Manages documentation and self-service resources to support customer inquiries.'),

-- Finance & Operations
('Finance & Operations', 'Accountant', 'Manages financial records and ensures compliance with accounting standards.'),
('Finance & Operations', 'Financial Analyst', 'Analyzes financial data to guide strategic and operational decisions.'),
('Finance & Operations', 'Controller', 'Oversees accounting operations and prepares financial reports.'),
('Finance & Operations', 'Payroll Specialist', 'Manages payroll processing and ensures accurate compensation.'),
('Finance & Operations', 'Operations Manager', 'Ensures efficient operational processes across the organization.'),
('Finance & Operations', 'Project Manager', 'Leads projects from planning to execution, ensuring timely delivery.'),
('Finance & Operations', 'Program Manager', 'Oversees multiple projects and aligns them with business objectives.'),
('Finance & Operations', 'Procurement Manager', 'Manages purchasing processes and vendor relationships.'),
('Finance & Operations', 'Facilities Manager', 'Oversees the maintenance and operation of physical facilities.'),
('Finance & Operations', 'Legal Counsel', 'Provides legal guidance and support to the organization.'),
('Finance & Operations', 'Compliance Officer', 'Ensures adherence to regulatory requirements and internal policies.'),

-- Human Resources & Talent Acquisition
('Human Resources & Talent Acquisition', 'HR Manager', 'Oversees HR functions including recruitment, employee relations, and compliance.'),
('Human Resources & Talent Acquisition', 'Talent Acquisition Specialist / Recruiter', 'Sources and recruits top talent for the organization.'),
('Human Resources & Talent Acquisition', 'HR Generalist', 'Supports a variety of HR functions and employee services.'),
('Human Resources & Talent Acquisition', 'Learning and Development Specialist', 'Designs and implements training programs to develop employee skills.'),
('Human Resources & Talent Acquisition', 'Compensation and Benefits Specialist', 'Manages employee compensation programs and benefit administration.'),
('Human Resources & Talent Acquisition', 'HR Business Partner', 'Aligns HR strategies with business objectives and supports leadership teams.'),
('Human Resources & Talent Acquisition', 'Employee Experience Manager', 'Enhances employee satisfaction and engagement through strategic initiatives.'),

-- Data & Analytics
('Data & Analytics', 'Data Analyst', 'Collects, analyzes, and interprets data to support decision-making.'),
('Data & Analytics', 'Business Intelligence Analyst', 'Uses data analytics to drive insights and strategic recommendations.'),
('Data & Analytics', 'Data Scientist', 'Applies advanced analytics and machine learning techniques to solve business problems.'),
('Data & Analytics', 'Data Engineer', 'Designs and maintains data infrastructure for efficient data processing.'),
('Data & Analytics', 'Database Administrator', 'Ensures database performance, security, and reliability.'),

-- IT & Security
('IT & Security', 'IT Support Specialist', 'Provides technical support and troubleshooting for end-users.'),
('IT & Security', 'Network Administrator', 'Manages network infrastructure and ensures connectivity and performance.'),
('IT & Security', 'Cybersecurity Analyst', 'Monitors systems for security threats and implements countermeasures.'),
('IT & Security', 'Security Engineer', 'Designs and implements security solutions to protect company data.'),
('IT & Security', 'Systems Engineer', 'Maintains and supports IT systems and infrastructure.'),

-- Enablement
('Enablement', 'Sales Enablement Manager', 'Develops strategies and resources to empower the sales team.'),
('Enablement', 'Customer Enablement Manager', 'Creates programs to improve customer success and engagement.'),
('Enablement', 'Learning and Development Manager', 'Leads initiatives to train and develop employees effectively.');

select * from job_titles;
