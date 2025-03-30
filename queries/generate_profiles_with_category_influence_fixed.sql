WITH new_user AS (
        INSERT INTO public.user_profiles (
            oauth_provider, oauth_provider_id, email, full_name,
            profile_picture, social_profile_url, user_type
        ) VALUES (
            'LinkedIn', 'linkedin_uid_dc6ac76e-3dfa-4329-ac97-101f2f9c1ca0', 'dana50@kent-torres.com', 'Joshua Perkins',
            'https://placeimg.com/625/196/any', 'http://www.blackwell.info/', 'Talent'
        )
        RETURNING user_id
    )
    INSERT INTO public.talent_profiles (
        user_id, resume, bio, skills, experience, education,
        work_preferences, desired_salary, location,
        availability, available_from, time_availability, requires_two_weeks_notice
    )
    SELECT
        user_id, 'Responsible for overseeing content strategy and execution. Event form imagine. Project since together several bit sign. Goal behind record from whole. Use mind country song ahead.
Strong doctor bad management old board bad nation. Boy piece public. Memory bad own.
Protect but black time. Politics line begin. Possible treat police.
Marriage time up. Threat with wear into call thus. Finally perform author street often project. Tax coach experience list culture.', 'Joshua Perkins is a seasoned professional in marketing, currently focused on roles like content marketing manager. Thus baby seven city. Set trouble move check back majority.',
        ARRAY['SEO', 'Copywriting', 'Social Media Marketing', 'Email Marketing', 'Content Strategy'], 'Can deal vote especially. Sure defense grow general if science. Sure make throw carry lay strong. Decade easy customer east degree.', 'Bachelor''s or Master''s Degree in a relevant field',
        '{"work_mode": "Remote", "preferred_projects": "SEO campaigns, content marketing, brand engagement"}'::jsonb, 102367.18, 'Sydney, Australia',
        '3 Months', '2025-05-11',
        '{"daily_hours": "6-8", "timezone": "Auto"}'::jsonb,
        FALSE
    FROM new_user;

WITH new_user AS (
        INSERT INTO public.user_profiles (
            oauth_provider, oauth_provider_id, email, full_name,
            profile_picture, social_profile_url, user_type
        ) VALUES (
            'LinkedIn', 'linkedin_uid_906012f0-cf9e-484b-bb8f-5e56aa257402', 'brockkrystal@gmail.com', 'Lee Martinez',
            'https://placeimg.com/657/714/any', 'https://www.sanford.com/', 'Talent'
        )
        RETURNING user_id
    )
    INSERT INTO public.talent_profiles (
        user_id, resume, bio, skills, experience, education,
        work_preferences, desired_salary, location,
        availability, available_from, time_availability, requires_two_weeks_notice
    )
    SELECT
        user_id, 'Creates digital assets and content for marketing purposes. North yard occur discover. Serious might represent.
What benefit career point weight. Rise down significant campaign.
Safe official dinner recognize. Audience whether subject car argue wind dog.
Call evidence air brother seek. Herself go along camera something black break. Car art east run.
Across bad indeed fill my the. But city condition follow should bad.
List account around door.
Throughout technology current picture media ago.', 'Lee Martinez is a seasoned professional in general, currently focused on roles like digital content creator. Buy month paper state eye. Door after suggest.',
        ARRAY['Project Management', 'SEO', 'Graphic Design', 'Public Speaking', 'Paid Advertising'], 'Practice pick cover. Expect red light alone direction reason bar. Nothing of response total hair industry outside.', 'Bachelor''s or Master''s Degree in a relevant field',
        '{"work_mode": "Onsite", "preferred_projects": "general projects, teamwork, client collaboration"}'::jsonb, 129170.18, 'Sydney, Australia',
        'Not Available', '2025-04-30',
        '{"daily_hours": "4-6", "timezone": "Auto"}'::jsonb,
        FALSE
    FROM new_user;

WITH new_user AS (
        INSERT INTO public.user_profiles (
            oauth_provider, oauth_provider_id, email, full_name,
            profile_picture, social_profile_url, user_type
        ) VALUES (
            'Google', 'google_uid_d510a327-4294-4d68-b2c4-6b768a053ff2', 'frankkim@hotmail.com', 'Mary Maldonado',
            'https://placeimg.com/627/286/any', 'https://www.davis.com/', 'Talent'
        )
        RETURNING user_id
    )
    INSERT INTO public.talent_profiles (
        user_id, resume, bio, skills, experience, education,
        work_preferences, desired_salary, location,
        availability, available_from, time_availability, requires_two_weeks_notice
    )
    SELECT
        user_id, 'Handles both frontend and backend development of applications. Go federal condition throughout.
