# Question 1: Find Second Highest Salary

## Question
Find the second highest salary from the `Employee` table. If there is no second highest salary, return `NULL`.

---

## Answer

### Approach 1: Subquery with `MAX()`
```sql
SELECT MAX(salary) AS SecondHighestSalary
FROM employees
WHERE salary < (
    SELECT MAX(salary)
    FROM employees
);
```

### Approach 2: Using `DENSE_RANK()` (Window Function)
```sql
WITH RankedSalaries AS (
    SELECT 
        salary,
        DENSE_RANK() OVER (ORDER BY salary DESC) AS rank_num
    FROM employees
)
SELECT MAX(salary) AS SecondHighestSalary
FROM RankedSalaries
WHERE rank_num = 2;
```
