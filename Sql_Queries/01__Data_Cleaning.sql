WITH CleanedData AS (
    SELECT
        job_id,

        -- Trim & standardize text fields
        UPPER(LTRIM(RTRIM(job_title)))        AS job_title,
        UPPER(LTRIM(RTRIM(company_type)))     AS company_type,
        UPPER(LTRIM(RTRIM(industry)))         AS industry,
        UPPER(LTRIM(RTRIM(country)))          AS country,
        UPPER(LTRIM(RTRIM(
            CASE
                WHEN UPPER(remote_type) = 'REMOTE'
                     AND (city IS NULL OR city = '')
                THEN 'REMOTE'
                ELSE city
            END
        )))                                   AS city,
        UPPER(LTRIM(RTRIM(remote_type)))      AS remote_type,
        UPPER(LTRIM(RTRIM(experience_level))) AS experience_level,

        min_experience_years,

        -- Salary cleaning
        CASE
            WHEN salary_min_usd > salary_max_usd THEN salary_max_usd
            ELSE salary_min_usd
        END AS salary_min_usd,

        CASE
            WHEN salary_min_usd > salary_max_usd THEN salary_min_usd
            ELSE salary_max_usd
        END AS salary_max_usd,

        UPPER(LTRIM(RTRIM(employment_type)))  AS employment_type,
        posted_year,
        UPPER(LTRIM(RTRIM(company_size)))     AS company_size,

        ROW_NUMBER() OVER (
            PARTITION BY
                job_title, company_type, industry, country, city,
                remote_type, experience_level, min_experience_years,
                salary_min_usd, salary_max_usd,
                employment_type, posted_year, company_size
            ORDER BY job_id
        ) AS row_num
    FROM AI_Data_Jobs_Salary_Dataset
)

SELECT
    job_id,
    job_title,
    company_type,
    industry,
    country,
    city,
    remote_type,
    experience_level,
    min_experience_years,
    salary_min_usd,
    salary_max_usd,
    (salary_min_usd + salary_max_usd) / 2.0 AS avg_salary_usd,
    employment_type,
    posted_year,
    company_size
FROM CleanedData
WHERE
    row_num = 1
    AND salary_min_usd > 0
    AND salary_max_usd > 0
    AND min_experience_years BETWEEN 0 AND 50
ORDER BY posted_year DESC;
