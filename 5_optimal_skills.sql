/*
QUERY 5 🔎 : What are the most optimal skills to learn that
    is both in high demand and a high-paying skill?
-----------------------------------------------------------
- Identify skills in high demand and associated with high average
    salaries for Data Analyst roles. ✅
- Conentrate on remote positions. ✅
- We want strategic insights for career development in data analysis,
    especially for roles such as AI/ML, Big Data, etc. 🎯
*/

SELECT
    skills_dim.skill_id,
    skills_dim.skills,
    COUNT(skills_job_dim.job_id) AS demand_count,
    ROUND(AVG(job_postings_fact.salary_year_avg), 0) AS avg_salary
FROM
    job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
    AND
    salary_year_avg IS NOT NULL
    AND
    job_work_from_home = TRUE
GROUP BY
    skills_dim.skill_id
HAVING
    COUNT(skills_job_dim.job_id) > 10
ORDER BY
    demand_count DESC,
    avg_salary DESC
LIMIT 5;

/*
INSIGHTS 💡 :
-------------
- If we order by the demand count 👨🏻‍💻 for skills, we see the same usual suspects:
    - SQL           ($97K)
    - Excel         ($87K)
    - Python        ($100K)
    - Tableau       ($100K)
    - R             ($100K)

- On the other hand, if we order by the average salary 💰 for skills, we see different skills:
    - Go            ($115K)
    - Confluence    ($114K)
    - Hadoop        ($113K)
    - Snowflake     ($112K)
    - Azure ($K)    ($111K)

- The strategy that I would follow is to first be comfortable in SQL, Excel, Python, Tableau, and R, in order to
    get an entry role as a Data Analyst, being that they have the most demand counts. For my career development, 
    I would focus on what my interests are (e.g AI/ML, Big Data, etc.) and then learn the skills that are desired.
    By following this plan, I attain the desired skills that are needed to grow my salary.
*/