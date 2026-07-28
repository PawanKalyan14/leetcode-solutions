1# Write your MySQL query statement below
2    select  
3        E.UNIQUE_ID, M.NAME
4    FROM EMPLOYEES M
5    LEFT JOIN EMPLOYEEUNI E
6    ON M.ID = E.ID;