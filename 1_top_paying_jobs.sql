/*
QUERY 1 🔎 : What are the top 5 paying Data Analyst jobs?
---------------------------------------------------------
- Identifiy the top 5 highest-paying Data Analyst roles in the dataset. ✅
- Focus on job postings with specified salaries (remove nulls). ✅
- We want to highlight the top top-paying opportunities for Data Analysts. 🎯
*/

SELECT
    job_title,
    job_title_short,
    job_location,
    c.name AS company_name,
    salary_year_avg,
    job_schedule_type,
    job_posted_date
FROM
    job_postings_fact AS j
LEFT JOIN /* Because we primarily care about data from the jobs_postings_fact table */
    company_dim AS c
    ON j.company_id = c.company_id
WHERE
    job_title_short = 'Data Analyst'
    AND
    salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT 5;

/*
INSIGHTS 💡 :
-------------
- In 2023, the highest paying salaries for Data Analysts ranged from $375K to $650K. Because these are
    high-paying salaries, these roles are most-likely Senior Data Analyst roles (e.g Sr Data Analyst). 
    An entry-level data analyst role would hold a salary significantly less than that of a Senior Data Analyst's.

- The companies that offer these opportunities are:
    1. Mantys
    2. ЛАНИТ
    3. Illuminate Mission Solutions
    4. Illuminate Mission Solutions
    5. Torc Robotics
*/