Here know night result method company. Must parent the brother. Gun economy conference technology moment.
Respond history face last fund while. Center maintain beat. Hundred yeah religious black do improve suggest.
Watch toward decide federal management. Matter left let rest.
Imagine among thank election offer strong. Listen institution stuff partner sign card bed.
Attorney lay same for score idea evidence shoulder. Answer high news operation. Cover person down.', 'Mary Maldonado is a seasoned professional in general, currently focused on roles like full stack developer. Reason safe medical exist level your. Think until thousand president your how.',
        ARRAY['SEO', 'UX Design', 'Data Analysis', 'Content Creation', 'Cloud Computing'], 'Article hard weight. Similar should others bank however miss language. Push line address. Popular claim whose interest mention.', 'Bachelor''s or Master''s Degree in a relevant field',
        '{"work_mode": "Hybrid", "preferred_projects": "general projects, teamwork, client collaboration"}'::jsonb, 58104.69, 'Riyadh, Saudi Arabia',
        '3 Months', '2025-04-16',
        '{"daily_hours": "4-6", "timezone": "Auto"}'::jsonb,
        TRUE
    FROM new_user;

WITH new_user AS (
        INSERT INTO public.user_profiles (
            oauth_provider, oauth_provider_id, email, full_name,
            profile_picture, social_profile_url, user_type
        ) VALUES (
            'Google', 'google_uid_bb89f919-c6af-47ba-90aa-048d664e37bb', 'hannah57@hotmail.com', 'Miss Stephanie Brown',
            'https://dummyimage.com/202x112', 'https://www.lester.com/', 'Talent'
        )
        RETURNING user_id
    )
    INSERT INTO public.talent_profiles (
        user_id, resume, bio, skills, experience, education,
        work_preferences, desired_salary, location,
        availability, available_from, time_availability, requires_two_weeks_notice
    )
    SELECT
        user_id, 'Analyzes financial data and prepares reports for decision making. At born word describe Democrat agree cup. Floor religious where human.
Weight husband security. Trial who right ready rich after doctor.
Institution nice material behavior six east surface. Threat very course. Thus account nature debate must.
Eye apply almost would.
Response wear cause pretty court human north. On make raise impact particularly.
Notice discover performance could traditional difference rule.
Generation name nation never fly. Guy play more stock section.', 'Miss Stephanie Brown is a seasoned professional in general, currently focused on roles like financial analyst. Form interesting enter sport strong. Miss set which policy store relationship carry.',
        ARRAY['Data Visualization', 'Cloud Computing', 'UX Design', 'Project Management', 'Python'], 'Both base knowledge type weight. New resource near eat. Certain set central follow eye your. Father pattern already service among head weight drop.', 'Bachelor''s or Master''s Degree in a relevant field',
        '{"work_mode": "Remote", "preferred_projects": "general projects, teamwork, client collaboration"}'::jsonb, 73803.79, 'Cairo, Egypt',
        '3 Months', '2025-04-20',
        '{"daily_hours": "6-8", "timezone": "Auto"}'::jsonb,
        FALSE
    FROM new_user;

WITH new_user AS (
        INSERT INTO public.user_profiles (
            oauth_provider, oauth_provider_id, email, full_name,
            profile_picture, social_profile_url, user_type
        ) VALUES (
            'Google', 'google_uid_55f0a05c-7c7d-4719-944d-6e90435f807e', 'franklinkatie@wolfe-bell.net', 'Caitlyn Moore',
            'https://dummyimage.com/148x230', 'https://www.moore-pittman.com/', 'Talent'
        )
        RETURNING user_id
    )
    INSERT INTO public.talent_profiles (
        user_id, resume, bio, skills, experience, education,
        work_preferences, desired_salary, location,
        availability, available_from, time_availability, requires_two_weeks_notice
    )
    SELECT
        user_id, 'Manages end-to-end recruitment and talent acquisition processes. Last cause forward common with minute become. Her her soon. Least radio four teacher four charge.
Rule describe where minute policy quite someone. Fact audience student.
Task yourself chair improve sense agree. Call down Mrs lawyer. He painting discuss Republican. Eight partner group into.
Production wall heart former past team know. Read wrong fish forget decade military.', 'Caitlyn Moore is a seasoned professional in general, currently focused on roles like recruitment specialist. Learn quality scene admit I both alone.',
        ARRAY['Cloud Computing', 'Content Creation', 'Graphic Design', 'UX Design', 'Paid Advertising'], 'Issue trade body have miss. Enter condition rather head white field case. Pretty recently get place law explain.', 'Bachelor''s or Master''s Degree in a relevant field',
        '{"work_mode": "Remote", "preferred_projects": "general projects, teamwork, client collaboration"}'::jsonb, 128650.35, 'Rome, Italy',
        'Not Available', '2025-05-04',
        '{"daily_hours": "6-8", "timezone": "Auto"}'::jsonb,
        TRUE
    FROM new_user;

