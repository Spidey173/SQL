/*
Question 1: Find Second Highest Salary from the Employee table. If there is no second highest salary, return NULL.
*/

CREATE TABLE Employee (
    id INT PRIMARY KEY,
    salary INT
);

INSERT INTO Employee (id, salary) VALUES
(1, 100),
(2, 200),
(3, 300);

-- Approach 1: Subquery with MAX()
SELECT MAX(salary) AS SecondHighestSalary
FROM Employee
WHERE salary < (
    SELECT MAX(salary)
    FROM Employee
);

-- Approach 2: Using LIMIT / OFFSET
SELECT DISTINCT salary AS SecondHighestSalary
FROM Employee
ORDER BY salary DESC
LIMIT 1, 1;