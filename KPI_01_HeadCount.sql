KPI 01: Total Headcount
Question: How many employees are in the company?
Logic: COUNT(*) all rows

SELECT COUNT(*) AS TotalEmployees FROM HR;

Insight:
Company has 1470 total employees as per HR dataset. This serves as the baseline denominator for all attrition calculations. 
With 1470 headcount, even 1% attrition = 15 people leaving, so retention improvements have significant cost impact on hiring and training.