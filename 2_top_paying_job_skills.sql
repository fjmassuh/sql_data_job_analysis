/*
QUERY 2 🔎 : What are the most sought-after skills a Data Analyst should have?
------------------------------------------------------------------------------
- Get the 10 skills that are in high-demand. ✅
- We want to be able to get a look at what are the skills job seekers should develop for any high-paying 
    Data Analyst job 🎯.
*/

WITH top_paying_jobs AS (
    SELECT
        job_id,
        job_title,
        job_title_short,
        job_location,
        company_dim.name AS company_name,
        salary_year_avg,
        job_schedule_type,
        job_posted_date
    FROM job_postings_fact
    LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
    WHERE
        job_title_short = 'Data Analyst'
        AND salary_year_avg IS NOT NULL
    ORDER BY salary_year_avg DESC
)

SELECT 
    skills_dim.skills,
    COUNT(*) AS demand_count
FROM top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
GROUP BY skills
ORDER BY demand_count DESC
LIMIT 10;

/*
INSIGHTS 💡 :
-------------
- The top 5 most sought-after data skills are:
    - SQL
    - Excel
    - Python
    - Tableau
    - R
- S
*/