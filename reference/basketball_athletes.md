# Olympic basketball athlete-event participations, 1896-2026

The subset of
[`olympic_athletes`](https://moderndive.github.io/olympicAthletes/reference/olympic_athletes.md)
with `sport == "Basketball"`. A convenience dataset so examples can
focus on a single sport without first filtering. Columns are identical
to `olympic_athletes`.

## Usage

``` r
basketball_athletes
```

## Format

A data frame with 5,159 rows and 16 variables; see
[`olympic_athletes`](https://moderndive.github.io/olympicAthletes/reference/olympic_athletes.md)
for the full column descriptions.

## Source

See
[`olympic_athletes`](https://moderndive.github.io/olympicAthletes/reference/olympic_athletes.md).

## Examples

``` r
data(basketball_athletes)
head(basketball_athletes)
#>         id                      name sex age height weight    team noc
#> 33195 1179    Gregorio Ags Muruzabal   M  23     NA     NA Uruguay URU
#> 33196 1530   Gordon "Gord" Aitchison   M  27     NA     NA  Canada CAN
#> 33197 2291            Armando Albano   M  27     NA     NA  Brazil BRA
#> 33198 2532  Burhanettin eref Alemdar   M  19     NA     NA  Turkey TUR
#> 33199 2909 Ian Alistair "Al" Allison   M  27     NA     NA  Canada CAN
#> 33200 3111            Erich Altosaar   M  27    187     NA Estonia EST
#>             games year season city_local_latin city_english      sport
#> 33195 1936 Summer 1936 Summer           Berlin       Berlin Basketball
#> 33196 1936 Summer 1936 Summer           Berlin       Berlin Basketball
#> 33197 1936 Summer 1936 Summer           Berlin       Berlin Basketball
#> 33198 1936 Summer 1936 Summer           Berlin       Berlin Basketball
#> 33199 1936 Summer 1936 Summer           Berlin       Berlin Basketball
#> 33200 1936 Summer 1936 Summer           Berlin       Berlin Basketball
#>                             event  medal
#> 33195 Basketball Men's Basketball   <NA>
#> 33196 Basketball Men's Basketball Silver
#> 33197 Basketball Men's Basketball   <NA>
#> 33198 Basketball Men's Basketball   <NA>
#> 33199 Basketball Men's Basketball Silver
#> 33200 Basketball Men's Basketball   <NA>
```
