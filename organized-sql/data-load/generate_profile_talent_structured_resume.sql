WITH new_user AS (
            INSERT INTO public.user_profiles (
                oauth_provider, oauth_provider_id, email, full_name,
                profile_picture, social_profile_url, user_type
            ) VALUES (
                'LinkedIn', 'linkedin_uid_9d6d1096-9882-43ea-86e5-bf6d0067bafd', 'linda55@gmail.com', 'Elizabeth Montgomery',
                'https://www.lorempixel.com/611/437', 'https://kelley.net/', 'Talent'
            )
            RETURNING user_id
        )
        INSERT INTO public.talent_profiles (
            user_id, resume, bio, skills, experience, education,
            work_preferences, desired_salary, location,
            availability, available_from, time_availability, requires_two_weeks_notice
        )
        SELECT
            user_id, 'Oversees strategy and creation of marketing content. Passionate about delivering results in the role of content marketing manager.

Skills:
- Email Marketing
- Social Media Marketing
- Content Strategy
- Copywriting
- SEO

Experience:
- Information systems manager at Ramos-Henry (2023-03-08 - 2023-12-06)
  Player line situation interview. Some school reach game four market.
- Site engineer at Waters, Reyes and Henderson (2024-05-15 - Present)
  Leader cover painting recently wrong.

Education:
- Bachelor''s or Master''s Degree in a relevant field from Mccall, Wright and Edwards University', 'Elizabeth Montgomery is a professional in marketing, focused on roles such as content marketing manager. Face same to environmental seem various. Too interview economy when popular sound.',
            ARRAY['Email Marketing', 'Social Media Marketing', 'Content Strategy', 'Copywriting', 'SEO'], 'Teach couple easy traditional young sort. Very son dark professor. Night force explain wonder water alone.', 'Bachelor''s or Master''s Degree in a relevant field',
            '{"work_mode": "Hybrid", "preferred_projects": "SEO campaigns, content marketing, brand engagement"}'::jsonb, 94375.59, 'Dubai, UAE',
            'Immediate', '2025-05-05',
            '{"daily_hours": "4-6", "timezone": "Auto"}'::jsonb,
            FALSE
        FROM new_user;

WITH new_user AS (
            INSERT INTO public.user_profiles (
                oauth_provider, oauth_provider_id, email, full_name,
                profile_picture, social_profile_url, user_type
            ) VALUES (
                'Google', 'google_uid_c5435a6f-a4f6-465a-992d-ae8668be2451', 'stephanie41@hotmail.com', 'Wendy Rogers',
                'https://placekitten.com/189/868', 'https://lester-osborne.com/', 'Talent'
            )
            RETURNING user_id
        )
        INSERT INTO public.talent_profiles (
            user_id, resume, bio, skills, experience, education,
            work_preferences, desired_salary, location,
            availability, available_from, time_availability, requires_two_weeks_notice
        )
        SELECT
            user_id, 'Oversees strategy and creation of marketing content. Passionate about delivering results in the role of content marketing manager.

Skills:
- Email Marketing
- Copywriting
- Content Strategy
- Social Media Marketing
- SEO

Experience:
- Archaeologist at Mendoza-Lee (2021-07-22 - 2023-12-23)
  Certain able step do order raise.
- Travel agency manager at Forbes, Roberts and Johnson (2024-11-18 - Present)
  Walk on wish say season mention hear. For deal check.

Education:
- Bachelor''s or Master''s Degree in a relevant field from Miranda PLC University', 'Wendy Rogers is a professional in marketing, focused on roles such as content marketing manager. Stage measure probably feeling plant prevent. Quickly TV night large decision talk.',
            ARRAY['Email Marketing', 'Copywriting', 'Content Strategy', 'Social Media Marketing', 'SEO'], 'Clearly run charge capital. Difference put material commercial. Bag this interview task. Spend point anything it how put.', 'Bachelor''s or Master''s Degree in a relevant field',
            '{"work_mode": "Remote", "preferred_projects": "SEO campaigns, content marketing, brand engagement"}'::jsonb, 114745.21, 'Mexico City, Mexico',
            'Not Available', '2025-05-21',
            '{"daily_hours": "4-6", "timezone": "Auto"}'::jsonb,
            TRUE
        FROM new_user;

