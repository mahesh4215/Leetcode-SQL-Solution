-- Given a Weather table, write a SQL query to find all dates' Ids with higher temperature compared to its previous (yesterday's) dates.

-- +---------+------------------+------------------+
-- | Id(INT) | RecordDate(DATE) | Temperature(INT) |
-- +---------+------------------+------------------+
-- |       1 |       2015-01-01 |               10 |
-- |       2 |       2015-01-02 |               25 |
-- |       3 |       2015-01-03 |               20 |
-- |       4 |       2015-01-04 |               30 |
-- +---------+------------------+------------------+
-- For example, return the following Ids for the above Weather table:

-- +----+
-- | Id |
-- +----+
-- |  2 |
-- |  4 |
-- +----+

Solution 1: Using Self Join 
  
SELECT w1.Id
FROM Weather w1
JOIN Weather w2
ON DATEDIFF(DAY, w2.RecordDate, w1.RecordDate) = 1
WHERE w1.Temperature > w2.Temperature;

Alternatives: Using Dateadd() 

SELECT w1.Id
FROM Weather w1, Weather w2
WHERE w1.RecordDate = DATEADD(DAY, 1, w2.RecordDate)
AND w1.Temperature > w2.Temperature;


Solution 2: Using Lag() window function

SELECT Id
FROM (
    SELECT 
        Id, 
        Temperature, 
        LAG(Temperature) OVER (ORDER BY RecordDate) AS PrevTemp,
        DATEDIFF(DAY, LAG(RecordDate) OVER (ORDER BY RecordDate), RecordDate) AS DayDiff
    FROM Weather
) w
WHERE DayDiff = 1 AND Temperature > PrevTemp;




