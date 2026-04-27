create database fingertips;

use fingertips;

create table Employee (
Emp_ID int(10),
First_Name varchar(10),
Last_Name varchar(10),
Dept_code int (3));

select * from employee;

insert into Employee (Emp_ID, First_Name, Last_Name, Dept_Code)
values
(248132604,"Shivam", "Deo",76),
(815242165,"Parijat", "Shankar",43),
(416122768,"rahul", "Srivastava", 66),
(960828909,"Kumar","Swamy",47),
(440361783,"Shankh","Khurana",23),
(851591490,"Swapnil", "Mehta", 43),
(668957687,"Arvind", "Chattejee",23),
(585068105,"Jalpesh", "Modi",33),
(379882096,"Kavita", "Yadav", 23),
(718929853,"Syed", "Zaheer", 66),
(873840890,"Sanjay", "Shukla",76),
(941877566,"Ragini", "Malhotra",33),
(998809976,"Javed","Khan", 23),
(669391133, "Vikram","Singh",43),
(861199021,"Ajay","Kumar",23),
(980140890,"Pankaj","Verma",43),
(750603819,"Roshan","Singh",47),
(558885983,"Sunaina","Yadav",76),
(392214056,"Bhavna","Sharma",66),
(164880802,"Pooja","Kumari",47);

select * from employee;

create table Department(
Dept_Code int (10),
Dept_Name varchar(25),
Dept_Budget int (12));

insert into Department (Dept_Code,Dept_Name,Dept_Budget)
values
(23,"Sales and Marketing",50000000),
(66,"Information Technology",100000000),
(43,"Customer Service",30000000),
(33, "Human Resources",20000000),
(76, "Finance and Accounting",40000000),
(47,"Operations",60000000);

select * from employee;
select * from Department;


-- 1. Unique Last Names

SELECT DISTINCT Last_Name 
FROM Employee;

-- 2. Total Number of Employees

SELECT COUNT(*) AS Total_Employees 
FROM Employee;

-- 3. Total Budget for the Company

SELECT SUM(Dept_Budget) AS Total_Company_Budget 
FROM Department;

-- 4. Operations Department Details

SELECT Dept_Code, Dept_Budget 
FROM Department 
WHERE Dept_Name = 'Operations';

-- 5. Budget for IT and Finance Departments

SELECT SUM(Dept_Budget) AS Combined_Budget 
FROM Department 
WHERE Dept_Name IN ('Information Technology', 'Finance and Accounting');

-- 6. Employees in Sales and Marketing

SELECT e.First_Name, e.Last_Name 
FROM Employee e 
JOIN Department d ON e.Dept_code = d.Dept_Code 
WHERE d.Dept_Name = 'Sales and Marketing';

-- 7. Name of Employee with Emp_ID 718929853

SELECT First_Name, Last_Name 
FROM Employee 
WHERE Emp_ID = 718929853;

-- 8. Budget for Customer Service

SELECT Dept_Budget 
FROM Department 
WHERE Dept_Name = 'Customer Service';

-- 9. Total Budget Excluding Operations

SELECT SUM(Dept_Budget) 
FROM Department 
WHERE Dept_Name != 'Operations';

-- 10. Details of Employee "Shukla"

SELECT Emp_ID, First_Name, Dept_code 
FROM Employee 
WHERE Last_Name = 'Shukla';

-- 11. Average Budget for Dept_Code 23 and 43

SELECT AVG(Dept_Budget) 
FROM Department 
WHERE Dept_Code IN (23, 43);

-- 12. Count of Employees starting with 'S'

SELECT COUNT(*) 
FROM Employee 
WHERE First_Name LIKE 'S%';

-- 13. List Names of Employees starting with 'S'

SELECT First_Name, Last_Name 
FROM Employee 
WHERE First_Name LIKE 'S%';

-- 14. Employees starting with 'S' and ending with 'A'

SELECT First_Name, Last_Name 
FROM Employee 
WHERE First_Name LIKE 'S%a';

-- 15. Top 3 Departments by Budget (Descending)

SELECT * FROM Department 
ORDER BY Dept_Budget DESC 
LIMIT 3;

-- 16. Employees with Odd Department Codes

SELECT * FROM Employee 
WHERE Dept_code % 2 != 0;

-- 17. Create Clone_table

CREATE TABLE Clone_table AS 
SELECT CONCAT(First_Name, ' ', Last_Name) AS Full_Name, Dept_code AS D_Code 
FROM Employee;

-- 18. Delete "Ajay Kumar" from Clone_Table

DELETE FROM Clone_table 
WHERE Full_Name = 'Ajay Kumar';

-- 19. Correct "rahul Srivastava" Name

UPDATE Clone_table 
SET Full_Name = 'Rahul Srivastava' 
WHERE Full_Name = 'rahul Srivastava';

-- 20. Convert Full_name to Uppercase

SELECT UPPER(Full_Name) 
FROM Clone_table;

-- 21. Fetch 2nd to 5th Highest Budget Departments

SELECT * FROM Department 
ORDER BY Dept_Budget DESC 
LIMIT 4 OFFSET 1;

-- 22. Delete D_code for "Jalpesh Modi"

UPDATE Clone_table 
SET D_Code = NULL 
WHERE Full_Name = 'Jalpesh Modi';

-- 23. Rename D_Code Column

ALTER TABLE Clone_table 
CHANGE COLUMN D_Code Department_code int;

-- 24. Change Emp_ID Data Type

ALTER TABLE Employee 
MODIFY COLUMN Emp_ID varchar(20);

-- 25. Old and New Budget (10% Increase)

SELECT Dept_Name, Dept_Budget AS Old_Budget, (Dept_Budget * 1.10) AS New_Budget 
FROM Department;

-- 26. Department with the Lowest Budget

SELECT Dept_Name 
FROM Department 
ORDER BY Dept_Budget ASC 
LIMIT 1;

-- 27. Employees in Departments with Budget > 40,000,000

SELECT e.First_Name, e.Last_Name 
FROM Employee e 
JOIN Department d ON e.Dept_code = d.Dept_Code 
WHERE d.Dept_Budget > 40000000;

-- 28. Department with Second Highest Budget

SELECT Dept_Name 
FROM Department 
ORDER BY Dept_Budget DESC 
LIMIT 1 OFFSET 1;

-- 29. Number of Employees in Each Department

SELECT d.Dept_Name, COUNT(e.Emp_ID) AS Employee_Count 
FROM Department d 
LEFT JOIN Employee e ON d.Dept_Code = e.Dept_code 
GROUP BY d.Dept_Name;

-- 30. Create View for Sales and Marketing

CREATE VIEW Sales_Marketing_Employees AS 
SELECT e.* FROM Employee e 
JOIN Department d ON e.Dept_code = d.Dept_Code 
WHERE d.Dept_Name = 'Sales and Marketing';


