KPI 08: Average Monthly Income by Department
Question: Which department has highest/lowest average salary?
Logic: AVG(MonthlyIncome) + GROUP BY Department

Query:

SELECT 
    Department,
    COUNT(*) AS EmployeeCount,
    ROUND(AVG(MonthlyIncome), 2) AS AvgMonthlyIncome
FROM HR
GROUP BY Department
ORDER BY AvgMonthlyIncome DESC;


Insight:
Sales department has highest average salary at ₹6,959, followed by HR at ₹6,654. 
R&D has lowest avg salary at ₹6,281 despite having 65% of total employees. 
This is surprising because R&D also has lower attrition at 12.37% vs Sales at 20.63%. 
Higher pay in Sales doesn't prevent attrition - suggests non-salary factors drive exits: targets, stress, work-life balance. 
R&D retains people better despite lower pay, likely due to job satisfaction, learning, or stability. 
HR should investigate why high-paid Sales team still leaves more, and use R&D's retention strategies as a model.