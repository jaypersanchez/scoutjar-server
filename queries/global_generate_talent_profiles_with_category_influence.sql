WITH new_user AS (
        INSERT INTO public.user_profiles (
            oauth_provider, oauth_provider_id, email, full_name,
            profile_picture, social_profile_url, user_type
        ) VALUES (
            'LinkedIn', 'linkedin_uid_59e05b06-2fbe-4409-bd6f-59e45f3dcaf8', 'gtran@hotmail.com', 'Susan Bauer',
            'https://dummyimage.com/415x246', 'http://www.wilson-benitez.com/', 'Talent'
        )
        RETURNING user_id
    )
    INSERT INTO public.talent_profiles (
        user_id, resume, bio, skills, experience, education,
        work_preferences, desired_salary, location,
        availability, available_from, time_availability, requires_two_weeks_notice
    )
    SELECT
        user_id, 'Responsible for overseeing content strategy and execution. Interest wonder respond almost fall while. How college life wind. Out purpose end bed on.
Nature glass know run. Defense structure music quickly require morning. Yeah thing though.
From appear media along rise news design.
Light his where design glass store. Hair research sit. Character ever over natural fly focus begin continue.
Important officer summer share cause newspaper cultural. Although sport bill check huge. Space very exist side worker. Simple statement subject course.', 'Susan Bauer is a seasoned professional in marketing, currently focused on roles like content marketing manager. Analysis mission color more continue director let. Must sing million it.',
        ARRAY['Copywriting', 'Content Strategy', 'Email Marketing', 'Social Media Marketing', 'SEO'], 'Prepare nature official chair. Involve herself half Congress animal sense age describe.', 'Bachelor's or Master's Degree in a relevant field',
        '{"work_mode": "Onsite", "preferred_projects": "SEO campaigns, content marketing, brand engagement"}'::jsonb, 116659.38, 'Rome, Italy',
        'Not Available', '2025-05-19',
        '{"daily_hours": "4-6", "timezone": "Auto"}'::jsonb,
        TRUE
    FROM new_user;

WITH new_user AS (
        INSERT INTO public.user_profiles (
            oauth_provider, oauth_provider_id, email, full_name,
            profile_picture, social_profile_url, user_type
        ) VALUES (
            'Google', 'google_uid_5a9580e0-cc6f-459b-b109-66b8accbc6aa', 'christine03@hotmail.com', 'Katherine Hampton',
            'https://placeimg.com/1016/703/any', 'https://www.walker.com/', 'Talent'
        )
        RETURNING user_id
    )
    INSERT INTO public.talent_profiles (
        user_id, resume, bio, skills, experience, education,
        work_preferences, desired_salary, location,
        availability, available_from, time_availability, requires_two_weeks_notice
    )
    SELECT
        user_id, 'Creates digital assets and content for marketing purposes. Here skin make want like law.
Piece however attention interview identify grow book. Exactly bring full cold but shake.
Born seek say must near provide win difference. Range knowledge also.
Audience enough help us all.
Garden drop not thank. Beat pretty religious hour skin air.
Produce improve throughout. Think task event that. Say seat impact though claim box.
That dark great investment receive Mrs relationship style. Fill pass and build.', 'Katherine Hampton is a seasoned professional in general, currently focused on roles like digital content creator. Try able two.',
        ARRAY['Python', 'Marketing Strategy', 'SEM', 'Content Creation', 'Graphic Design'], 'Law do mean onto health while. Improve maybe receive benefit either. Child road treat adult common prepare question tree. Discuss forget dark.', 'Bachelor's or Master's Degree in a relevant field',
        '{"work_mode": "Remote", "preferred_projects": "general projects, teamwork, client collaboration"}'::jsonb, 124414.82, 'Cape Town, South Africa',
        '3 Months', '2025-03-31',
        '{"daily_hours": "4-6", "timezone": "Auto"}'::jsonb,
        FALSE
    FROM new_user;

WITH new_user AS (
        INSERT INTO public.user_profiles (
            oauth_provider, oauth_provider_id, email, full_name,
            profile_picture, social_profile_url, user_type
        ) VALUES (
            'LinkedIn', 'linkedin_uid_9b9bb090-8e4c-47b5-be6a-1d1a4d83149d', 'kimdavis@hotmail.com', 'Jacob Contreras',
            'https://dummyimage.com/802x199', 'http://www.blankenship.org/', 'Talent'
        )
        RETURNING user_id
    )
    INSERT INTO public.talent_profiles (
        user_id, resume, bio, skills, experience, education,
        work_preferences, desired_salary, location,
        availability, available_from, time_availability, requires_two_weeks_notice
    )
    SELECT
        user_id, 'Handles both frontend and backend development of applications. Charge stuff half hand campaign threat cultural. Tend main little. Center stop develop somebody education weight.
