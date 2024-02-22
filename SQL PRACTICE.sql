USE PRACTICE
SELECT * FROM detailss;
-- Aggregate Function (SUM, AVG, COUNT)
SELECT sum(AMOUNT) AS TotalAmount
FROM Detailss

SELECT AVG(quantity) AS AverageQuantity
FROM Detailss

SELECT COUNT(orderId) AS NumberOfOrders
FROM Detailss

-- SUBQUERY 
select category , sum(amount) as total_amount from detailss
           group by category 
		   order by total_amount desc limit 5;

select count(paymentmode) as count_paymentmode, paymentmode , sum(amount) as total_amount
from detailss
              group by paymentmode 
              order by total_amount desc;        
         
select * from orders where customername like "%gopal%";
 
 
-- Create Table
  CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);
 
  CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

-- Insert data into Departments table
  INSERT INTO Departments (DepartmentID, DepartmentName) VALUES
(1, 'Engineering'),
(2, 'Marketing'),
(3, 'Finance');

-- Insert data into Employees table
  INSERT INTO Employees (EmployeeID, FirstName, LastName, DepartmentID) VALUES
(1, 'John', 'Doe', 1),
(2, 'Jane', 'Smith', 1),
(3, 'Michael', 'Johnson', 2),
(4, 'Emily', 'Williams', 3); 
 
 -- Joins
SELECT * FROM departments;
SELECT * FROM employees;

 -- INNER JOIN / JOIN
SELECT E.EmployeeID, E.FirstName, E.LastName, D.DepartmentName
FROM Employees E
INNER JOIN Departments D ON E.DepartmentID = D.DepartmentID;
 
-- LEFT JOIN with filtering: Retrives all employees and their departments,but only for employees in the engineering departments.
SELECT E.FirstName, E.LastName,D.DepartmentName
FROM Employees E
LEFT JOIN Departments D ON 
E.DepartmentID = D.DepartmentID
WHERE D.DepartmentName = "ENGINEERING";

--  RIGHT JOIN with aggregation: Retrives all departments and the count of employees in each department, including departments with no employees.
SELECT D.DepartmentName,
count(e.employeeId) as EmployeeCount from departments D
RIGHT JOIN Employees E ON D.DepartmentId = E.DepartmentId
GROUP BY D.DepartmentName;


