UPDATE public.talent_profiles
SET
  resume = $$
    Data Engineer and AI Practitioner with over six years of hands-on experience in designing and maintaining big data infrastructure.

    ▸ Built scalable ETL pipelines using Apache Airflow and Spark.
    ▸ Hands-on expertise in distributed systems and large datasets processing on AWS (S3, Redshift, EMR).
    ▸ Implemented machine learning pipelines using Scikit-learn and TensorFlow for anomaly detection and forecasting.
    ▸ Proficient in SQL-based analytics on PostgreSQL and Snowflake.
    ▸ Designed real-time data ingestion with Kafka and Flink for IoT projects.
    ▸ Built internal analytics platforms and dashboards using Python and BI tools.
  $$,

  bio = 'Experienced Data Engineer and AI enthusiast skilled in building reliable, high-volume data infrastructure and analytics systems. Passionate about big data, cloud-native ETL workflows, and machine learning automation.',

  skills = ARRAY[
    'Python',
    'SQL',
    'Apache Spark',
    'Airflow',
    'PostgreSQL',
    'Snowflake',
    'Kafka',
    'Flink',
    'TensorFlow',
    'Scikit-learn',
    'Data Lake',
    'AWS',
    'Redshift',
    'ETL',
    'Big Data',
    'Data Engineering',
    'Machine Learning'
  ],

  experience = $$
    ▸ Developed and optimized petabyte-scale data pipelines across distributed systems.
    ▸ Implemented ETL jobs for clickstream analysis and data warehouse population.
    ▸ Designed fraud detection models using Scikit-learn, deployed as REST APIs.
    ▸ Led migration from legacy ETL systems to Apache Airflow and cloud-native tools.
    ▸ Spearheaded cost optimization on AWS S3 and Redshift usage for analytics.
  $$,

  available_from = CURRENT_DATE,
  availability = 'Immediate',
  time_availability = '{}'::jsonb
WHERE talent_id = 33;
