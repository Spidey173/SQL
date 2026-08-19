# Question 1: Find Second Highest Salary

## Question
Find the second highest salary from the `Employee` table. If there is no second highest salary, return `NULL`.

---

## Sample Data

```sql
CREATE TABLE Employee (
    id INT PRIMARY KEY,
    salary INT
);

INSERT INTO Employee (id, salary) VALUES
(1, 100),
(2, 200),
(3, 300);
```

### Table: `Employee`
| id | salary |
|---|---|
| 1 | 100 |
| 2 | 200 |
| 3 | 300 |

### Expected Output:
| SecondHighestSalary |
|---|
| 200 |

---

## Answer

### Approach 1: Subquery with `MAX()`
```sql
SELECT MAX(salary) AS SecondHighestSalary
FROM Employee
WHERE salary < (
    SELECT MAX(salary)
    FROM Employee
);
```

### Approach 2: Using `DENSE_RANK()` (Window Function)
```sql
WITH RankedSalaries AS (
    SELECT 
        salary,
        DENSE_RANK() OVER (ORDER BY salary DESC) AS rank_num
    FROM Employee
)
SELECT MAX(salary) AS SecondHighestSalary
FROM RankedSalaries
WHERE rank_num = 2;
```
