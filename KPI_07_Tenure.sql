KPI 07: Attrition % by Tenure Band
Question: Do new joiners quit faster vs old employees? Which tenure group has the highest attrition rate?
Logic: 
CASE WHEN YearsAtCompany BETWEEN 0 AND 2 THEN '0-2 yrs' WHEN YearsAtCompany BETWEEN 3 AND 5 THEN '3-5 yrs' WHEN YearsAtCompany BETWEEN 6 AND 10 THEN '6-10 yrs' ELSE '10+ yrs' END AS TenureBucket

Query:
WITH dept_totals AS (
  SELECT 
    EmployeeNumber, Department, Attrition,
    CASE 
      WHEN YearsAtCompany BETWEEN 0 AND 2 THEN '0-2 yrs'
      WHEN YearsAtCompany BETWEEN 3 AND 5 THEN '3-5 yrs'
      WHEN YearsAtCompany BETWEEN 6 AND 10 THEN '6-10 yrs'
      ELSE '10+ yrs'
    END AS TenureBucket
  FROM HR
)
SELECT 
  TenureBucket, Department,
  COUNT(*) AS TotalEmployees,
  SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS AttritionCount,
  ROUND(100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS AttritionPct
FROM dept_totals  
GROUP BY TenureBucket 
ORDER BY 
  CASE TenureBucket  
    WHEN '0-2' THEN '1 -> New Joiners'
    WHEN '3-5' THEN '2 -> Mid Tenure'
    WHEN '6-10' THEN '3 -> Experienced'
    ELSE '4 -> Veterans'
  END;

KPI 07: Attrition % by Tenure Band
Insight: 
New joiners 0-2 years have highest attrition at 29.82% in R&D. This is 3.7x higher than 10+ years veterans at 8.13% in Sales. 
Company loses talent before onboarding completes. HR should prioritize manager check-ins and mentorship for first 2 years.