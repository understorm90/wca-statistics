SELECT person_name name,
       COUNT(DISTINCT competition_id) nCompetitions
FROM   results
WHERE  country_id = 'Italy'
GROUP BY person_id, person_name
ORDER BY nCompetitions DESC
