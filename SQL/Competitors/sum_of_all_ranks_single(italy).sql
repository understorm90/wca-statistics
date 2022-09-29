SELECT name Name, id, countryId Country, r2 + r3 + r4 + r5 + r6 + r7 + r3bf + r3mbf + r3fm + r3oh + clock + minx + pyram + skewb + sq1 + 444bf + 555bf + r3ft + magic + mmagic Sum, 
    r2 '2x2',
    r3 '3x3',
    r4 '4x4',
    r5 '5x5',
    r6 '6x6',
    r7 '7x7',
    r3bf '3x3 blindfolded',
    r3mbf '3x3 multibld',
    r3fm '3x3 fewest moves',
    r3oh '3x3 one handed',
    clock 'Clock',
    minx 'Megaminx',
    pyram 'Pyraminx',
    skewb 'Skewb',
    sq1 'Square-1',
    444bf '4x4 blindfolded',
    555bf '5x5 blindfolded',
    r3ft '3x3 with feet',
    magic 'Magic',
    mmagic 'Master Magic'
FROM (
    SELECT id,
        p.name,
        p.countryId,
        (SELECT IFNULL((SELECT worldRank FROM RanksSingle WHERE personId = p.id AND eventId = '222'),(SELECT COUNT(worldRank)+1 FROM RanksSingle where eventId = '222'))) r2,
        (SELECT IFNULL((SELECT worldRank FROM RanksSingle WHERE personId = p.id AND eventId = '333'),(SELECT COUNT(worldRank)+1 FROM RanksSingle where eventId = '333'))) r3,
        (SELECT IFNULL((SELECT worldRank FROM RanksSingle WHERE personId = p.id AND eventId = '444'),(SELECT COUNT(worldRank)+1 FROM RanksSingle where eventId = '444'))) r4,
        (SELECT IFNULL((SELECT worldRank FROM RanksSingle WHERE personId = p.id AND eventId = '555'),(SELECT COUNT(worldRank)+1 FROM RanksSingle where eventId = '555'))) r5,
        (SELECT IFNULL((SELECT worldRank FROM RanksSingle WHERE personId = p.id AND eventId = '666'),(SELECT COUNT(worldRank)+1 FROM RanksSingle where eventId = '666'))) r6,
        (SELECT IFNULL((SELECT worldRank FROM RanksSingle WHERE personId = p.id AND eventId = '777'),(SELECT COUNT(worldRank)+1 FROM RanksSingle where eventId = '777'))) r7,
        (SELECT IFNULL((SELECT worldRank FROM RanksSingle WHERE personId = p.id AND eventId = '333bf'),(SELECT COUNT(worldRank)+1 FROM RanksSingle where eventId = '333bf'))) r3bf,
        (SELECT IFNULL((SELECT worldRank FROM RanksSingle WHERE personId = p.id AND eventId = '333mbf'),(SELECT COUNT(worldRank)+1 FROM RanksSingle where eventId = '333mbf'))) r3mbf,
        (SELECT IFNULL((SELECT worldRank FROM RanksSingle WHERE personId = p.id AND eventId = '333fm'),(SELECT COUNT(worldRank)+1 FROM RanksSingle where eventId = '333fm'))) r3fm,
        (SELECT IFNULL((SELECT worldRank FROM RanksSingle WHERE personId = p.id AND eventId = '333oh'),(SELECT COUNT(worldRank)+1 FROM RanksSingle where eventId = '333oh'))) r3oh,
        (SELECT IFNULL((SELECT worldRank FROM RanksSingle WHERE personId = p.id AND eventId = 'clock'),(SELECT COUNT(worldRank)+1 FROM RanksSingle where eventId = 'clock'))) clock,
        (SELECT IFNULL((SELECT worldRank FROM RanksSingle WHERE personId = p.id AND eventId = 'minx'),(SELECT COUNT(worldRank)+1 FROM RanksSingle where eventId = 'minx'))) minx,
        (SELECT IFNULL((SELECT worldRank FROM RanksSingle WHERE personId = p.id AND eventId = 'pyram'),(SELECT COUNT(worldRank)+1 FROM RanksSingle where eventId = 'pyram'))) pyram,
        (SELECT IFNULL((SELECT worldRank FROM RanksSingle WHERE personId = p.id AND eventId = 'skewb'),(SELECT COUNT(worldRank)+1 FROM RanksSingle where eventId = 'skewb'))) skewb,
        (SELECT IFNULL((SELECT worldRank FROM RanksSingle WHERE personId = p.id AND eventId = 'sq1'),(SELECT COUNT(worldRank)+1 FROM RanksSingle where eventId = 'sq1'))) sq1,
        (SELECT IFNULL((SELECT worldRank FROM RanksSingle WHERE personId = p.id AND eventId = '444bf'),(SELECT COUNT(worldRank)+1 FROM RanksSingle where eventId = '444bf'))) 444bf,
        (SELECT IFNULL((SELECT worldRank FROM RanksSingle WHERE personId = p.id AND eventId = '555bf'),(SELECT COUNT(worldRank)+1 FROM RanksSingle where eventId = '555bf'))) 555bf,
        (SELECT IFNULL((SELECT worldRank FROM RanksSingle WHERE personId = p.id AND eventId = '333ft'),(SELECT COUNT(worldRank)+1 FROM RanksSingle where eventId = '333ft'))) r3ft,
        (SELECT IFNULL((SELECT worldRank FROM RanksSingle WHERE personId = p.id AND eventId = 'magic'),(SELECT COUNT(worldRank)+1 FROM RanksSingle where eventId = 'magic'))) magic,
        (SELECT IFNULL((SELECT worldRank FROM RanksSingle WHERE personId = p.id AND eventId = 'mmagic'),(SELECT COUNT(worldRank)+1 FROM RanksSingle where eventId = 'mmagic'))) mmagic
    FROM Persons p) r
WHERE countryId = 'Italy'
ORDER BY Sum ASC