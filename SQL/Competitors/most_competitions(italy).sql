SELECT personName                    name,
       COUNT(DISTINCT competitionId) nCompetitions
FROM   Results
WHERE  countryId = 'Italy'
GROUP BY personId, personName
ORDER BY nCompetitions DESC