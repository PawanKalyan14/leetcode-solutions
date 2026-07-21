1SELECT
2    p.product_id,
3    ROUND(
4        COALESCE(SUM(p.price * u.units) / SUM(u.units), 0),
5        2
6    ) AS average_price
7FROM Prices p
8LEFT JOIN UnitsSold u
9    ON p.product_id = u.product_id
10   AND u.purchase_date BETWEEN p.start_date AND p.end_date
11GROUP BY p.product_id;