Lead thus choose opportunity. Front thought return imagine.
Decision information central reality. Organization participant off describe real always.
Goal instead decade relationship hour agreement product. Mrs too design over. Main civil consumer federal material discuss.', 'Jacob Contreras is a seasoned professional in general, currently focused on roles like full stack developer. Others its Mrs. Prevent name brother foreign fine.',
        ARRAY['Data Analysis', 'Paid Advertising', 'Public Speaking', 'Data Visualization', 'SEM'], 'Which add bad beyond nearly admit agree. Seven body recent college direction receive pass. Religious sport other than personal. Sing right myself fly.', 'Bachelor's or Master's Degree in a relevant field',
        '{"work_mode": "Onsite", "preferred_projects": "general projects, teamwork, client collaboration"}'::jsonb, 83780.04, 'Sydney, Australia',
        'Immediate', '2025-05-13',
        '{"daily_hours": "4-6", "timezone": "Auto"}'::jsonb,
        TRUE
    FROM new_user;

WITH new_user AS (
        INSERT INTO public.user_profiles (
            oauth_provider, oauth_provider_id, email, full_name,
            profile_picture, social_profile_url, user_type
        ) VALUES (
            'Google', 'google_uid_e21f4294-ab31-47ab-91eb-ddab5b50b099', 'paul54@burch.com', 'Dawn Wade',
            'https://placeimg.com/381/690/any', 'https://www.turner-mccoy.biz/', 'Talent'
        )
        RETURNING user_id
    )
    INSERT INTO public.talent_profiles (
        user_id, resume, bio, skills, experience, education,
        work_preferences, desired_salary, location,
        availability, available_from, time_availability, requires_two_weeks_notice
    )
    SELECT
        user_id, 'Analyzes financial data and prepares reports for decision making. Perhaps senior need memory blood nation. Success enter trip young fly throughout.
Year look green suffer daughter. Car resource film subject account. History notice third decade.
Wait cell feeling defense. Service word method movie.
End check again marriage enough piece. Society growth including important. Especially world trial fly reflect sort upon.
Then up use magazine president. Security miss smile hour. Situation blood air executive deep feeling development.', 'Dawn Wade is a seasoned professional in general, currently focused on roles like financial analyst. Less food tree do.',
        ARRAY['Data Analysis', 'Content Creation', 'Data Visualization', 'SEM', 'Project Management'], 'Thank election sometimes cold type every believe. Walk guess point investment source street most. Least sea stuff learn itself. Near edge interview current nation few.', 'Bachelor's or Master's Degree in a relevant field',
        '{"work_mode": "Hybrid", "preferred_projects": "general projects, teamwork, client collaboration"}'::jsonb, 86312.89, 'Sydney, Australia',
        '1 Month', '2025-04-16',
        '{"daily_hours": "Flexible", "timezone": "Auto"}'::jsonb,
        TRUE
    FROM new_user;

WITH new_user AS (
        INSERT INTO public.user_profiles (
            oauth_provider, oauth_provider_id, email, full_name,
            profile_picture, social_profile_url, user_type
        ) VALUES (
            'LinkedIn', 'linkedin_uid_ab49f576-15e5-4623-9414-15ddb41348c7', 'rojassara@gmail.com', 'Heidi Johnson',
            'https://dummyimage.com/179x1022', 'https://www.dickson-taylor.biz/', 'Talent'
        )
        RETURNING user_id
    )
    INSERT INTO public.talent_profiles (
        user_id, resume, bio, skills, experience, education,
        work_preferences, desired_salary, location,
        availability, available_from, time_availability, requires_two_weeks_notice
    )
    SELECT
        user_id, 'Manages end-to-end recruitment and talent acquisition processes. Run exist try beat quite society sign. Carry prevent former hotel military big. Different loss political see officer.
Share strong shoulder.
Social pay military before create. Party on skin pattern significant.
Executive cold thing involve tonight. Morning or fast international. Home pick message spring. Pay federal if.
Against memory close quality then shake size. Reveal successful each current.
Run number sing avoid life do. Democrat foreign respond market vote moment others.', 'Heidi Johnson is a seasoned professional in general, currently focused on roles like recruitment specialist. Writer interesting job new method hear. Board technology follow.',
        ARRAY['UX Design', 'Paid Advertising', 'Data Visualization', 'SEO', 'Marketing Strategy'], 'Blood else move opportunity set year. Apply paper may begin meeting. Benefit practice per direction traditional information dinner.', 'Bachelor's or Master's Degree in a relevant field',
        '{"work_mode": "Hybrid", "preferred_projects": "general projects, teamwork, client collaboration"}'::jsonb, 118964.55, 'New York, USA',
        '3 Months', '2025-04-27',
        '{"daily_hours": "Flexible", "timezone": "Auto"}'::jsonb,
        TRUE
    FROM new_user;

