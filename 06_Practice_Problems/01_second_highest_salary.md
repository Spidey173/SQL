# Problem 01: Find Second Highest Salary

## 📝 Problem Statement
Find the second highest salary from the `Employee` (or `employees`) table. If there is no second highest salary, the query should return `NULL`.

---

## 📊 Schema & Sample Data

```sql
CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    salary INT
);

INSERT INTO employees (id, name, salary) VALUES
(1, 'Alice', 5000),
(2, 'Bob', 8000),
(3, 'Charlie', 8000),
(4, 'David', 6000);
```

---

## 💡 Solution Approaches

### Approach 1: Subquery with `MAX()` (Your Solution ⭐)

```sql
SELECT MAX(salary) AS SecondHighestSalary
FROM employees
WHERE salary < (
    SELECT MAX(salary)
    FROM employees
);
```

#### 🔍 How it Works:
1. The inner subquery `(SELECT MAX(salary) FROM employees)` finds the absolute highest salary (`8000`).
2. The outer query filters `WHERE salary < 8000` (which leaves `5000` and `6000`).
3. `MAX(salary)` on those filtered rows gives the second highest salary (`6000`).
4. **Key Advantage**: If there is only one salary in the table or all salaries are equal, `MAX()` automatically returns `NULL`.

---

### Approach 2: Using `DISTINCT`, `ORDER BY`, `LIMIT`, and `OFFSET`

```sql
SELECT (
    SELECT DISTINCT salary 
    FROM employees
    ORDER BY salary DESC
    LIMIT 1 OFFSET 1
) AS SecondHighestSalary;
```

#### 🔍 How it Works:
- `DISTINCT salary`: Removes duplicate values (important if multiple employees share the top salary).
- `ORDER BY salary DESC`: Sorts salaries from highest to lowest.
- `LIMIT 1 OFFSET 1`: Skips the 1st highest (`OFFSET 1`) and takes the next 1 (`LIMIT 1`).
- Wrapped in an outer `SELECT (...) AS SecondHighestSalary` so that it safely returns `NULL` if no 2nd row exists.

---

### Approach 3: Using Window Functions (`DENSE_RANK()`)

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

#### 🔍 Why `DENSE_RANK` instead of `RANK`?
- `RANK()` gives `1, 1, 3` if there are ties for 1st place (skipping rank 2).
- `DENSE_RANK()` gives `1, 1, 2` for ties, ensuring rank 2 is always the true 2nd distinct highest salary.
- This approach easily scales to find the **N-th highest salary** (just change `WHERE rank_num = N`).

---

## 🎯 Quick Comparison

| Approach | Best For | Handles Ties? | Returns NULL if missing? |
| :--- | :--- | :---: | :---: |
| **Subquery + `MAX`** | Quick 2nd highest queries | ✅ | ✅ |
| **`LIMIT / OFFSET`** | MySQL / PostgreSQL syntax | ✅ (with `DISTINCT`) | ✅ (with outer SELECT) |
| **`DENSE_RANK()`** | General N-th highest salary | ✅ | ✅ (with `MAX()`) |
