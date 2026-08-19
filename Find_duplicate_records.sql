/*
Question 2: Find duplicate records in a table.
*/

CREATE TABLE Employee (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    email VARCHAR(100)
);

INSERT INTO Employee (id, name, email) VALUES
(1, 'John', 'john@example.com'),
(2, 'Bob', 'bob@example.com'),
(3, 'John', 'john@example.com'),
(4, 'Alice', 'alice@example.com');

SELECT name, COUNT(*)
FROM Employee
GROUP BY name
HAVING COUNT(*) > 1;
