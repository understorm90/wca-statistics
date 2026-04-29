select
    r.person_id,
    count(distinct c.country_id) nCountries,
    GROUP_CONCAT(DISTINCT c.country_id SEPARATOR ', ') Countries
from
    results r
    inner join competitions c on r.competition_id = c.id
where
    r.country_id = 'Italy'
    and c.country_id NOT REGEXP '^X[A-Z]{1}$'
group by r.person_id
order by nCountries desc
