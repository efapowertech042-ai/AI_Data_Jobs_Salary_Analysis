-- Understand The Table Structure
-- Purpose: Confirms column names & data types. Helps reviewers see schema understanding
SELECT
    COLUMN_NAME,
    DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'AI_Data_Jobs_Clean';

-- Total Number of Records
-- Purpose: Dataset size overview
SELECT COUNT(*) AS total_rows
FROM AI_Data_Jobs_Clean;

-- Check for Duplicate Job IDs
-- Purpose: Detect true duplicates. Important data quality check
SELECT
    job_id,
    COUNT(*) AS occurrences
FROM AI_Data_Jobs_Clean
GROUP BY job_id
HAVING COUNT(*) > 1;

-- Missing / NULL Value Analysis
-- Purpose: Identifies data gaps. Justifies cleaning decisions
SELECT
    SUM(CASE WHEN job_title IS NULL THEN 1 ELSE 0 END) AS missing_job_title,
    SUM(CASE WHEN company_type IS NULL THEN 1 ELSE 0 END) AS missing_company_type,
    SUM(CASE WHEN industry IS NULL THEN 1 ELSE 0 END) AS missing_industry,
    SUM(CASE WHEN country IS NULL THEN 1 ELSE 0 END) AS missing_country,
    SUM(CASE WHEN city IS NULL THEN 1 ELSE 0 END) AS missing_city,
    SUM(CASE WHEN salary_min_usd IS NULL THEN 1 ELSE 0 END) AS missing_salary_min,
    SUM(CASE WHEN salary_max_usd IS NULL THEN 1 ELSE 0 END) AS missing_salary_max
FROM AI_Data_Jobs_Clean;

-- Job Distribution by Role
-- Insight: All AI And Data jobs in-demand
SELECT
    job_title,
    COUNT(*) AS job_count
FROM AI_Data_Jobs_Clean
GROUP BY job_title
ORDER BY job_count DESC;

-- Job Distribution by Experience Level
-- Insight: All expereince level market demand
SELECT
    experience_level,
    COUNT(*) AS job_count
FROM AI_Data_Jobs_Clean
GROUP BY experience_level
ORDER BY job_count DESC;

-- Salary Overview (Min, Max, Avg)
-- Purpose: High-level compensation insight
SELECT
    MIN(salary_min_usd) AS lowest_min_salary,
    MAX(salary_max_usd) AS highest_max_salary,
    AVG((salary_min_usd + salary_max_usd) / 2.0) AS avg_salary
FROM AI_Data_Jobs_Clean;

-- Average Salary by Experience Level
-- Insight, Salary progression with experience
SELECT
    experience_level,
    AVG((salary_min_usd + salary_max_usd) / 2.0) AS avg_salary
FROM AI_Data_Jobs_Clean
GROUP BY experience_level
ORDER BY avg_salary DESC;

-- Salary Aggregation by Experience Level
-- Purpose: Understand how salary changes across career levels.
-- Insight generated: Senior roles dominate salary averages, Entry roles have tighter salary bands, Clear salary progression with experience
SELECT
    experience_level,
    COUNT(*) AS job_count,
    AVG(CAST(salary_min_usd AS BIGINT)) AS avg_min_salary,
    AVG(CAST(salary_max_usd AS BIGINT)) AS avg_max_salary,
    AVG(
        (CAST(salary_min_usd AS BIGINT) + CAST(salary_max_usd AS BIGINT)) / 2.0
    ) AS avg_mid_salary
FROM AI_Data_Jobs_Clean
GROUP BY experience_level
ORDER BY avg_mid_salary DESC;



-- Top Countries by Job Count
-- Purpose: Geographic demand analysis. Great for Tableau maps
SELECT
    country,
    COUNT(*) AS job_count
FROM AI_Data_Jobs_Clean
GROUP BY country
ORDER BY job_count DESC;

-- Remote vs Onsite Jobs
-- Insight: Hybrid work got top job count
SELECT
    remote_type,
    COUNT(*) AS job_count
FROM AI_Data_Jobs_Clean
GROUP BY remote_type
ORDER BY job_count DESC;

-- Company Size vs Average Salary
-- Business Insight: Do larger companies really pay more?
SELECT
    company_size,
    AVG((salary_min_usd + salary_max_usd) / 2.0) AS avg_salary
FROM AI_Data_Jobs_Clean
GROUP BY company_size
ORDER BY avg_salary DESC;

-- Yearly Job Posting Trend
-- Purpose: Hiring trend over time. Excellent line chart for Tableau
SELECT
    posted_year,
    COUNT(*) AS job_count
FROM AI_Data_Jobs_Clean
GROUP BY posted_year
ORDER BY posted_year;












