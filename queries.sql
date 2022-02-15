----------------------------------
-- Author       : Shawn Long
-- Create Date  : Feb 15, 2022
-- Modify Date  : Feb 15, 2022
-- Description  : CS 166 - Lab 5
-----------------------------------

-- DATABASE SCHEMA
-- suppliers ( sid NUMERIC(9 ,0) PRIMARY KEY,
--     sname CHAR(30), address CHAR(40));

-- parts ( pid NUMERIC(9 ,0) PRIMARY KEY, 
--     pname CHAR(40), color CHAR(15));

-- catalog ( sid NUMERIC(9 ,0) , pid NUMERIC(9,0), 
--     cost NUMERIC(10,2), 
--     PRIMARY KEY(sid ,pid), 
--     FOREIGN KEY( sid ) REFERENCES Suppliers , 
--     FOREIGN KEY( pid ) REFERENCES Parts ) ;

-- Query 1: Find the pid of parts with cost lower than 10
SELECT pid
FROM catalog
WHERE cost < 10;

-- Query 2: Find the name of parts with cost lower than 10
SELECT P.pname
FROM catalog C, parts P
WHERE C.pid = P.pid AND C.cost < 10;


-- Query 3: Find the address of the suppliers who 
-- supply "Fire Hydrant Cap"

SELECT S.address
from suppliers S, parts P, catalog C
where S.sid = C.sid AND P.pid = C.pid 
    AND P.pname = 'Fire Hydrant Cap';

-- Query 4: Find the name of the suppliers who supply
-- green parts

SELECT S.address
FROM suppliers S, catalog C, parts P
WHERE S.sid = C.sid AND P.pid = C.pid
    AND P.color = 'Green';

-- Query 5: For each supplier, list the supplier's name
-- along with all part's names that it supplies

SELECT S.sname, P.pname
FROM suppliers S, catalog C, parts P
WHERE S.sid = C.sid AND P.pid = C.pid
ORDER BY sname;