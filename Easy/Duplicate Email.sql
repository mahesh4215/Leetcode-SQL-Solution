Table: Person

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| email       | varchar |
+-------------+---------+
id is the primary key (column with unique values) for this table.
Each row of this table contains an email. The emails will not contain uppercase letters.
 

Write a solution to report all the duplicate emails. Note that it's guaranteed that the email field is not NULL.

Return the result table in any order.

The result format is in the following example.

 

Example 1:

Input: 
Person table:
+----+---------+
| id | email   |
+----+---------+
| 1  | a@b.com |
| 2  | c@d.com |
| 3  | a@b.com |
+----+---------+
Output: 
+---------+
| Email   |
+---------+
| a@b.com |
+---------+

Solution 1: Using Group by and having 

SELECT email as Email
FROM Person
GROUP BY email
HAVING COUNT(*) > 1;

Solution 2: Using Self Join

SELECT DISTINCT p1.email as Email
FROM Person p1
JOIN Person p2
ON p1.email = p2.email
WHERE p1.id <> p2.id;

Solution 3: Using window Function

SELECT DISTINCT Email
FROM (
    SELECT email, COUNT(*) OVER (PARTITION BY email) AS cnt
    FROM Person
) AS sub
WHERE cnt > 1;



