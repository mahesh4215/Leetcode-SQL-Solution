Write a solution to find the people who have the most friends and the most friends number.

The test cases are generated so that only one person has the most friends.

The result format is in the following example.

Input: 
RequestAccepted table:
+--------------+-------------+-------------+
| requester_id | accepter_id | accept_date |
+--------------+-------------+-------------+
| 1            | 2           | 2016/06/03  |
| 1            | 3           | 2016/06/08  |
| 2            | 3           | 2016/06/08  |
| 3            | 4           | 2016/06/09  |
+--------------+-------------+-------------+
Output: 
+----+-----+
| id | num |
+----+-----+
| 3  | 3   |
+----+-----+
Explanation: 
The person with id 3 is a friend of people 1, 2, and 4, so he has three friends in total, 
which is the most number than any others.

Solution: Using CTE 

WITH Friends AS (
    SELECT requester_id AS user_id, accepter_id AS friend_id FROM RequestAccepted
    UNION ALL
    SELECT accepter_id AS user_id, requester_id AS friend_id FROM RequestAccepted --- (bidirectional friendship)
)
SELECT TOP 1 
    user_id AS id,                    -- The user ID with the most friends
    COUNT(DISTINCT friend_id) AS num   -- Count unique friends for each user
FROM Friends
GROUP BY user_id                       -- Group by each user to calculate the number of friends
ORDER BY num DESC;                      -- Sort in descending order to get the user with the most friends first



