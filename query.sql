
--Selects all employees with details
SELECT "Employees"."Employee_No", "Employees"."Last_Name", "Employees"."First_Name", "Employees"."Sex", "Salaries"."Salary"
FROM "Employees"
INNER JOIN "Salaries" ON "Employees"."Employee_No" = "Salaries"."Employee_No";

--Selects employees who were hired in 1986
SELECT  "First_Name", "Last_Name", "Hire_Date"
FROM "Employees"
WHERE EXTRACT(YEAR FROM "Hire_Date") = 1986;

--Selects managers of each department
SELECT "Departments"."Department_No", "Departments"."Department_Name", "Department_Managers"."Employee_No", "Employees"."Last_Name", "Employees"."First_Name"
FROM "Employees"
INNER JOIN "Department_Managers" ON "Employees"."Employee_No" = "Department_Managers"."Employee_No"
INNER JOIN "Departments" ON "Department_Managers"."Department_No" = "Departments"."Department_No";

--Selects the department of each employee
SELECT "Department_Emlpoyees"."Employee_No", "Employees"."Last_Name", "Employees"."First_Name", "Departments"."Department_Name"
FROM "Employees"
INNER JOIN "Department_Emlpoyees" ON "Employees"."Employee_No" = "Department_Emlpoyees"."Employee_No"
INNER JOIN "Departments" ON "Department_Emlpoyees"."Department_No" = "Departments"."Department_No";

--Selects employees with name Hercules and last names starting with B
SELECT  "First_Name", "Last_Name", "Sex"
FROM "Employees"
WHERE "First_Name" = 'Hercules'  and "Last_Name" like 'B%';

--Selects all employees in Sales department
SELECT "Department_Emlpoyees"."Employee_No", "Employees"."Last_Name", "Employees"."First_Name", "Departments"."Department_Name"
FROM "Employees"
INNER JOIN "Department_Emlpoyees" ON "Employees"."Employee_No" = "Department_Emlpoyees"."Employee_No"
INNER JOIN "Departments" ON "Department_Emlpoyees"."Department_No" = "Departments"."Department_No"
WHERE "Department_Name" = 'Sales';

--Selects all employees in Sales and Development departments
SELECT "Department_Emlpoyees"."Employee_No", "Employees"."Last_Name", "Employees"."First_Name", "Departments"."Department_Name"
FROM "Employees"
INNER JOIN "Department_Emlpoyees" ON "Employees"."Employee_No" = "Department_Emlpoyees"."Employee_No"
INNER JOIN "Departments" ON "Department_Emlpoyees"."Department_No" = "Departments"."Department_No"
WHERE "Department_Name" IN ('Sales','Development');

-- Counts duplicate last names in descending order
SELECT "Last_Name", COUNT("Employee_No")
FROM "Employees"
GROUP BY "Last_Name"
HAVING COUNT("Employee_No") > 1
ORDER BY COUNT("Employee_No") DESC;
