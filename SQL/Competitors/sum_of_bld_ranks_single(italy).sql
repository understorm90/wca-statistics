SELECT name Name, id, countryId Country, r3bf + r3mbf + 444bf + 555bf Sum, 
    r3bf '3x3 blindfolded',
    r3mbf '3x3 multibld',
    444bf '4x4 blindfolded',
    555bf '5x5 blindfolded'
FROM (
    SELECT id,
        p.name,
        p.countryId,
        (SELECT IFNULL((SELECT worldRank FROM RanksSingle WHERE personId = p.id AND eventId = '333bf'),(SELECT COUNT(worldRank)+1 FROM RanksSingle where eventId = '333bf'))) r3bf,
        (SELECT IFNULL((SELECT worldRank FROM RanksSingle WHERE personId = p.id AND eventId = '333mbf'),(SELECT COUNT(worldRank)+1 FROM RanksSingle where eventId = '333mbf'))) r3mbf,
        (SELECT IFNULL((SELECT worldRank FROM RanksSingle WHERE personId = p.id AND eventId = '444bf'),(SELECT COUNT(worldRank)+1 FROM RanksSingle where eventId = '444bf'))) 444bf,
        (SELECT IFNULL((SELECT worldRank FROM RanksSingle WHERE personId = p.id AND eventId = '555bf'),(SELECT COUNT(worldRank)+1 FROM RanksSingle where eventId = '555bf'))) 555bf
    FROM Persons p) r
WHERE countryId = 'Italy'
ORDER BY Sum ASC