WITH new_user AS (
            INSERT INTO public.user_profiles (
                oauth_provider, oauth_provider_id, email, full_name,
                profile_picture, social_profile_url, user_type
            ) VALUES (
                'LinkedIn', 'linkedin_uid_7444d8d3-1caf-474e-b9c4-b737767d8423', 'dylanklein@gmail.com', 'Crystal Meyer',
                'https://dummyimage.com/47x3', 'https://www.spencer.com/', 'Talent'
            )
            RETURNING user_id
        )
        INSERT INTO public.talent_profiles (
            user_id, resume, bio, skills, experience, education,
            work_preferences, desired_salary, location,
            availability, available_from, time_availability, requires_two_weeks_notice
        )
        SELECT
            user_id, 'Develops both client and server software. Passionate about delivering results in the role of full stack developer.

Skills:
- APIs
- JavaScript
- SQL
- React
- Node.js

Experience:
- Stage manager at Williams and Sons (2021-05-19 - 2023-09-15)
  Tax five guy century probably. To approach medical character avoid.
- Engineer, building services at Jennings, Johnson and Baker (2024-04-17 - Present)
  Home might several show significant per trouble environment.

Education:
- Bachelor''s or Master''s Degree in a relevant field from Brown Inc University', 'Crystal Meyer is a professional in software, focused on roles such as full stack developer. Beat whole cell task. Note available year range black wrong letter.',
            ARRAY['APIs', 'JavaScript', 'SQL', 'React', 'Node.js'], 'Question cause national all expert receive somebody. Federal president police change among view sister pattern.', 'Bachelor''s or Master''s Degree in a relevant field',
            '{"work_mode": "Remote", "preferred_projects": "full-stack development, REST APIs, cloud-native apps"}'::jsonb, 61151.6, 'Buenos Aires, Argentina',
            'Two Weeks Notice', '2025-05-09',
            '{"daily_hours": "Flexible", "timezone": "Auto"}'::jsonb,
            FALSE
        FROM new_user;

WITH new_user AS (
            INSERT INTO public.user_profiles (
                oauth_provider, oauth_provider_id, email, full_name,
                profile_picture, social_profile_url, user_type
            ) VALUES (
                'Google', 'google_uid_11ff7218-94d1-430a-b78f-c3360e4674a4', 'vjohnson@rhodes.biz', 'Gina Hood',
                'https://placekitten.com/712/695', 'http://moore.com/', 'Talent'
            )
            RETURNING user_id
        )
        INSERT INTO public.talent_profiles (
            user_id, resume, bio, skills, experience, education,
            work_preferences, desired_salary, location,
            availability, available_from, time_availability, requires_two_weeks_notice
        )
        SELECT
            user_id, 'Develops both client and server software. Passionate about delivering results in the role of full stack developer.

Skills:
- JavaScript
- Node.js
- React
- SQL
- Python

Experience:
- Surveyor, planning and development at Chavez-Collier (2019-11-10 - 2023-12-08)
  Attack though father role guy exist. Bank capital establish later three word.
- Engineer, aeronautical at Padilla, Burton and Mejia (2024-08-07 - Present)
  Through defense key rate.

Education:
- Bachelor''s or Master''s Degree in a relevant field from Webb Ltd University', 'Gina Hood is a professional in software, focused on roles such as full stack developer. Individual population fact particular.',
            ARRAY['JavaScript', 'Node.js', 'React', 'SQL', 'Python'], 'Once position indeed no two project. Page main production my PM wonder. Charge might low between stuff personal. That once series life industry.', 'Bachelor''s or Master''s Degree in a relevant field',
            '{"work_mode": "Onsite", "preferred_projects": "full-stack development, REST APIs, cloud-native apps"}'::jsonb, 128363.38, 'Jakarta, Indonesia',
            'Not Available', '2025-04-25',
            '{"daily_hours": "Flexible", "timezone": "Auto"}'::jsonb,
            FALSE
        FROM new_user;

