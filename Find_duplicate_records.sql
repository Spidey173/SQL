/*
Question 2: Find duplicate records in a table.
*/

CREATE TABLE Employee (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    email VARCHAR(100)
);

INSERT INTO Employee (id, name, email) VALUES
(1, 'Rahul', 'rahul@example.com'),
(2, 'Pooja', 'pooja@example.com'),
(3, 'Rahul', 'rahul@example.com'),
(4, 'Ananya', 'ananya@example.com');

SELECT name, COUNT(*)
FROM Employee
GROUP BY name
HAVING COUNT(*) > 1;
