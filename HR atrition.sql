SELECT * FROM hr.`hr-employee-attrition (1)`;

SELECT 
    Department, 
    JobRole, 
    AVG(MonthlyIncome) AS AvgMonthlyIncome
FROM 
    hr.`hr-employee-attrition (1)`
GROUP BY 
    Department, 
    JobRole
ORDER BY 
    Department, 
    JobRole;


WITH RankedSalaries AS (
    SELECT 
        EmployeeNumber, 
        Department, 
        MonthlyIncome, 
        ROW_NUMBER() OVER (PARTITION BY Department ORDER BY MonthlyIncome DESC) AS SalaryRank
    FROM 
        hr.`hr-employee-attrition (1)`
)
SELECT 
    EmployeeNumber, 
    Department, 
    MonthlyIncome
FROM 
    RankedSalaries
WHERE 
    SalaryRank <= 5
ORDER BY 
    Department, 
    SalaryRank;

SELECT 
    JobSatisfaction, 
    AVG(YearsAtCompany) AS AvgYearsAtCompany
FROM 
    hr.`hr-employee-attrition (1)`
GROUP BY 
    JobSatisfaction
ORDER BY 
    JobSatisfaction;
    
    SELECT 
    BusinessTravel, 
    COUNT(*) AS TotalEmployees, 
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS AttritionCount, 
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS AttritionRate
FROM 
    hr.`hr-employee-attrition (1)`
GROUP BY 
    BusinessTravel
ORDER BY 
    BusinessTravel;
    
SELECT 
    Department, 
    AVG(EnvironmentSatisfaction) AS AvgEnvSatisfaction
FROM 
    hr.`hr-employee-attrition (1)`
GROUP BY 
    Department
ORDER BY 
    AvgEnvSatisfaction DESC
LIMIT 3;

SELECT 
    CASE WHEN StockOptionLevel > 0 THEN 'With Stock Options' ELSE 'Without Stock Options' END AS StockOptionStatus, 
    AVG(PercentSalaryHike) AS AvgPercentSalaryHike
FROM 
    hr.`hr-employee-attrition (1)`
GROUP BY 
    StockOptionStatus
ORDER BY 
    StockOptionStatus;

SELECT 
    YearsAtCompany, 
    YearsWithCurrManager, 
    COUNT(*) AS EmployeeCount
FROM 
    hr.`hr-employee-attrition (1)`
GROUP BY 
    YearsAtCompany, 
    YearsWithCurrManager
ORDER BY 
    YearsAtCompany, 
    YearsWithCurrManager;

SELECT 
    EmployeeNumber, 
    JobSatisfaction, 
    YearsSinceLastPromotion
FROM 
     hr.`hr-employee-attrition (1)`
WHERE 
    YearsSinceLastPromotion = YearsAtCompany
ORDER BY 
    JobSatisfaction DESC
LIMIT 10;

SELECT 
    EducationField, 
    AVG(JobInvolvement) AS AvgJobInvolvement, 
    AVG(JobSatisfaction) AS AvgJobSatisfaction
FROM 
    hr.`hr-employee-attrition (1)`
GROUP BY 
    EducationField
ORDER BY 
    EducationField;


    