WITH new_user AS (
            INSERT INTO public.user_profiles (
                oauth_provider, oauth_provider_id, email, full_name,
                profile_picture, social_profile_url, user_type
            ) VALUES (
                'Google', 'google_uid_0599d80a-654b-47c8-a846-07a062478c30', 'mcknightmarissa@zimmerman-mills.org', 'Barry Reeves',
                'https://placekitten.com/95/550', 'http://www.rowe.org/', 'Talent'
            )
            RETURNING user_id
        )
        INSERT INTO public.talent_profiles (
            user_id, resume, bio, skills, experience, education,
            work_preferences, desired_salary, location,
            availability, available_from, time_availability, requires_two_weeks_notice
        )
        SELECT
            user_id, 'Analyzes financial data to help organizations make decisions. Passionate about delivering results in the role of financial analyst.

Skills:
- Risk Assessment
- Excel
- Data Analysis
- Financial Modeling
- Investment Research

Experience:
- Exercise physiologist at Larson-Higgins (2019-11-13 - 2023-11-20)
  Measure pressure special treat professor whole war. Player site hand capital enough.
- Restaurant manager, fast food at Swanson-Jones (2024-10-06 - Present)
  At upon state despite drug ball check east.

Education:
- Bachelor''s or Master''s Degree in a relevant field from Ortiz and Sons University', 'Barry Reeves is a professional in finance, focused on roles such as financial analyst. Not carry the. News collection good real final expect week authority.',
            ARRAY['Risk Assessment', 'Excel', 'Data Analysis', 'Financial Modeling', 'Investment Research'], 'Doctor recently fear both ok. Than concern your edge role everybody. List once hospital our result partner program.', 'Bachelor''s or Master''s Degree in a relevant field',
            '{"work_mode": "Onsite", "preferred_projects": "budget analysis, portfolio management, market forecasting"}'::jsonb, 112735.03, 'Dubai, UAE',
            'Immediate', '2025-04-24',
            '{"daily_hours": "6-8", "timezone": "Auto"}'::jsonb,
            TRUE
        FROM new_user;

WITH new_user AS (
            INSERT INTO public.user_profiles (
                oauth_provider, oauth_provider_id, email, full_name,
                profile_picture, social_profile_url, user_type
            ) VALUES (
                'LinkedIn', 'linkedin_uid_31b6e696-4795-466e-9270-410ab3d79b40', 'sarahclark@yahoo.com', 'Michael Walter',
                'https://placekitten.com/51/877', 'http://rogers.net/', 'Talent'
            )
            RETURNING user_id
        )
        INSERT INTO public.talent_profiles (
            user_id, resume, bio, skills, experience, education,
            work_preferences, desired_salary, location,
            availability, available_from, time_availability, requires_two_weeks_notice
        )
        SELECT
            user_id, 'Analyzes financial data to help organizations make decisions. Passionate about delivering results in the role of financial analyst.

Skills:
- Financial Modeling
- Excel
- Investment Research
- Risk Assessment
- Data Analysis

Experience:
- Secondary school teacher at Morgan Inc (2022-06-22 - 2023-10-31)
  Source animal physical.
- Research scientist (maths) at Potter, Ruiz and Martin (2024-11-14 - Present)
  Work answer prepare reflect travel.

Education:
- Bachelor''s or Master''s Degree in a relevant field from Jackson, Clark and Daugherty University', 'Michael Walter is a professional in finance, focused on roles such as financial analyst. Pay night professional. Debate response whether show large past space.',
            ARRAY['Financial Modeling', 'Excel', 'Investment Research', 'Risk Assessment', 'Data Analysis'], 'Across scientist discussion rich health. Generation read nation condition. Contain attorney imagine brother. Cut those opportunity free. Foot end draw yeah find.', 'Bachelor''s or Master''s Degree in a relevant field',
            '{"work_mode": "Hybrid", "preferred_projects": "budget analysis, portfolio management, market forecasting"}'::jsonb, 84027.61, 'London, UK',
            'Immediate', '2025-04-25',
            '{"daily_hours": "4-6", "timezone": "Auto"}'::jsonb,
            FALSE
        FROM new_user;

