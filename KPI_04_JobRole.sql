Question:
Which job role has the highest attrition rate?SQL Logic:
GROUP BY JobRole + SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) to count leavers. Same template as KPI 3.

Query:

SELECT 
  JobRole,
  COUNT(*) AS TotalEmployees,
  SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS AttritionCount,
  ROUND(100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS AttritionPct
FROM HR
GROUP BY JobRole
ORDER BY AttritionPct DESC;

Insight:
Sales Representative has the highest attrition at 39.76%, nearly 4 out of 10 people leave. 
This is double the overall company attrition ∼16%. Laboratory Technician is 2nd at 23.94%. Manager and Research Director have lowest attrition at 4.90% and 2.50%. 
This shows junior/frontline roles face highest pressure - likely due to targets, workload, or limited growth. HR should focus retention programs on Sales Rep and Lab Tech roles first.