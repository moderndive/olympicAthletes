# Olympic athletics (track and field) athlete-event participations, 1896-2026

The subset of
[`olympic_athletes`](https://moderndive.github.io/olympicAthletes/reference/olympic_athletes.md)
with `sport == "Athletics"`. A convenience dataset so examples can focus
on a single sport without first filtering. Columns are identical to
`olympic_athletes`.

## Usage

``` r
athletics_athletes
```

## Format

A data frame with 43,062 rows and 16 variables; see
[`olympic_athletes`](https://moderndive.github.io/olympicAthletes/reference/olympic_athletes.md)
for the full column descriptions.

## Source

See
[`olympic_athletes`](https://moderndive.github.io/olympicAthletes/reference/olympic_athletes.md).

## Examples

``` r
data(athletics_athletes)
head(athletics_athletes)
#>      id                       name sex age height weight          team noc
#> 1 12068       Arthur Charles Blake   M  24     NA     NA United States USA
#> 2 35094             Angelos Fetsis   M  NA     NA     NA        Greece GRE
#> 3 35698 Edwin Harold "Teddy" Flack   M  22     NA     NA     Australia AUS
#> 4 38123                 Carl Galle   M  23    154     45       Germany GER
#> 5 41160       Dimitrios P. Golemis   M  21     NA     NA        Greece GRE
#> 6 57441  Konstantinos Karakatsanis   M  NA     NA     NA        Greece GRE
#>         games year season city_local_latin city_english     sport
#> 1 1896 Summer 1896 Summer           Athína       Athens Athletics
#> 2 1896 Summer 1896 Summer           Athína       Athens Athletics
#> 3 1896 Summer 1896 Summer           Athína       Athens Athletics
#> 4 1896 Summer 1896 Summer           Athína       Athens Athletics
#> 5 1896 Summer 1896 Summer           Athína       Athens Athletics
#> 6 1896 Summer 1896 Summer           Athína       Athens Athletics
#>                          event  medal
#> 1 Athletics Men's 1,500 metres Silver
#> 2 Athletics Men's 1,500 metres   <NA>
#> 3 Athletics Men's 1,500 metres   Gold
#> 4 Athletics Men's 1,500 metres   <NA>
#> 5 Athletics Men's 1,500 metres   <NA>
#> 6 Athletics Men's 1,500 metres   <NA>
```
