-- Salary Ranking Within Each Job Role
-- Question: Which countries pay the most for each job role?
-- Advanced Skill: RANK() OVER (PARTITION BY ...)
-- Insight: Salary competitiveness varies significantly by country even for the same role.
WITH salary_cte AS (
    SELECT
        job_title,
        country,
        AVG((salary_min_usd + salary_max_usd) / 2.0) AS avg_salary
    FROM AI_Data_Jobs_Clean
    GROUP BY job_title, country
)
SELECT
    job_title,
    country,
    avg_salary,
    RANK() OVER (PARTITION BY job_title ORDER BY avg_salary DESC) AS salary_rank
FROM salary_cte
ORDER BY job_title, salary_rank;

-- Top 3 Highest-Paying Countries Per Role
-- Question: Where should professionals relocate or target remote jobs?
-- Advanced Skill: DENSE_RANK(), Nested aggregation + windowing
WITH ranked_salaries AS (
    SELECT
        job_title,
        country,
        AVG((salary_min_usd + salary_max_usd) / 2.0) AS avg_salary,
        DENSE_RANK() OVER (
            PARTITION BY job_title
            ORDER BY AVG((salary_min_usd + salary_max_usd) / 2.0) DESC
        ) AS rank_position
    FROM AI_Data_Jobs_Clean
    GROUP BY job_title, country
)
SELECT
    job_title,
    country,
    avg_salary
FROM ranked_salaries
WHERE rank_position <= 3
ORDER BY job_title, avg_salary DESC;

-- Salary Band Classification (CASE Bucketing)
-- Question: How are jobs distributed across salary bands?
-- Advanced Skill: Business-driven segmentation
SELECT
    salary_band,
    COUNT(*) AS job_count
FROM (
    SELECT
        CASE
            WHEN (salary_min_usd + salary_max_usd) / 2.0 < 60000 THEN 'Low'
            WHEN (salary_min_usd + salary_max_usd) / 2.0 BETWEEN 60000 AND 120000 THEN 'Medium'
            ELSE 'High'
        END AS salary_band
    FROM AI_Data_Jobs_Clean
) t
GROUP BY salary_band
ORDER BY job_count DESC;

-- Experience vs Salary Growth Rate
-- Question: How steep is salary growth across experience levels?
-- Advanced Skill: LAG(), Growth analysis
SELECT
    experience_level,
    AVG((salary_min_usd + salary_max_usd) / 2.0) AS avg_salary,
    LAG(AVG((salary_min_usd + salary_max_usd) / 2.0))
        OVER (ORDER BY MIN(min_experience_years)) AS previous_salary,
    (
        AVG((salary_min_usd + salary_max_usd) / 2.0)
        - LAG(AVG((salary_min_usd + salary_max_usd) / 2.0))
            OVER (ORDER BY MIN(min_experience_years))
    ) AS salary_growth
FROM AI_Data_Jobs_Clean
GROUP BY experience_level;