/*
Question 4: Count employees in each department having more than 5 employees.
*/

CREATE TABLE Employee (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    department_id INT
);

INSERT INTO Employee (id, name, department_id) VALUES
(1, 'Aarav', 101),
(2, 'Priya', 101),
(3, 'Rohan', 101),
(4, 'Ananya', 101),
(5, 'Vikram', 101),
(6, 'Sneha', 101),
(7, 'Rahul', 102),
(8, 'Kavya', 102),
(9, 'Aditya', 102);

SELECT department_id, COUNT(*) AS num_employees
FROM Employee
GROUP BY department_id
HAVING COUNT(*) > 5;
