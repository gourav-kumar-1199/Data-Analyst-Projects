create database assign;
use assign;
CREATE TABLE employee_performance (
    Emp_ID VARCHAR(10),
    Emp_Name VARCHAR(50),
    Department VARCHAR(30),
    Salary INT,
    Experience_Years INT,
    Rating DECIMAL(3 , 1 ),
    Manager_ID VARCHAR(10)
);

drop table employee_performance;

INSERT INTO employee_performance (Emp_ID, Emp_Name, Department, Salary,
Experience_Years, Rating, Manager_ID) VALUES
('E101', 'Rohan Sharma', 'IT', 72000, 5, 4.3, 'M201'), ('E102', 'Priya Nair', 'HR',
58000, 3, 3.9, 'M202'), ('E103', 'Kunal Joshi', 'Finance', 65000, 4, 4.1, 'M203'),
('E104', 'Sneha Patil', 'IT', 82000, 6, 4.6, 'M201'), ('E105', 'Arjun Mehta', 'Marketing',
55000, 2, 3.5, 'M204'), ('E106', 'Tanya Singh', 'IT', 90000, 7, 4.8, 'M201'), ('E107',
'Nikhil Deshmukh', 'Finance', 72000, 5, 4.2, 'M203'), ('E108', 'Kavya Gupta', 'HR',
60000, 3, 4.0, 'M202'), ('E109', 'Manish Verma', 'Marketing', 58000, 4, 3.7, 'M204'),
('E110', 'Neha Kulkarni', 'IT', 75000, 5, 4.4, 'M201'), ('E111', 'Pooja Jadhav', 'Finance',
68000, 4, 4.0, 'M203'), ('E112', 'Aditya Rao', 'HR', 61000, 3, 4.2, 'M202'), ('E113',
'Isha Bansal', 'IT', 95000, 8, 4.9, 'M201'), ('E114', 'Rajeev Kapoor', 'Marketing',
56000, 2, 3.6, 'M204'), ('E115', 'Shruti Mishra', 'Finance', 70000, 5, 4.3, 'M203'),
('E116', 'Ritesh Jain', 'IT', 78000, 5, 4.5, 'M201'), ('E117', 'Naina Desai', 'HR', 64000,
4, 4.1, 'M202'), ('E118', 'Varun Shetty', 'Finance', 73000, 5, 4.4, 'M203'), ('E119',
'Aarti Khanna', 'Marketing', 60000, 3, 3.8, 'M204'), ('E120', 'Deepak Yadav', 'IT',
88000, 7, 4.7, 'M201'), ('E121', 'Mohit Agarwal', 'HR', 62000, 4, 4.0, 'M202'), ('E122',
'Sanjay Joshi', 'Finance', 76000, 6, 4.5, 'M203'), ('E123', 'Reema Chawla', 'Marketing',
64000, 4, 3.9, 'M204'), ('E124', 'Vivek Tiwari', 'IT', 80000, 6, 4.6, 'M201'), ('E125',
'Simran Kaur', 'HR', 66000, 5, 4.2, 'M202'),('E126', 'Aarav Shah', 'Finance', 69000, 4, 4.1, 'M203'), ('E127', 'Payal Ghosh', 'IT',
93000, 8, 4.8, 'M201'), ('E128', 'Krish Patel', 'Marketing', 61000, 3, 3.7, 'M204'),
('E129', 'Divya Mehta', 'Finance', 72000, 5, 4.2, 'M203'), ('E130', 'Rahul Sinha', 'IT',
87000, 7, 4.7, 'M201'), ('E131', 'Rachit Arora', 'HR', 65000, 5, 4.3, 'M202'), ('E132',
'Snehal Gokhale', 'Finance', 71000, 5, 4.2, 'M203');

-- **************CASE STATEMENT*************
-- Solve the following:-

-- 1. Label employees as Low, Medium, or High based on salary range. ‘Low’ if Salary < 50,000, ‘Medium’ if between 50,000 and 80,000, ‘High’ if > 80,000 
alter table employee_performance add column Emp_type varchar(25);

UPDATE employee_performance 
SET 
    Emp_type = CASE
        WHEN Salary < 50000 THEN 'Low'
        WHEN Salary BETWEEN 50000 AND 80000 THEN 'Medium'
        ELSE 'High'
    END;
    
    -- 2. Categorize employees as Junior, Mid-Level, or Senior. (0–3 years → ‘Junior’, 4– 7 years → ‘Mid-Level’, 8+ years → ‘Senior’)
    alter table employee_performance add column Category varchar(50);
    
    UPDATE employee_performance 
