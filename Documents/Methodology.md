# Methodology

This project follows a structured, data-driven approach to analyze salary trends in AI and Data-related roles. The methodology combines SQL-based data processing with Tableau-based visualization to ensure accuracy, clarity, and actionable insights.

## 1. Data Source
The dataset used in this analysis contains job postings for AI and Data-related roles, including information on:
- Job title and industry
- Salary ranges (minimum and maximum in USD)
- Experience level and required years of experience
- Company size
- Country and work arrangement (remote, hybrid, on-site)
- Posting year

The dataset represents multiple industries and geographic regions, providing a broad view of the AI/Data job market.

## 2. Data Cleaning and Preparation (SQL)
SQL was used to clean, transform, and aggregate the raw data. Key steps included:
- Removing duplicate records
- Handling missing or inconsistent salary values
- Converting salary ranges into comparable numeric formats
- Creating derived metrics such as average salary using the midpoint of salary ranges
- Grouping and aggregating data by industry, experience level, company size, location, and work type

These transformations ensured the dataset was analysis-ready and suitable for visualization.

## 3. Exploratory Data Analysis (SQL)
Exploratory queries were written to uncover patterns and trends, including:
- Average salary comparisons across industries
- Salary distribution by experience level
- Impact of company size on compensation
- Geographic salary differences
- Trends in salary changes over time

The outputs of these queries formed the foundation for the dashboard metrics and key findings.

## 4. Visualization and Dashboard Design (Tableau)
Tableau was used to create interactive dashboards that communicate insights clearly and intuitively. The dashboards were designed to:
- Highlight key salary drivers at a glance
- Allow filtering by industry, experience level, location, and work type
- Compare salary trends across multiple dimensions
- Support data-driven storytelling for both technical and non-technical audiences

Design best practices such as consistent color usage, clear labels, and logical layout structure were applied to improve readability and user experience.

## 5. Insights and Recommendations
Findings from the analysis were summarized into key insights and translated into practical business recommendations. These recommendations aim to:
- Guide job seekers in setting realistic salary expectations
- Help employers benchmark competitive compensation
- Provide strategic insights into remote work and geographic pay trends
