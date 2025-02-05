/*
QUERY 3 🔎 : What are the most in-demand skills for Data Analysts
    looking for remote jobs?
-----------------------------------------------------------------
- Slightly the same as the previous query just that we are filtering out
    non-remote jobs. ✅
- We want to see what skills to focus on in order to get our remote Data Analyst role. 🎯
*/

SELECT 
    skills_dim.skills,
    count(*) AS skill_Count
FROM 
    job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
    AND
    job_work_from_home = TRUE
    AND
    salary_year_avg is NOT NULL
GROUP BY 
    skills
ORDER BY 
    skill_Count DESC
LIMIT 5;

/*
INSIGHTS 💡 :
-------------
- The most in-demand skills for Data Analysts are:
    - SQL
    - Excel
    - Python
    - Tableau
    - R

- The proportion is the same when we only considered remote Data Analyst jobs.
    Of course, the jobs are less, but the proportion remains the same.

- We can still see that SQL is highly-sought after.
    Then, Excel, Python, and Tableau are also skills that are desired.

- Once again, it's definitely recommended on getting comfortable with SQL!
*/