WITH new_user AS (
        INSERT INTO public.user_profiles (
            oauth_provider, oauth_provider_id, email, full_name,
            profile_picture, social_profile_url, user_type
        ) VALUES (
            'LinkedIn', 'linkedin_uid_d8731e1b-66b4-4aef-a15a-d10ac88a027b', 'frazierlauren@hotmail.com', 'Brittney Campbell',
            'https://placeimg.com/65/565/any', 'http://www.white-fisher.net/', 'Talent'
        )
        RETURNING user_id
    )
    INSERT INTO public.talent_profiles (
        user_id, resume, bio, skills, experience, education,
        work_preferences, desired_salary, location,
        availability, available_from, time_availability, requires_two_weeks_notice
    )
    SELECT
        user_id, 'Designs intuitive and visually appealing user interfaces. Student security focus final finish top thank. Attack trip half yes series. Agency place clear. Fight music task ground six nation any discover.
Million fine that question walk. Purpose star new film rock produce.
Personal citizen citizen. Interest project mouth pressure.
Already green throughout. Look seat professional other choose shoulder. Class letter during manager they into argue.
Myself cause notice buy talk. Expect degree protect Republican. Turn her help money city old pass.', 'Brittney Campbell is a seasoned professional in design, currently focused on roles like ux/ui designer. Herself whom start difficult whose ability paper wish. Member according teacher practice.',
        ARRAY['Adobe XD', 'Branding', 'Illustrator', 'Photoshop', 'Figma'], 'Current value line yard. Receive store bring see wide employee. Development information eat what magazine hot he.', 'Bachelor''s or Master''s Degree in a relevant field',
        '{"work_mode": "Hybrid", "preferred_projects": "UI redesign, brand identity creation, cross-platform visuals"}'::jsonb, 107252.78, 'Cape Town, South Africa',
        '1 Month', '2025-04-13',
        '{"daily_hours": "6-8", "timezone": "Auto"}'::jsonb,
        TRUE
    FROM new_user;

WITH new_user AS (
        INSERT INTO public.user_profiles (
            oauth_provider, oauth_provider_id, email, full_name,
            profile_picture, social_profile_url, user_type
        ) VALUES (
            'LinkedIn', 'linkedin_uid_ea05531a-a646-4844-9156-c568c406b3f1', 'martinezhannah@hotmail.com', 'Tamara Neal',
            'https://placekitten.com/379/983', 'https://www.morgan-floyd.info/', 'Talent'
        )
        RETURNING user_id
    )
    INSERT INTO public.talent_profiles (
        user_id, resume, bio, skills, experience, education,
        work_preferences, desired_salary, location,
        availability, available_from, time_availability, requires_two_weeks_notice
    )
    SELECT
        user_id, 'Builds ML models and pipelines for intelligent applications. Memory artist staff. Third owner mean need watch.
Among certainly region. Staff sing reveal be also authority employee.
Movie himself food less lawyer. Pretty section discussion dream.
Pressure image start mention many gas gas. Area participant hotel power thing time. Business much see agency.
Bed stay nor on. Measure item friend others win lead. Throughout effect culture sit.', 'Tamara Neal is a seasoned professional in general, currently focused on roles like machine learning engineer. Even wonder bank senior simply look. Large answer base.',
        ARRAY['SQL', 'Graphic Design', 'Project Management', 'Marketing Strategy', 'Data Visualization'], 'Community land thought PM. Rule everybody attorney heavy success during network. Window feeling world tough stay your.', 'Bachelor''s or Master''s Degree in a relevant field',
        '{"work_mode": "Hybrid", "preferred_projects": "general projects, teamwork, client collaboration"}'::jsonb, 124499.03, 'Riyadh, Saudi Arabia',
        'Not Available', '2025-04-04',
        '{"daily_hours": "6-8", "timezone": "Auto"}'::jsonb,
        FALSE
    FROM new_user;

WITH new_user AS (
        INSERT INTO public.user_profiles (
            oauth_provider, oauth_provider_id, email, full_name,
            profile_picture, social_profile_url, user_type
        ) VALUES (
            'Google', 'google_uid_ac600131-4c8f-4fb2-98d2-f63a2f7757e0', 'michael24@hotmail.com', 'Cheyenne Montgomery',
            'https://dummyimage.com/576x653', 'http://cohen-taylor.com/', 'Talent'
        )
        RETURNING user_id
    )
    INSERT INTO public.talent_profiles (
        user_id, resume, bio, skills, experience, education,
        work_preferences, desired_salary, location,
        availability, available_from, time_availability, requires_two_weeks_notice
    )
    SELECT
        user_id, 'Improves search engine rankings through on-page and off-page optimization. Himself director instead clearly current rule. Price such cause past mean water. Would under believe event that.
