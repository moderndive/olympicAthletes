# Olympic team-sport athlete-event participations (Basketball, Volleyball, Curling)

The subset of
[`olympic_athletes`](https://moderndive.github.io/olympicAthletes/reference/olympic_athletes.md)
with `sport` in Basketball, Volleyball, or Curling: three team sports
with contrasting physiques, handy for comparing distributions across
groups (boxplots, violins, facets) without first filtering. Columns are
identical to `olympic_athletes`.

## Usage

``` r
team_sport_athletes
```

## Format

A data frame with 10,912 rows and 16 variables; see
[`olympic_athletes`](https://moderndive.github.io/olympicAthletes/reference/olympic_athletes.md)
for the full column descriptions.

## Source

See
[`olympic_athletes`](https://moderndive.github.io/olympicAthletes/reference/olympic_athletes.md).

## Examples

``` r
data(team_sport_athletes)
head(team_sport_athletes)
#>          id                          name sex age height weight          team
#> 22151  1341 Johan Petter hln (Andersson-)   M  44     NA     NA        Sweden
#> 22152  4060            Georges Jules Andr   M  47     NA     NA        France
#> 22153 17919          Pierre Henri Canivet   M  33     NA     NA        France
#> 22154 23463 Fernand Henri Jean Cournollet   M  41     NA     NA        France
#> 22155 52402            Armand Isaac-Bndic   M  48     NA     NA        France
#> 22156 53130              Laurence Jackson   M  23     NA     NA Great Britain
#>       noc       games year season city_local_latin city_english   sport
#> 22151 SWE 1924 Winter 1924 Winter         Chamonix     Chamonix Curling
#> 22152 FRA 1924 Winter 1924 Winter         Chamonix     Chamonix Curling
#> 22153 FRA 1924 Winter 1924 Winter         Chamonix     Chamonix Curling
#> 22154 FRA 1924 Winter 1924 Winter         Chamonix     Chamonix Curling
#> 22155 FRA 1924 Winter 1924 Winter         Chamonix     Chamonix Curling
#> 22156 GBR 1924 Winter 1924 Winter         Chamonix     Chamonix Curling
#>                       event  medal
#> 22151 Curling Men's Curling Silver
#> 22152 Curling Men's Curling Bronze
#> 22153 Curling Men's Curling Bronze
#> 22154 Curling Men's Curling Bronze
#> 22155 Curling Men's Curling Bronze
#> 22156 Curling Men's Curling   Gold
```
