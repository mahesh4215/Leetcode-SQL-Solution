Write a solution to find employees who have the highest salary in each of the departments.

Return the result table in any order.

The result format is in the following example.

Input: 
Employee table:
+----+-------+--------+--------------+
| id | name  | salary | departmentId |
+----+-------+--------+--------------+
| 1  | Joe   | 70000  | 1            |
| 2  | Jim   | 90000  | 1            |
| 3  | Henry | 80000  | 2            |
| 4  | Sam   | 60000  | 2            |
| 5  | Max   | 90000  | 1            |
+----+-------+--------+--------------+
Department table:
+----+-------+
| id | name  |
+----+-------+
| 1  | IT    |
| 2  | Sales |
+----+-------+
Output: 
+------------+----------+--------+
| Department | Employee | Salary |
+------------+----------+--------+
| IT         | Jim      | 90000  |
| Sales      | Henry    | 80000  |
| IT         | Max      | 90000  |
+------------+----------+--------+
Explanation: Max and Jim both have the highest salary in the IT department and Henry has the highest salary in the Sales department.

solution 1: using max and subquery (MYSQL)

SELECT
    Department.name AS 'Department',
    Employee.name AS 'Employee',
    Employee.Salary
FROM
    Employee
JOIN 
    Department
ON Employee.DepartmentId = Department.Id
WHERE
    (Employee.DepartmentId , Employee.Salary) IN 
    (
        SELECT
            DepartmentId, MAX(Salary)
        FROM
            Employee
        GROUP BY DepartmentId
    );

solution 2: using window function (SQL Server)
  
WITH RankedSalaries AS (
    SELECT
        e.name AS Employee,
        e.Salary,
        d.name AS Department,
        DENSE_RANK() OVER (PARTITION BY e.DepartmentId ORDER BY e.Salary DESC) AS Rank
    FROM Employee e
    JOIN Department d ON e.DepartmentId = d.Id
)
SELECT Department, Employee, Salary
FROM RankedSalaries
WHERE Rank = 1;


