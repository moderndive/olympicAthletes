# Olympic volleyball athlete-event participations, 1896-2026

The subset of
[`olympic_athletes`](https://moderndive.github.io/olympicAthletes/reference/olympic_athletes.md)
with `sport == "Volleyball"`. A convenience dataset so examples can
focus on a single sport without first filtering. Columns are identical
to `olympic_athletes`.

## Usage

``` r
volleyball_athletes
```

## Format

A data frame with 4,792 rows and 16 variables; see
[`olympic_athletes`](https://moderndive.github.io/olympicAthletes/reference/olympic_athletes.md)
for the full column descriptions.

## Source

See
[`olympic_athletes`](https://moderndive.github.io/olympicAthletes/reference/olympic_athletes.md).

## Examples

``` r
data(volleyball_athletes)
head(volleyball_athletes)
#>          id                         name sex age height weight          team
#> 78215  7783                 Nicolae Brbu   M  27    187     87       Romania
#> 78216 12633                     Gbor Bod   M  23    182     73       Hungary
#> 78217 13470 Victor Mrio Barcellos Borges   M  22    177     73        Brazil
#> 78218 14306     Georgi Spasov Boyadzhiev   M  21    177     76      Bulgaria
#> 78219 15091  David Michael "Mike" Bright   M  26    193     84 United States
#> 78220 15471             Barry Ross Brown   M  30    196     91 United States
#>       noc       games year season city_local_latin city_english      sport
#> 78215 ROU 1964 Summer 1964 Summer            Tokyo        Tokyo Volleyball
#> 78216 HUN 1964 Summer 1964 Summer            Tokyo        Tokyo Volleyball
#> 78217 BRA 1964 Summer 1964 Summer            Tokyo        Tokyo Volleyball
#> 78218 BUL 1964 Summer 1964 Summer            Tokyo        Tokyo Volleyball
#> 78219 USA 1964 Summer 1964 Summer            Tokyo        Tokyo Volleyball
#> 78220 USA 1964 Summer 1964 Summer            Tokyo        Tokyo Volleyball
#>                             event medal
#> 78215 Volleyball Men's Volleyball  <NA>
#> 78216 Volleyball Men's Volleyball  <NA>
#> 78217 Volleyball Men's Volleyball  <NA>
#> 78218 Volleyball Men's Volleyball  <NA>
#> 78219 Volleyball Men's Volleyball  <NA>
#> 78220 Volleyball Men's Volleyball  <NA>
```
