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