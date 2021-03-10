-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/QMm0FA
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Departments" (
    "Department_No" varchar   NOT NULL,
    "Department_Name" varchar   NOT NULL,
    CONSTRAINT "pk_Departments" PRIMARY KEY (
        "Department_No"
     )
);

select * from "Departments";

CREATE TABLE "Employees" (
    "Employee_No" int   NOT NULL,
    "Employee_Title_ID" varchar   NOT NULL,
    "Birth_Date" date   NOT NULL,
    "First_Name" varchar   NOT NULL,
    "Last_name" varchar   NOT NULL,
    "Sex" varchar   NOT NULL,
    "Hire_Date" date   NOT NULL,
    CONSTRAINT "pk_Employees" PRIMARY KEY (
        "Employee_No"
     )
);

select * from "Employees";

CREATE TABLE "Department_Emlpoyees" (
    "Employee_No" int   NOT NULL,
    "Department_No" varchar   NOT NULL,
    CONSTRAINT "pk_Department_Emlpoyees" PRIMARY KEY (
        "Employee_No","Department_No"
     )
);

select * from "Department_Emlpoyees";

CREATE TABLE "Department_Managers" (
    "Department_No" varchar   NOT NULL,
    "Emlpoyee_No" int   NOT NULL,
    CONSTRAINT "pk_Department_Managers" PRIMARY KEY (
        "Department_No","Emlpoyee_No"
     )
);

select * from "Department_Managers";

CREATE TABLE "Salaries" (
    "Emlpoyee_No" int   NOT NULL,
    "Salary" int   NOT NULL,
    CONSTRAINT "pk_Salaries" PRIMARY KEY (
        "Emlpoyee_No"
     )
);

select * from "Salaries";

CREATE TABLE "Titles" (
    "Title_ID" varchar   NOT NULL,
    "Title" varchar   NOT NULL,
    CONSTRAINT "pk_Titles" PRIMARY KEY (
        "Title_ID"
     )
);

select * from "Titles";

ALTER TABLE "Employees" ADD CONSTRAINT "fk_Employees_Employee_No" FOREIGN KEY("Employee_No")
REFERENCES "Salaries" ("Emlpoyee_No");

ALTER TABLE "Employees" ADD CONSTRAINT "fk_Employees_Employee_Title_ID" FOREIGN KEY("Employee_Title_ID")
REFERENCES "Titles" ("Title_ID");

ALTER TABLE "Department_Emlpoyees" ADD CONSTRAINT "fk_Department_Emlpoyees_Employee_No" FOREIGN KEY("Employee_No")
REFERENCES "Employees" ("Employee_No");

ALTER TABLE "Department_Emlpoyees" ADD CONSTRAINT "fk_Department_Emlpoyees_Department_No" FOREIGN KEY("Department_No")
REFERENCES "Departments" ("Department_No");

ALTER TABLE "Department_Managers" ADD CONSTRAINT "fk_Department_Managers_Department_No" FOREIGN KEY("Department_No")
REFERENCES "Departments" ("Department_No");

ALTER TABLE "Department_Managers" ADD CONSTRAINT "fk_Department_Managers_Emlpoyee_No" FOREIGN KEY("Emlpoyee_No")
REFERENCES "Employees" ("Employee_No");

