SELECT personName,
       sum( case when pos = 1 then 1 else 0 end ) Golds,
       sum( case when pos = 2 then 1 else 0 end ) Silvers,
       sum( case when pos = 3 then 1 else 0 end ) Bronzes
FROM   Results
WHERE  roundTypeId IN ( 'c', 'f' )
       AND best > 0
       AND countryId = 'Italy'
GROUP  BY personName
ORDER  BY Golds DESC
LIMIT  20