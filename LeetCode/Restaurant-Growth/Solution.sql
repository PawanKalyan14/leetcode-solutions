1# Write your MySQL query statement below
2WITH daily_amount AS (
3    SELECT
4        visited_on,
5        SUM(amount) AS amount
6    FROM Customer
7    GROUP BY visited_on
8),
9moving AS (
10    SELECT
11        visited_on,
12        amount,
13        SUM(amount) OVER (
14            ORDER BY visited_on
15            ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
16        ) AS total_amount,
17        COUNT(*) OVER (
18            ORDER BY visited_on
19            ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
20        ) AS cnt
21    FROM daily_amount
22)
23
24SELECT
25    visited_on,
26    total_amount AS amount,
27    ROUND(total_amount / 7, 2) AS average_amount
28FROM moving
29WHERE cnt = 7
30ORDER BY visited_on;
31