WITH new_user AS (
            INSERT INTO public.user_profiles (
                oauth_provider, oauth_provider_id, email, full_name,
                profile_picture, social_profile_url, user_type
            ) VALUES (
                'Google', 'google_uid_59dc9aa1-443d-4edb-b904-9381acdd81d0', 'catherinelopez@dougherty-beck.org', 'Alison Barker',
                'https://placekitten.com/48/819', 'https://www.house.com/', 'Talent'
            )
            RETURNING user_id
        )
        INSERT INTO public.talent_profiles (
            user_id, resume, bio, skills, experience, education,
            work_preferences, desired_salary, location,
            availability, available_from, time_availability, requires_two_weeks_notice
        )
        SELECT
            user_id, 'Responsible for sourcing and hiring talent. Passionate about delivering results in the role of recruitment specialist.

Skills:
- HRIS Systems
- Employee Relations
- Talent Acquisition
- Onboarding
- Interviewing

Experience:
- Sports coach at Frazier-Garner (2021-12-25 - 2023-09-25)
  Cup return against space unit score.
- Planning and development surveyor at Jordan, Ayala and Parsons (2025-01-15 - Present)
  Level religious worry act local even surface. Know area avoid weight development.

Education:
- Bachelor''s or Master''s Degree in a relevant field from Lang, Wade and Guzman University', 'Alison Barker is a professional in hr, focused on roles such as recruitment specialist. Road civil perform matter rest their father.',
            ARRAY['HRIS Systems', 'Employee Relations', 'Talent Acquisition', 'Onboarding', 'Interviewing'], 'Wrong even pay though fast long fact his. Charge face still public region risk. Little draw tend thus family leave them. Start office deep career figure not night cold. Trade fact far nation.', 'Bachelor''s or Master''s Degree in a relevant field',
            '{"work_mode": "Hybrid", "preferred_projects": "recruitment drives, HR compliance, employee engagement"}'::jsonb, 109168.56, 'Mumbai, India',
            'Not Available', '2025-05-05',
            '{"daily_hours": "4-6", "timezone": "Auto"}'::jsonb,
            TRUE
        FROM new_user;

WITH new_user AS (
            INSERT INTO public.user_profiles (
                oauth_provider, oauth_provider_id, email, full_name,
                profile_picture, social_profile_url, user_type
            ) VALUES (
                'LinkedIn', 'linkedin_uid_ed16cad5-0780-471a-ba0e-6b9e5f8d80de', 'proctoradam@whitaker-martinez.net', 'Daniel Davis',
                'https://placekitten.com/484/530', 'http://kemp.com/', 'Talent'
            )
            RETURNING user_id
        )
        INSERT INTO public.talent_profiles (
            user_id, resume, bio, skills, experience, education,
            work_preferences, desired_salary, location,
            availability, available_from, time_availability, requires_two_weeks_notice
        )
        SELECT
            user_id, 'Responsible for sourcing and hiring talent. Passionate about delivering results in the role of recruitment specialist.

Skills:
- Onboarding
- Employee Relations
- Interviewing
- Talent Acquisition
- HRIS Systems

Experience:
- Administrator, arts at Lopez-Donovan (2020-12-04 - 2024-03-01)
  Nature own blood prove. Set thousand season recognize behind glass.
- Bonds trader at Lawson LLC (2025-01-04 - Present)
  Generation through main area drop north. Dream grow home early.

Education:
- Bachelor''s or Master''s Degree in a relevant field from Harris Inc University', 'Daniel Davis is a professional in hr, focused on roles such as recruitment specialist. Easy age employee environmental same. Bar play another he source rich light.',
            ARRAY['Onboarding', 'Employee Relations', 'Interviewing', 'Talent Acquisition', 'HRIS Systems'], 'Door small worker man recently allow suffer. Pass happen of allow material. Who for ball human fly turn.', 'Bachelor''s or Master''s Degree in a relevant field',
            '{"work_mode": "Onsite", "preferred_projects": "recruitment drives, HR compliance, employee engagement"}'::jsonb, 93920.06, 'Toronto, Canada',
            'Not Available', '2025-05-09',
            '{"daily_hours": "4-6", "timezone": "Auto"}'::jsonb,
            FALSE
        FROM new_user;

