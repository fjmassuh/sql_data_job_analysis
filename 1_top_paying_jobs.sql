/*
QUERY 1 🔎 : What are the top paying Data Analyst jobs?
---------------------------------------------------------
- Identifiy the top 10 highest-paying Data Analyst roles in the dataset. ✅
- Focus on job postings with specified salaries (remove nulls). ✅
- We want to highlight the top top-paying opportunities for Data Analysts. 🎯
*/

SELECT
    job_title,
    job_location,
    company_dim.name AS company_name,
    salary_year_avg
FROM
    job_postings_fact
LEFT JOIN
    company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
ORDER BY salary_year_avg DESC
LIMIT 10;

/*
INSIGHTS 💡 :
-------------
- Top-Paid Role: Data Analyst ($650K) leads the salary chart.

- High Earners: Leadership roles (Directors, Heads) dominate top salaries.

- Research Pays Well: Research Scientist ($285K) ranks high.

- Broad Salary Range: From $175K to $650K,
    showing strong variation by role and expertise.

Learned:
Breaking into data analytics can be highly rewarding, 
with salaries ranging from $175K to $650K. 
Leadership and specialized roles, such as Director of Analytics 
or Research Scientist, command top pay, emphasizing the value of 
expertise and strategic thinking. Strong technical skills in data analysis, 
database management, and AI can open doors to high-paying opportunities. 
If you're aiming for the top, focus on gaining experience, 
technical proficiency, and business impact skills to stand out in this competitive field.
*/
