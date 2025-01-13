Write a solution to find the employees who earn more than their managers.

Return the result table in any order.

The result format is in the following example.


Example 1:

Input: 
Employee table:
+----+-------+--------+-----------+
| id | name  | salary | managerId |
+----+-------+--------+-----------+
| 1  | Joe   | 70000  | 3         |
| 2  | Henry | 80000  | 4         |
| 3  | Sam   | 60000  | Null      |
| 4  | Max   | 90000  | Null      |
+----+-------+--------+-----------+
Output: 
+----------+
| Employee |
+----------+
| Joe      |
+----------+

Solution 1: using Self Join
  
SELECT emp.name AS Employee
FROM Employee emp
JOIN Employee mgr
ON emp.managerId = mgr.id
WHERE emp.salary > mgr.salary;

Solution 2: using Exists operator 
  
SELECT name AS Employee
FROM Employee emp
WHERE EXISTS (
    SELECT 1
    FROM Employee mgr
    WHERE emp.managerId = mgr.id
    AND emp.salary > mgr.salary
);
