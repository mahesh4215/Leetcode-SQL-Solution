Write a solution to find the customer_number for the customer who has placed the largest number of orders.

The test cases are generated so that exactly one customer will have placed more orders than any other customer.

The result format is in the following example.

 

Example 1:

Input: 
Orders table:
+--------------+-----------------+
| order_number | customer_number |
+--------------+-----------------+
| 1            | 1               |
| 2            | 2               |
| 3            | 3               |
| 4            | 3               |
+--------------+-----------------+
Output: 
+-----------------+
| customer_number |
+-----------------+
| 3               |
+-----------------+

Solution: Using group by and aggregrate function 
SQL Server: - 
  
select top 1 customer_number
form Orders
group by customer_number
order by count(*) desc;

MYSQL: - 
  
select customer_number
from Orders
group by customer_number
order by count(*) desc
limit 1;

