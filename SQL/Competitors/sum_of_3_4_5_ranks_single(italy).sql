SELECT name Name, id, countryId Country, r3 + r4 + r5 Sum, 
    r3 '3x3',
    r4 '4x4',
    r5 '5x5'
FROM (SELECT id, p.name, p.countryId,
        (SELECT worldRank FROM RanksSingle WHERE personId = p.id AND eventId = '333') r3,
        (SELECT worldRank FROM RanksSingle WHERE personId = p.id AND eventId = '444') r4,
        (SELECT worldRank FROM RanksSingle WHERE personId = p.id AND eventId = '555') r5
    FROM Persons p) r
WHERE
    r3 IS NOT NULL
    AND r4 IS NOT NULL
    AND r5 IS NOT NULL
    AND countryId = 'Italy'
ORDER BY Sum ASC
LIMIT 20