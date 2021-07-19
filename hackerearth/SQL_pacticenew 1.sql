SELECT DISTINCT CITY
FROM STATION
WHERE CITY REGEXP "^[aeiou].*";


Select round(long_w,4) from Station where lat_n < 137.2345 order by lat_n desc limit 1;

SELECT ROUND(((MAX(LONG_W) - MIN(LONG_W)) + (MAX(LAT_N) - MIN(LAT_N))),4)
FROM STATION;

SELECT ROUND(SQRT(POWER((MAX(LONG_W) - MIN(LONG_W)),2) + POWER((MAX(LAT_N) - MIN(LAT_N)),2)),4)
FROM STATION;



select round(s.lat_n,4) from station s
where (select ceil(count(s.lat_n)/2) from station) = (select count(s.lat_n) from station s1 where s1.lat_n>=s.lat_n)



SELECT A.HACKER_ID, A.NAME, B.CHALLENGES_CREATED AS TOTAL_COUNT
FROM
HACKERS A
INNER JOIN
(SELECT HACKER_ID, COUNT(CHALLENGE_ID) AS CHALLENGES_CREATED
FROM CHALLENGES GROUP BY HACKER_ID) B
ON A.HACKER_ID = B.HACKER_ID

HAVING
TOTAL_COUNT = (SELECT MAX(C.CNT) FROM (SELECT HACKER_ID, COUNT(CHALLENGE_ID) AS CNT
FROM CHALLENGES GROUP BY HACKER_ID) AS C)

OR

TOTAL_COUNT IN (SELECT T.CNT FROM (SELECT HACKER_ID, COUNT(CHALLENGE_ID) AS CNT
FROM CHALLENGES GROUP BY HACKER_ID) AS T
               HAVING COUNT(T.CNT) = 1)

ORDER BY TOTAL_COUNT DESC, A.HACKER_ID;




/* these are the columns we want to output */
select c.hacker_id, h.name ,count(c.hacker_id) as c_count

/* this is the join we want to output them from */
from Hackers as h
    inner join Challenges as c on c.hacker_id = h.hacker_id

/* after they have been grouped by hacker */
group by c.hacker_id

/* but we want to be selective about which hackers we output */
/* having is required (instead of where) for filtering on groups */
having 

    /* output anyone with a count that is equal to... */
    c_count = 
        /* the max count that anyone has */
        (SELECT MAX(temp1.cnt)
        from (SELECT COUNT(hacker_id) as cnt
             from Challenges
             group by hacker_id
             order by hacker_id) temp1)

    /* or anyone who's count is in... */
    or c_count in 
        /* the set of counts... */
        (select t.cnt
         from (select count(*) as cnt 
               from challenges
               group by hacker_id) t
         /* who's group of counts... */
         group by t.cnt
         /* has only one element */
         having count(t.cnt) = 1)

/* finally, the order the rows should be output */
order by c_count DESC, c.hacker_id

/* ;) */
;


SELECT CASE
	WHEN P IS NULL THEN CONCAT(N, ' Root')
	WHEN N IN (SELECT DISTINCT P FROM BST) THEN CONCAT(N, ' Inner')
	ELSE CONCAT(N, ' Leaf')
	END
FROM BST
ORDER BY N ASC;


select c.company_code, c.founder, 
    count(distinct l.lead_manager_code), count(distinct s.senior_manager_code), 
    count(distinct m.manager_code),count(distinct e.employee_code) 
from Company c, Lead_Manager l, Senior_Manager s, Manager m, Employee e 
where c.company_code = l.company_code 
    and l.lead_manager_code=s.lead_manager_code 
    and s.senior_manager_code=m.senior_manager_code 
    and m.manager_code=e.manager_code 
group by c.company_code order by c.company_code;



SELECT C.COMPANY_CODE, C.FOUNDER,
    COUNT(DISTINCT L.LEAD_MANAGER_CODE), COUNT(DISTINCT S.SENIOR_MANAGER_CODE),
    COUNT(DISTINCT M.MANAGER_CODE), COUNT(DISTINCT E.EMPLOYEE_CODE)
FROM COMPANY C, LEAD_MANAGER L, SENIOR_MANAGER S, MANAGER M, EMPLOYEE E
WHERE C.COMPANY_CODE = L.COMPANY_CODE
    AND L.LEAD_MANAGER_CODE = S.LEAD_MANAGER_CODE
    AND S.SENIOR_MANAGER_CODE = M.SENIOR_MANAGER_CODE
    AND M.MANAGER_CODE = E.MANAGER_CODE
GROUP BY C.COMPANY_CODE, c.FOUNDER
ORDER BY C.COMPANY_CODE ASC;


SELECT IF(GRADE < 8, NULL, NAME), GRADE, MARKS
FROM STUDENTS JOIN GRADES  --this join without any on condition creates cross-product
WHERE MARKS BETWEEN MIN_MARK AND MAX_MARK
ORDER BY GRADE DESC, NAME;