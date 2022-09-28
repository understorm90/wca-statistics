SELECT r.personId,
       count(DISTINCT c.countryId)                       nCountries,
       GROUP_CONCAT(DISTINCT c.countryId SEPARATOR ', ') Countries
FROM   Results r
       INNER JOIN Competitions c ON r.competitionId = c.id
WHERE  r.countryId = 'Italy'
       AND c.countryId NOT REGEXP '^X[A-Z]{1}$'
GROUP BY r.personId
ORDER BY nCountries DESC 