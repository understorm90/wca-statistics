SELECT personId                AS WCAid,
       personName              AS name,
       COUNT(DISTINCT eventId) AS nPodiumsInDifferentEvents
FROM   Results r
       JOIN Competitions comp ON r.competitionId = comp.id
       JOIN Countries c ON r.countryId = c.id
WHERE  r.roundTypeId IN ( 'f', 'c' )
       AND r.pos IN ( 1, 2, 3 )
       AND r.best > 0
       AND r.countryId = 'Italy'
GROUP BY r.personId, r.personName
ORDER BY nPodiumsInDifferentEvents DESC 