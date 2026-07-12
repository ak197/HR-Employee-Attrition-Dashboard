KPI 03: Attrition % by Department
Question: Which department has highest/lowest attrition rate?
Logic: GROUP BY Department directly, no CASE needed

Query:

SELECT 
  Department,
  COUNT(*) AS TotalEmployees,
  SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS AttritionCount,
  ROUND(100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS AttritionPct
FROM HR
GROUP BY Department
ORDER BY AttritionPct DESC;

Insight:
Sales department has highest attrition at 20.63%. Research & Development has lowest at 13.84%. 
This 6.79 percentage point gap shows Sales faces higher pressure - likely targets, workload, or manager issues. 
HR should audit Sales team retention practices immediately.