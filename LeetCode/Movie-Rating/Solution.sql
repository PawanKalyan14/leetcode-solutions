1# Write your MySQL query statement below
2(
3    SELECT u.name AS results
4    FROM Users u
5    JOIN MovieRating mr
6    ON u.user_id = mr.user_id
7    GROUP BY u.user_id, u.name
8    ORDER BY COUNT(*) DESC, u.name ASC
9    LIMIT 1
10)
11
12UNION ALL
13
14(
15    SELECT m.title AS results
16    FROM Movies m
17    JOIN MovieRating mr
18    ON m.movie_id = mr.movie_id
19    WHERE YEAR(mr.created_at) = 2020
20      AND MONTH(mr.created_at) = 2
21    GROUP BY m.movie_id, m.title
22    ORDER BY AVG(mr.rating) DESC, m.title ASC
23    LIMIT 1
24);