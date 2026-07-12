KPI 04: Attrition % by Gender
Question: Do males or females have higher attrition rate?
Logic: GROUP BY Gender directly

Query:
SELECT 
  Gender,
  COUNT(*) AS TotalEmployees,
  SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS AttritionCount,
  ROUND(100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS AttritionPct
FROM HR
GROUP BY Gender
ORDER BY AttritionPct DESC;

Insight:
Males have higher attrition at 17.01% vs Females at 14.80%. 2.21 percentage point gap. 
However, department effect is stronger than gender - Sales dept 20.63% drives overall male attrition higher due to male majority in Sales. 
Gender alone is not the main driver.