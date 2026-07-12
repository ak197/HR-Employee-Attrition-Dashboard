Question:
What is the company-wide attrition rate?

Query:

SELECT 
    COUNT(*) AS TotalEmployees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS AttritionCount,
    ROUND(100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS AttritionPct
FROM HR;

Insight:
Company-wide attrition rate is 16.12%. Out of 1470 employees, 237 people left the company. 
This is above the healthy benchmark of 10-12% for most industries. 
It means 1 out of every 6 employees leaves annually, leading to high hiring costs, onboarding time, and loss of institutional knowledge. 
Sales department at 20.63% and Sales Representative role at 39.76% are major drivers pulling this average up. 
HR must prioritize retention strategies for high-risk departments and roles to bring overall attrition closer to industry standards.