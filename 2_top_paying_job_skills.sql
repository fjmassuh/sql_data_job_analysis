/*
QUERY 2 🔎 : What are the most sought-after skills a Data Analyst should have?
------------------------------------------------------------------------------
- Get the 5 skills that are in high-demand. ✅
- We want to be able to get a look at what are the skills job seekers should develop for any high-paying 
    Data Analyst job 🎯.
*/

WITH top_paying_jobs AS (
    SELECT
        job_id,
        job_title,
        job_title_short,
        job_location,
        c.name AS company_name,
        salary_year_avg,
        job_schedule_type,
        job_posted_date
    FROM
        job_postings_fact AS j
    LEFT JOIN
        company_dim AS c
        ON j.company_id = c.company_id
    WHERE
        job_title_short = 'Data Analyst'
        AND
        salary_year_avg IS NOT NULL
    ORDER BY
        salary_year_avg DESC
)

SELECT 
    skills_dim.skills,
    count(*) AS skill_count
FROM top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
GROUP BY skills
ORDER BY skill_count DESC
LIMIT 5;

/*
INSIGHTS 💡 :
-------------
- The top 5 most sought-after data skills are:
    - SQL
    - Excel
    - Python
    - Tableau
    - R
- SQL is a must-have skill as it provides the means to manipulate, store, and transform data.
    Clearly, the first skill any Data Analyst should feel comfortable in is SQL. Excel, Python, and Tableau are
    also important skills to have, but SQL is definitely a priority 🚨.
*/