Write a solution to find the second highest distinct salary from the Employee table. If there is no second highest salary, return null (return None in Pandas).

The result format is in the following example.

Input 1: 
Employee table:
+----+--------+
| id | salary |
+----+--------+
| 1  | 100    |
| 2  | 200    |
| 3  | 300    |
+----+--------+
Output: 
+---------------------+
| SecondHighestSalary |
+---------------------+
| 200                 |
+---------------------+

Input 2: 
Employee table:
+----+--------+
| id | salary |
+----+--------+
| 1  | 100    |
+----+--------+
Output: 
+---------------------+
| SecondHighestSalary |
+---------------------+
| null                |
+---------------------+

Solution: Using max function
select isnull(
  (select max(salary) from Employee
    where salary < (select max(salary) from Employee)), null) AS SecondHighestSalary


Solution 2: Using window function 

SELECT MAX(Salary) AS SecondHighestSalary
FROM (
    SELECT Salary, DENSE_RANK() OVER (ORDER BY Salary DESC) AS rank_salary
    FROM Employee
) rank_table
WHERE rank_salary = 2;
