KPI 06: Attrition by Age Band
Question: Which age group has highest attrition?
Query:

WITH age_band AS (
  SELECT 
    EmployeeNumber,
    Attrition,
    CASE 
      WHEN Age < 30 THEN '18-29'
      WHEN Age BETWEEN 30 AND 39 THEN '30-39'
      WHEN Age BETWEEN 40 AND 49 THEN '40-49'
      ELSE '50+'
    END AS AgeBand
  FROM HR
)
SELECT 
  AgeBand,  -- <- use AgeBand from CTE, not Age
  COUNT(*) AS TotalEmployees,
  SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS AttritionCount,
  ROUND(100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS AttritionPct
FROM age_band  -- <- query the CTE
GROUP BY AgeBand  -- <- group by AgeBand, not Age
ORDER BY 
  CASE AgeBand  -- <- sort in logical order
    WHEN '18-29' THEN 1
    WHEN '30-39' THEN 2
    WHEN '40-49' THEN 3
    ELSE 4
  END;


KPI 06: Attrition By AgeBand
Insight: 18-29 has highest attrition at 27.91%. 40-49 has lowest at 9.74%.
Action: Focus retention programs on younger employees.