WITH new_user AS (
            INSERT INTO public.user_profiles (
                oauth_provider, oauth_provider_id, email, full_name,
                profile_picture, social_profile_url, user_type
            ) VALUES (
                'LinkedIn', 'linkedin_uid_682d1b1f-0824-47a3-b013-24078c64f6ac', 'keithbryan@yahoo.com', 'Tina Hamilton',
                'https://placekitten.com/753/989', 'http://www.soto.net/', 'Talent'
            )
            RETURNING user_id
        )
        INSERT INTO public.talent_profiles (
            user_id, resume, bio, skills, experience, education,
            work_preferences, desired_salary, location,
            availability, available_from, time_availability, requires_two_weeks_notice
        )
        SELECT
            user_id, 'Creates visual concepts and materials. Passionate about delivering results in the role of graphic designer.

Skills:
- Photoshop
- Adobe XD
- Branding
- Illustrator
- Figma

Experience:
- Accounting technician at Ruiz PLC (2022-06-01 - 2023-12-23)
  Guess environmental describe under close.
- Database administrator at Gould Inc (2024-10-16 - Present)
  Capital offer cup north board name star.

Education:
- Bachelor''s or Master''s Degree in a relevant field from Moran Ltd University', 'Tina Hamilton is a professional in design, focused on roles such as graphic designer. Walk response agreement south value defense.',
            ARRAY['Photoshop', 'Adobe XD', 'Branding', 'Illustrator', 'Figma'], 'Artist so result ago. Course far stand public. Month yard hotel strong edge.', 'Bachelor''s or Master''s Degree in a relevant field',
            '{"work_mode": "Onsite", "preferred_projects": "UI redesign, brand identity creation, cross-platform visuals"}'::jsonb, 64972.33, 'São Paulo, Brazil',
            'Not Available', '2025-04-17',
            '{"daily_hours": "4-6", "timezone": "Auto"}'::jsonb,
            TRUE
        FROM new_user;

WITH new_user AS (
            INSERT INTO public.user_profiles (
                oauth_provider, oauth_provider_id, email, full_name,
                profile_picture, social_profile_url, user_type
            ) VALUES (
                'LinkedIn', 'linkedin_uid_1605ed61-926d-4c72-b262-b72e58893357', 'eric06@gmail.com', 'Jeffrey Newman',
                'https://www.lorempixel.com/779/695', 'https://www.perkins.com/', 'Talent'
            )
            RETURNING user_id
        )
        INSERT INTO public.talent_profiles (
            user_id, resume, bio, skills, experience, education,
            work_preferences, desired_salary, location,
            availability, available_from, time_availability, requires_two_weeks_notice
        )
        SELECT
            user_id, 'Creates visual concepts and materials. Passionate about delivering results in the role of graphic designer.

Skills:
- Illustrator
- Photoshop
- Adobe XD
- Branding
- Figma

Experience:
- Aid worker at Welch, Santiago and Reed (2020-09-15 - 2023-09-25)
  Wind fund off administration with performance marriage.
- Print production planner at Clark-Miller (2025-02-28 - Present)
  Area training and arm article force figure.

Education:
- Bachelor''s or Master''s Degree in a relevant field from Henson, Gillespie and Bates University', 'Jeffrey Newman is a professional in design, focused on roles such as graphic designer. Save guy southern doctor discussion nature arrive feel. Trade plan itself a fire make.',
            ARRAY['Illustrator', 'Photoshop', 'Adobe XD', 'Branding', 'Figma'], 'Hundred possible reach science change. Decision newspaper another determine. He enter same may.', 'Bachelor''s or Master''s Degree in a relevant field',
            '{"work_mode": "Onsite", "preferred_projects": "UI redesign, brand identity creation, cross-platform visuals"}'::jsonb, 103357.65, 'Buenos Aires, Argentina',
            'Two Weeks Notice', '2025-04-24',
            '{"daily_hours": "4-6", "timezone": "Auto"}'::jsonb,
            TRUE
        FROM new_user;

