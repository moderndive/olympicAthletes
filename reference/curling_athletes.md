# Olympic curling athlete-event participations, 1896-2026

The subset of
[`olympic_athletes`](https://moderndive.github.io/olympicAthletes/reference/olympic_athletes.md)
with `sport == "Curling"`. A convenience dataset so examples can focus
on a single sport without first filtering. Columns are identical to
`olympic_athletes`.

## Usage

``` r
curling_athletes
```

## Format

A data frame with 961 rows and 16 variables; see
[`olympic_athletes`](https://moderndive.github.io/olympicAthletes/reference/olympic_athletes.md)
for the full column descriptions.

## Source

See
[`olympic_athletes`](https://moderndive.github.io/olympicAthletes/reference/olympic_athletes.md).

## Examples

``` r
data(curling_athletes)
head(curling_athletes)
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