SET 
    category = CASE
        WHEN Experience_Years <= 3 THEN 'Junior'
        WHEN Experience_Years BETWEEN 4 AND 7 THEN 'Mid-Level'
        WHEN Experience_years >= 8 THEN 'Senior'
        ELSE 'Wrong Input'
    END;
    
-- 3. Convert numeric ratings to grade letters (A, B, C) Rating ≥ 4.5 → ‘A’, Rating between 3.5–4.49 → ‘B’, Rating < 3.5 → ‘C’)

alter table employee_performance add Grade varchar(2);

update employee_performance
set Grade =
CASE
        WHEN Rating >= 4.5 THEN 'A'
        WHEN rating BETWEEN 3.5 AND 4.49 THEN 'B'
        WHEN rating < 3.5 THEN 'C'
        ELSE 'Wrong Input'
    END;
    
-- alter table employee_performance drop column Rating;

-- 4. Display 'Male Employee' or 'Female Employee' instead of just gender.
select * from employee_performance;

-- 5. Suggest role titles based on department (Sales → “Business Executive”, IT → “Software Engineer”, HR → “HR Associate”, Finance → “Financial Analyst”, Else → “General Staff”).

alter table employee_performance add column Titles varchar(25);

update employee_performance set Titles = case
when Department = "IT" then "Software Engineer"
when Department = "HR" then "HR Associate"
when Department = "Finance" then "Finance Analyst"
when Department = "Sales" then "Business Executive"
else "General Staff"
end;

alter table employee_performance drop Department;

alter table employee_performance add column department varchar(25) after Salary;
alter table employee_performance rename column department to Department;

update employee_performance set Department = case
when Titles = "Software Engineer"  then "IT" 
when Titles = "HR Associate" then "HR" 
when Titles = "Finance Analyst" then "Finance"  
when Titles ="Business Executive" then "Sales" 
else "General Staff"
end;

-- 6. Assign appraisal % based on employee rating. (Rating ≥ 4.5 → 20%, Rating BETWEEN 4.0 AND 4.49 → 15%, Rating BETWEEN 3.0 AND 3.99 → 10%, Else → 5%).
 
 alter table employee_performance add column Appraisal float;
 select * from employee_performance;
 
 update employee_performance set Appraisal = case
 when rating >= 4.5 then (Salary*0.20)
 when rating between 4 and 4.49 then (Salary*.15)
 when rating between 3 and 3.99 then (Salary*.10)
 else (Salary*0.05)
 end;
 
 -- 7. Compute bonus as % of salary based on rating level (10% of Salary if Rating ≥ 4.5, 5% if Rating BETWEEN 4.0 AND 4.49, 2% otherwise).
 
 alter table employee_performance add column salary_bonus float;
 
 update employee_performance set salary_bonus = case
 when rating >= 4.5 then Salary*0.10
 when rating between 4 and 4.49 then Salary*0.05
 else Salary*0.02
 end;
 
 -- 8. Flag employees as High Risk, Moderate, or Low Risk based on salary & experience. (‘High Risk’ if Experience_Years < 2 AND Salary < 40000, ‘Moderate’ if Experience_Years BETWEEN 2 AND 5, ‘Low Risk’ otherwise).
 
 alter table employee_performance add column flag varchar(20);
 
 update employee_performance set flag = case
 when Experience_Years < 2 and salary < 40000 then "High-Risk"
 when Experience_Years between 2 and 5 then "Moderate-Risk"
 else "Low-Risk"
 end;
 
 -- 9. Sort employees by performance categories using CASE. (High performers (Rating ≥ 4.5) , Medium (3.5–4.49), Low (<3.5)).
 
 alter table employee_performance add column Performance_Category varchar(20);
 update employee_performance set Performance_Category = case
 when Rating >=4.5 then "High Performer"
 when Rating between 3.5 and 4.49 then "Medium Performer"
 else "Low Performer"
 end;
 
 -- 10. Increase salary % differently for each department (Sales +10% Salary, IT + 7%, HR + 5%, Others → +3%) Display new computed salary.
 alter table employee_performance add column Dept_salary_increse float;
 update employee_performance set Dept_salary_increse = case
 when Department = "General Staff" then Salary*0.10
 when Department = "IT" then Salary*.07
 when Department = "HR" then Salary*.05
 else Salary*0.03
 end;
 
 select * from employee_performance;