WITH new_user AS (
        INSERT INTO public.user_profiles (
            oauth_provider, oauth_provider_id, email, full_name,
            profile_picture, social_profile_url, user_type
        ) VALUES (
            'Google', 'google_uid_edeefc03-0c4c-41fe-8ad8-01db3d431066', 'dylanmathis@gmail.com', 'Teresa Johnson',
            'https://placekitten.com/627/183', 'http://www.sims-graves.biz/', 'Talent'
        )
        RETURNING user_id
    )
    INSERT INTO public.talent_profiles (
        user_id, resume, bio, skills, experience, education,
        work_preferences, desired_salary, location,
        availability, available_from, time_availability, requires_two_weeks_notice
    )
    SELECT
        user_id, 'Designs intuitive and visually appealing user interfaces. Anyone difference we any.
Court spend event best mission hope carry PM. Listen military page either conference alone. Or relate back.
Likely use treatment white majority after. Feel believe start carry lay. Month bill though fly write side.
Fire staff cause out. Toward everything theory eye government foot defense. Claim finally plan this certain half add.
Door ball minute senior plant trial. Nation foreign party box north fish sound lead. Method receive yeah mention old evidence.', 'Teresa Johnson is a seasoned professional in design, currently focused on roles like ux/ui designer. While than material president.',
        ARRAY['Photoshop', 'Illustrator', 'Branding', 'Adobe XD', 'Figma'], 'Machine care over share least. Statement election mission opportunity air until.', 'Bachelor's or Master's Degree in a relevant field',
        '{"work_mode": "Onsite", "preferred_projects": "UI redesign, brand identity creation, cross-platform visuals"}'::jsonb, 57903.02, 'Bangkok, Thailand',
        'Two Weeks Notice', '2025-05-19',
        '{"daily_hours": "4-6", "timezone": "Auto"}'::jsonb,
        FALSE
    FROM new_user;

WITH new_user AS (
        INSERT INTO public.user_profiles (
            oauth_provider, oauth_provider_id, email, full_name,
            profile_picture, social_profile_url, user_type
        ) VALUES (
            'Google', 'google_uid_a8ec454e-8276-4073-b945-bafdd3bf614a', 'rebeccamorton@hotmail.com', 'Adam Myers',
            'https://placekitten.com/893/716', 'http://www.garza.com/', 'Talent'
        )
        RETURNING user_id
    )
    INSERT INTO public.talent_profiles (
        user_id, resume, bio, skills, experience, education,
        work_preferences, desired_salary, location,
        availability, available_from, time_availability, requires_two_weeks_notice
    )
    SELECT
        user_id, 'Builds ML models and pipelines for intelligent applications. Skill ever its reflect place face pattern. Wait before reflect collection happen. Safe task business can by vote upon.
Forward positive trade four question truth admit. Avoid public quite. Stock reduce analysis.
Truth learn some represent PM receive fall. Go stop condition produce remain college movement budget.
Movie sport organization can artist piece serve. Staff couple box blue language.', 'Adam Myers is a seasoned professional in general, currently focused on roles like machine learning engineer. Camera production decide about until contain. Account car but.',
        ARRAY['UX Design', 'JavaScript', 'Cloud Computing', 'Graphic Design', 'SEO'], 'Debate along just fish about record. Billion popular I tough institution effect visit. Garden what learn board low. Look walk nation.', 'Bachelor's or Master's Degree in a relevant field',
        '{"work_mode": "Onsite", "preferred_projects": "general projects, teamwork, client collaboration"}'::jsonb, 75725.77, 'Toronto, Canada',
        'Two Weeks Notice', '2025-04-14',
        '{"daily_hours": "6-8", "timezone": "Auto"}'::jsonb,
        FALSE
    FROM new_user;

WITH new_user AS (
        INSERT INTO public.user_profiles (
            oauth_provider, oauth_provider_id, email, full_name,
            profile_picture, social_profile_url, user_type
        ) VALUES (
            'LinkedIn', 'linkedin_uid_22a77ca2-a8d7-456d-a8ab-3ef126e2a651', 'cummingsrobert@brown.com', 'Brittany Lindsey',
            'https://dummyimage.com/27x61', 'http://holden.com/', 'Talent'
        )
        RETURNING user_id
    )
    INSERT INTO public.talent_profiles (
        user_id, resume, bio, skills, experience, education,
        work_preferences, desired_salary, location,
        availability, available_from, time_availability, requires_two_weeks_notice
    )
    SELECT
        user_id, 'Improves search engine rankings through on-page and off-page optimization. People subject technology week. Attention two assume shoulder tonight role. Give arrive soldier.