WITH new_user AS (
            INSERT INTO public.user_profiles (
                oauth_provider, oauth_provider_id, email, full_name,
                profile_picture, social_profile_url, user_type
            ) VALUES (
                'Google', 'google_uid_707dc3f9-698e-46c1-8331-2afc9d2987d8', 'nicholaspowers@hotmail.com', 'Teresa Mitchell',
                'https://placeimg.com/42/273/any', 'https://www.price.com/', 'Talent'
            )
            RETURNING user_id
        )
        INSERT INTO public.talent_profiles (
            user_id, resume, bio, skills, experience, education,
            work_preferences, desired_salary, location,
            availability, available_from, time_availability, requires_two_weeks_notice
        )
        SELECT
            user_id, 'Interprets complex data to provide insights. Passionate about delivering results in the role of data analyst.

Skills:
- R
- Python
- SQL
- Pandas
- Data Wrangling

Experience:
- Interpreter at Castillo-Cobb (2020-05-21 - 2024-01-13)
  Night brother too green mission.
- Forensic scientist at Kelly Inc (2025-01-28 - Present)
  National drug explain would. Enjoy officer level cost.

Education:
- Bachelor''s or Master''s Degree in a relevant field from Gregory-Sanchez University', 'Teresa Mitchell is a professional in data, focused on roles such as data analyst. Rate pick work produce nature local. Under a there.',
            ARRAY['R', 'Python', 'SQL', 'Pandas', 'Data Wrangling'], 'Open would public author pay who democratic. Three quickly ability cost reality. Play since offer very west company listen site. Friend deal because consumer nor party rich this.', 'Bachelor''s or Master''s Degree in a relevant field',
            '{"work_mode": "Hybrid", "preferred_projects": "data pipeline development, machine learning models, analytics dashboards"}'::jsonb, 102949.09, 'Paris, France',
            '3 Months', '2025-04-02',
            '{"daily_hours": "4-6", "timezone": "Auto"}'::jsonb,
            TRUE
        FROM new_user;

WITH new_user AS (
            INSERT INTO public.user_profiles (
                oauth_provider, oauth_provider_id, email, full_name,
                profile_picture, social_profile_url, user_type
            ) VALUES (
                'Google', 'google_uid_633a35af-75a8-4698-9334-050b58037523', 'hhubbard@mcclain-harrington.com', 'Douglas Glover',
                'https://www.lorempixel.com/413/924', 'http://www.fritz-odom.org/', 'Talent'
            )
            RETURNING user_id
        )
        INSERT INTO public.talent_profiles (
            user_id, resume, bio, skills, experience, education,
            work_preferences, desired_salary, location,
            availability, available_from, time_availability, requires_two_weeks_notice
        )
        SELECT
            user_id, 'Interprets complex data to provide insights. Passionate about delivering results in the role of data analyst.

Skills:
- Pandas
- R
- SQL
- Machine Learning
- Data Wrangling

Experience:
- Insurance risk surveyor at Wilson-Hughes (2020-03-07 - 2024-02-01)
  Finish order sign Congress alone.
- Colour technologist at Walters LLC (2024-08-23 - Present)
  Factor phone reach base against. Possible daughter trip true.

Education:
- Bachelor''s or Master''s Degree in a relevant field from Watson Ltd University', 'Douglas Glover is a professional in data, focused on roles such as data analyst. Practice discuss by agency manager. No government open instead method last amount.',
            ARRAY['Pandas', 'R', 'SQL', 'Machine Learning', 'Data Wrangling'], 'Never page dinner including eight executive. Recently road language least ago performance country. Carry election might moment either. Hot pass say cup.', 'Bachelor''s or Master''s Degree in a relevant field',
            '{"work_mode": "Onsite", "preferred_projects": "data pipeline development, machine learning models, analytics dashboards"}'::jsonb, 52849.08, 'Riyadh, Saudi Arabia',
            'Two Weeks Notice', '2025-03-30',
            '{"daily_hours": "4-6", "timezone": "Auto"}'::jsonb,
            TRUE
        FROM new_user;