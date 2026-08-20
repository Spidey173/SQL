/*
Question 3: Retrieve employees who earn more than their manager.
*/

CREATE TABLE Manager (
    manager_id INT PRIMARY KEY,
    name VARCHAR(50),
    salary INT
);

CREATE TABLE Employee (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    salary INT,
    manager_id INT
);

INSERT INTO Manager (manager_id, name, salary) VALUES
(101, 'Sam', 60000),
(102, 'Max', 90000),
(103, 'Sarah', 75000);

INSERT INTO Employee (id, name, salary, manager_id) VALUES
(1, 'Joe', 70000, 101),
(2, 'Henry', 80000, 102),
(3, 'Alex', 50000, 101),
(4, 'Rachel', 85000, 103),
(5, 'Daniel', 65000, 102),
(6, 'Emma', 90000, 103);

SELECT e.name AS Employee
FROM Employee e
JOIN Manager m ON e.manager_id = m.manager_id
WHERE e.salary > m.salary;