Cost each other new first. Put then although society.
Western send including mention significant one. Tree toward international rich.
Painting production baby probably father dinner lot. Discuss plant stuff whom dream despite line. North few raise all meeting bank former.
Role upon evidence training. Building yeah food design town piece mission. Whose new exist herself growth.', 'Brittany Lindsey is a seasoned professional in general, currently focused on roles like seo strategist. Husband school town perform truth.',
        ARRAY['Data Visualization', 'Project Management', 'Data Analysis', 'Graphic Design', 'Python'], 'Determine have summer lay. Food boy say mind film sing coach appear. Simple baby film work various.', 'Bachelor's or Master's Degree in a relevant field',
        '{"work_mode": "Onsite", "preferred_projects": "general projects, teamwork, client collaboration"}'::jsonb, 109790.89, 'Lima, Peru',
        'Two Weeks Notice', '2025-04-03',
        '{"daily_hours": "Flexible", "timezone": "Auto"}'::jsonb,
        TRUE
    FROM new_user;

WITH new_user AS (
        INSERT INTO public.user_profiles (
            oauth_provider, oauth_provider_id, email, full_name,
            profile_picture, social_profile_url, user_type
        ) VALUES (
            'LinkedIn', 'linkedin_uid_cb9516d6-05c1-45dd-ac63-f4d5e2f13508', 'vbell@yahoo.com', 'Joseph Banks',
            'https://placekitten.com/372/347', 'https://johnson.com/', 'Talent'
        )
        RETURNING user_id
    )
    INSERT INTO public.talent_profiles (
        user_id, resume, bio, skills, experience, education,
        work_preferences, desired_salary, location,
        availability, available_from, time_availability, requires_two_weeks_notice
    )
    SELECT
        user_id, 'Creates visual content for branding and marketing campaigns. Successful allow race inside financial. Card house finally your concern gun. Safe return four loss.
Put reduce old police nor law control. Shake friend on teacher. What oil trial growth style resource want.
Thank speak financial opportunity. Price early born.
Police most claim country toward rise body. Opportunity style science fly sing daughter ready. Cover success happen personal behavior today environmental information.
Size may few mission build impact. Attorney worker weight first your.', 'Joseph Banks is a seasoned professional in design, currently focused on roles like graphic designer. Base realize discuss. Arrive top area look beat yeah.',
        ARRAY['Adobe XD', 'Branding', 'Photoshop', 'Figma', 'Illustrator'], 'But certain cause chair. Test administration nearly people network better. Best difference town benefit. Enter model miss doctor perhaps dog. Agree their sister or.', 'Bachelor's or Master's Degree in a relevant field',
        '{"work_mode": "Hybrid", "preferred_projects": "UI redesign, brand identity creation, cross-platform visuals"}'::jsonb, 80343.89, 'Rome, Italy',
        '1 Month', '2025-05-12',
        '{"daily_hours": "6-8", "timezone": "Auto"}'::jsonb,
        FALSE
    FROM new_user;

WITH new_user AS (
        INSERT INTO public.user_profiles (
            oauth_provider, oauth_provider_id, email, full_name,
            profile_picture, social_profile_url, user_type
        ) VALUES (
            'LinkedIn', 'linkedin_uid_0fe53b70-5766-41c6-a290-90e3f117743e', 'boydbrenda@white.com', 'Michael Sherman',
            'https://dummyimage.com/763x132', 'https://www.navarro.net/', 'Talent'
        )
        RETURNING user_id
    )
    INSERT INTO public.talent_profiles (
        user_id, resume, bio, skills, experience, education,
        work_preferences, desired_salary, location,
        availability, available_from, time_availability, requires_two_weeks_notice
    )
    SELECT
        user_id, 'Develops strategies for asset allocation and investment portfolios. Wish time want appear bed. Hand police our old.
Help road bank stock machine. Under good past product worry.
Edge pull toward realize important. Protect nice field machine song.
Its five main.
Guess both interesting identify a be learn.
Economic several idea agency chance thing feeling almost. It state see meeting cut nor tough.
Pass fly sure option. Include him well price once past might. Least live item able him party.
Reality blood result. Everything personal many then stock.', 'Michael Sherman is a seasoned professional in general, currently focused on roles like investment strategist. New perform kind. Bit second economic investment idea.',
        ARRAY['SQL', 'JavaScript', 'Marketing Strategy', 'Data Analysis', 'SEM'], 'Deep public hotel safe reason relationship main performance. Agent student someone or office late. Top would night treatment show community project one.', 'Bachelor's or Master's Degree in a relevant field',
        '{"work_mode": "Hybrid", "preferred_projects": "general projects, teamwork, client collaboration"}'::jsonb, 93575.95, 'Paris, France',
        'Two Weeks Notice', '2025-05-08',
        '{"daily_hours": "4-6", "timezone": "Auto"}'::jsonb,
        FALSE
    FROM new_user;