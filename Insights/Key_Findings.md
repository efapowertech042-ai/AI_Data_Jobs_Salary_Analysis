# Key Findings

This section summarizes the main insights derived from SQL analysis on the AI & Data Jobs Salary dataset.

---

## 1. Senior Roles Command Significantly Higher Salaries
- Senior and Mid-level positions consistently earn higher average salaries than Entry roles.
- The salary gap widens significantly after 5+ years of experience.
- This trend is consistent across most countries and industries.

**Evidence:**  
Aggregations on `experience_level`, `min_experience_years`, and salary ranges.

---

## 2. Remote Roles Offer Competitive Compensation
- Hybrid roles often match or exceed the salaries of Remote positions.
- Hybrid opportunities are especially lucrative for Senior-level positions.

**Evidence:**  
Salary comparison by `remote_type`.

---

## 3. Retail and Finance Industries Pay the Most
- The Retail and Finance industries have the highest average salary ranges.
- Healthcare and least-profitable sectors generally offer a good compensation.

**Evidence:**  
Industry-level salary aggregation.

---

## 4. Salary Differences by Company Size
- Across all company sizes, the average salaries are fairly similar, with only slight differences between large companies, medium firms, and startups.
- Large companies still tend to offer slightly higher median salaries, while startups show wider variability, reflecting higher risk but potential for bigger payoffs.

**Evidence:**  
Salary analysis grouped by `company_size`.

---

## 5. Salary Trends Over Time
- Salaries fluctuate year over year but generally remain close to the overall mean.
- Experienced professionals tend to see stronger growth despite these fluctuations.

**Evidence:**  
Analysis of year-over-year salary trends using posted_year shows variability around the mean, with upward movement for higher experience levels.

---

## 6. Geographic Salary Differences Are Significant
- Countries like the Australia, UK, and USA show higher salary ranges.
- However, remote roles reduce geographic salary disparities.

**Evidence:**  
Country-level salary comparison.
