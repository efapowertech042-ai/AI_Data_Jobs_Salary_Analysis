-- Which AI/Data job roles are most in demand?
-- Business Value: Helps job seekers and recruiters understand market demand.
-- Insight to report: MLOPS Engineer, AI Researcher, Data Scientist roles dominate job postings.
SELECT
    job_title,
    COUNT(*) AS job_postings
FROM AI_Data_Jobs_Clean
GROUP BY job_title
ORDER BY job_postings DESC;

-- Which countries have the highest number of job postings?
-- Business Value: Identifies global hiring hubs.
-- Insight to report: The UK, India, Germany appear as major AI/Data job hiring markets.
SELECT
    country,
    COUNT(*) AS job_postings
FROM AI_Data_Jobs_Clean
GROUP BY country
ORDER BY job_postings DESC;

-- What experience level is most demanded?
-- Business Value: Shows whether the market favors entry, mid, or senior professionals.
-- Insight to report: All experience level positions account for the majority of postings, indicating strong early-career demand.
SELECT
    experience_level,
    COUNT(*) AS job_postings
FROM AI_Data_Jobs_Clean
GROUP BY experience_level
ORDER BY job_postings DESC;

-- How does salary change with experience level?
-- Business Value: Helps professionals understand salary growth expectations.
-- Insight to report: Senior-level roles earn significantly higher average salaries compared to entry-level positions.
SELECT
    experience_level,
    AVG((salary_min_usd + salary_max_usd) / 2.0) AS avg_salary_usd
FROM AI_Data_Jobs_Clean
GROUP BY experience_level
ORDER BY avg_salary_usd DESC;

-- Which job roles pay the highest average salary?
-- Business Value: Guides career specialization decisions.
-- Insight to report: Applied Scientists and Data Analyst rank among the highest-paying roles.
SELECT
    job_title,
    AVG((salary_min_usd + salary_max_usd) / 2.0) AS avg_salary_usd
FROM AI_Data_Jobs_Clean
GROUP BY job_title
ORDER BY avg_salary_usd DESC;

-- Do remote jobs pay more than onsite jobs?
-- Business Value: Evaluates the financial trade-off of remote work.
-- Insight to report: Hybrid roles show competitive salaries comparable to Remote positions.
SELECT
    remote_type,
    AVG((salary_min_usd + salary_max_usd) / 2.0) AS avg_salary_usd
FROM AI_Data_Jobs_Clean
GROUP BY remote_type
ORDER BY avg_salary_usd DESC;

-- How does company size affect salary?
-- Business Value: Informs job seekers where higher compensation is likely.
-- Insight to report: Large companies tend to offer higher average salaries than Medium and small firms.
SELECT
    company_size,
    AVG((salary_min_usd + salary_max_usd) / 2.0) AS avg_salary_usd
FROM AI_Data_Jobs_Clean
GROUP BY company_size
ORDER BY avg_salary_usd DESC;

-- Which industries offer the highest-paying AI roles?
-- Business Value: Identifies lucrative industries for AI/Data professionals.
-- Insight to report: Retail and Finance industries lead in AI/Data compensation.
SELECT
    industry,
    AVG((salary_min_usd + salary_max_usd) / 2.0) AS avg_salary_usd
FROM AI_Data_Jobs_Clean
GROUP BY industry
ORDER BY avg_salary_usd DESC;

-- Job posting trend over time
-- Business Value: Shows market growth or decline.
-- Insight to report: AI/Data job postings show an upward trend, reflecting increased adoption across different years.
SELECT
    posted_year,
    COUNT(*) AS job_postings
FROM AI_Data_Jobs_Clean
GROUP BY posted_year
ORDER BY posted_year;

-- Entry-Level Salary Benchmark
-- Business Value: Sets realistic expectations for beginners.
SELECT
    MIN(salary_min_usd) AS lowest_entry_salary,
    MAX(salary_max_usd) AS highest_entry_salary,
    AVG((salary_min_usd + salary_max_usd) / 2.0) AS avg_entry_salary
FROM AI_Data_Jobs_Clean
WHERE experience_level = 'Entry';


SELECT TOP 10 *
FROM AI_Data_Jobs_Clean;