Behind page option his general grow remain. Three practice woman writer.
Apply happy send street your blood. Tonight yard line remain economy talk billion few. Land face stage kind loss nothing.
Off sing indicate nothing choose per hold health. Manager project garden way way. Available account agreement door figure relate.', 'Cheyenne Montgomery is a seasoned professional in general, currently focused on roles like seo strategist. His political including just factor. Before sister off economy.',
        ARRAY['Content Creation', 'Data Analysis', 'Graphic Design', 'UX Design', 'Paid Advertising'], 'Compare account quickly well. Camera store area meet nation. Rich national magazine inside position. Nature rise participant green heavy father effect dog.', 'Bachelor''s or Master''s Degree in a relevant field',
        '{"work_mode": "Remote", "preferred_projects": "general projects, teamwork, client collaboration"}'::jsonb, 56804.31, 'São Paulo, Brazil',
        'Two Weeks Notice', '2025-05-15',
        '{"daily_hours": "6-8", "timezone": "Auto"}'::jsonb,
        FALSE
    FROM new_user;

WITH new_user AS (
        INSERT INTO public.user_profiles (
            oauth_provider, oauth_provider_id, email, full_name,
            profile_picture, social_profile_url, user_type
        ) VALUES (
            'Google', 'google_uid_15777290-664a-4e8c-8028-2bf19efb8b2f', 'andersonadam@yahoo.com', 'Deborah Hughes',
            'https://dummyimage.com/404x867', 'http://www.freeman.net/', 'Talent'
        )
        RETURNING user_id
    )
    INSERT INTO public.talent_profiles (
        user_id, resume, bio, skills, experience, education,
        work_preferences, desired_salary, location,
        availability, available_from, time_availability, requires_two_weeks_notice
    )
    SELECT
        user_id, 'Creates visual content for branding and marketing campaigns. Year end democratic memory statement American raise future. White bill animal court figure leave policy. For now indicate become no memory.
Experience shake center hotel. Big cause across while evening.
Here including clearly. Physical suggest recently short process find. Right red wish growth cover. Line cut set third across result day.
Author that economy rock partner term. Civil need on election present space surface. Weight official marriage teach market public.', 'Deborah Hughes is a seasoned professional in design, currently focused on roles like graphic designer. Force specific that author spring wear race consumer. Section hit throw help carry.',
        ARRAY['Figma', 'Branding', 'Photoshop', 'Adobe XD', 'Illustrator'], 'Could light later ago figure we close with. Unit crime improve ask themselves political professor.', 'Bachelor''s or Master''s Degree in a relevant field',
        '{"work_mode": "Onsite", "preferred_projects": "UI redesign, brand identity creation, cross-platform visuals"}'::jsonb, 82547.49, 'London, UK',
        '3 Months', '2025-05-07',
        '{"daily_hours": "4-6", "timezone": "Auto"}'::jsonb,
        TRUE
    FROM new_user;

WITH new_user AS (
        INSERT INTO public.user_profiles (
            oauth_provider, oauth_provider_id, email, full_name,
            profile_picture, social_profile_url, user_type
        ) VALUES (
            'Google', 'google_uid_557b2cdc-a5f3-4848-a4ce-369c11dee3aa', 'amandagonzalez@gmail.com', 'Jeffrey Weber',
            'https://dummyimage.com/378x371', 'https://love.com/', 'Talent'
        )
        RETURNING user_id
    )
    INSERT INTO public.talent_profiles (
        user_id, resume, bio, skills, experience, education,
        work_preferences, desired_salary, location,
        availability, available_from, time_availability, requires_two_weeks_notice
    )
    SELECT
        user_id, 'Develops strategies for asset allocation and investment portfolios. Rock response key military control. Fly life book movie. Week size part possible. Fill concern unit also together century walk TV.
Through fish director respond player. Hit material which less develop along. Anyone develop sound wish member win.
High give few remain when. Media four investment. Away natural PM personal wait.
Talk quality value on receive. Call professor kitchen remember while cell. Four board wish buy maintain will sea agency.', 'Jeffrey Weber is a seasoned professional in general, currently focused on roles like investment strategist. Movie bag project on general. Yes performance get about.',
        ARRAY['Cloud Computing', 'Project Management', 'Public Speaking', 'Graphic Design', 'UX Design'], 'Stock up campaign listen coach require. Night standard majority man middle decade money minute. However pull radio sign record catch.', 'Bachelor''s or Master''s Degree in a relevant field',
        '{"work_mode": "Hybrid", "preferred_projects": "general projects, teamwork, client collaboration"}'::jsonb, 52244.0, 'Mexico City, Mexico',
        'Two Weeks Notice', '2025-04-09',
        '{"daily_hours": "Flexible", "timezone": "Auto"}'::jsonb,
        TRUE
    FROM new_user;