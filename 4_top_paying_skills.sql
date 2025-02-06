/*
QUERY 4 🔎 : What are the top skills based on salary?
-----------------------------------------------------
- Look at the average salary associated with each skill for Data Analyst positions. ✅
- Focus on roles with specified salaries. ✅
- We want to see how different skills impact salary levels for Data Analysts and
    help identify the most financially rewarding skills to acquire or improve. 🎯
*/

SELECT 
    skills,
    ROUND(AVG(salary_year_avg),0) AS avg_salary
FROM 
    job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' 
    AND job_work_from_home = TRUE 
    AND salary_year_avg is NOT NULL
GROUP BY skills
ORDER BY avg_salary DESC
LIMIT 10;

/*
INSIGHTS 💡 :
-------------

- Although we don't see SQL, Excel, Python, Tableau, and R as before, what
    insights can we draw from this query?
- After asking ChatGPT what insights it can provide 
    (Prompt: Provide some quick insights into some trends into the top paying jobs.), 
    the main takeaway is that those with skills in:
    - Big data
    - Cloud
    - DevOps
    - AI/ML
    are in high demand and command top salaries.

**NOTE**
--------
- A role as a Data Analyst is an entry point into the Data industry.

- It's still crucial to learn those 5 skills as they are the essential to data.
*/