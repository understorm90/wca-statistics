SELECT r.personId,
       count(DISTINCT c.countryId) Countries
FROM   Results r
       INNER JOIN Competitions c ON r.competitionId = c.id
WHERE  r.countryId = 'Italy'
       AND c.countryId NOT REGEXP '^X[A-Z]{1}$'
GROUP BY r.personId
ORDER BY Countries DESC