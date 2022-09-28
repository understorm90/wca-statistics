# wca-statistics
A collection of statistics regarding WCA competitions.

If you own a WCA account, you can visit the [statistics.worldcubeassociation.org/database-query](https://statistics.worldcubeassociation.org/database-query) website and either compute your own queries or use the examples below.

### Examples:
* Competitors
  * [best_medal_collection(italy)](https://statistics.worldcubeassociation.org/database-query?sqlQuery=SELECT+personName%2C%0A+++++++sum%28+case+when+pos+%3D+1+then+1+else+0+end+%29+Golds%2C%0A+++++++sum%28+case+when+pos+%3D+2+then+1+else+0+end+%29+Silvers%2C%0A+++++++sum%28+case+when+pos+%3D+3+then+1+else+0+end+%29+Bronzes%0AFROM+++Results%0AWHERE++roundTypeId+IN+%28+%27c%27%2C+%27f%27+%29%0A+++++++AND+best+%3E+0%0A+++++++AND+countryId+%3D+%27Italy%27%0AGROUP++BY+personName%0AORDER++BY+Golds+DESC%0ALIMIT++20+)
  * [most_competitions(italy)](https://statistics.worldcubeassociation.org/database-query?sqlQuery=SELECT+personName++++++++++++++++++++name%2C%0A+++++++COUNT%28DISTINCT+competitionId%29+nCompetitions%0AFROM+++Results%0AWHERE++countryId+%3D+%27Italy%27%0AGROUP+BY+personId%2C+personName%0AORDER+BY+nCompetitions+DESC)
  * [n_podiums_in_different_events(italy)](https://statistics.worldcubeassociation.org/database-query?sqlQuery=SELECT+personId++++++++++++++++AS+WCAid%2C%0A+++++++personName++++++++++++++AS+name%2C%0A+++++++COUNT%28DISTINCT+eventId%29+AS+nPodiumsInDifferentEvents%0AFROM+++Results+r%0A+++++++JOIN+Competitions+comp+ON+r.competitionId+%3D+comp.id%0A+++++++JOIN+Countries+c+ON+r.countryId+%3D+c.id%0AWHERE++r.roundTypeId+IN+%28+%27f%27%2C+%27c%27+%29%0A+++++++AND+r.pos+IN+%28+1%2C+2%2C+3+%29%0A+++++++AND+r.best+%3E+0%0A+++++++AND+r.countryId+%3D+%27Italy%27%0AGROUP+BY+r.personId%2C+r.personName%0AORDER+BY+nPodiumsInDifferentEvents+DESC+)
  
* Countries
  * [most_countries(italy)](https://statistics.worldcubeassociation.org/database-query?sqlQuery=SELECT+r.personId%2C%0A+++++++count%28DISTINCT+c.countryId%29+Countries%0AFROM+++Results+r%0A+++++++INNER+JOIN+Competitions+c+ON+r.competitionId+%3D+c.id%0AWHERE++r.countryId+%3D+%27Italy%27%0A+++++++AND+c.countryId+NOT+REGEXP+%27%5EX%5BA-Z%5D%7B1%7D%24%27%0AGROUP+BY+r.personId%0AORDER+BY+Countries+DESC)
  * [most_countries_with_country_name(italy)](https://statistics.worldcubeassociation.org/database-query?sqlQuery=SELECT+r.personId%2C%0A+++++++count%28DISTINCT+c.countryId%29+++++++++++++++++++++++nCountries%2C%0A+++++++GROUP_CONCAT%28DISTINCT+c.countryId+SEPARATOR+%27%2C+%27%29+Countries%0AFROM+++Results+r%0A+++++++INNER+JOIN+Competitions+c+ON+r.competitionId+%3D+c.id%0AWHERE++r.countryId+%3D+%27Italy%27%0A+++++++AND+c.countryId+NOT+REGEXP+%27%5EX%5BA-Z%5D%7B1%7D%24%27%0AGROUP+BY+r.personId%0AORDER+BY+nCountries+DESC+)

* Other
  * [wca_tables](https://statistics.worldcubeassociation.org/database-query?sqlQuery=SELECT+*%0AFROM+++information_schema.tables%0AWHERE++table_type+%3D+%27BASE+TABLE%27%0A+++++++AND+table_schema+%3D+%27wca_development%27+)
  * [wca_table_info(Persons)](https://statistics.worldcubeassociation.org/database-query?sqlQuery=SELECT+*%0AFROM+++information_schema.columns%0AWHERE++table_name+%3D+%27Persons%27)

  
