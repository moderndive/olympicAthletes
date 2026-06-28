# Olympic athlete-event participations at the Rome 1960 Summer Games

The subset of
[`olympic_athletes`](https://moderndive.github.io/olympicAthletes/reference/olympic_athletes.md)
from the Rome 1960 Summer Games (`year == 1960 & season == "Summer"`).
Paired with
[`olympic_athletes_2024`](https://moderndive.github.io/olympicAthletes/reference/olympic_athletes_2024.md),
it supports generational comparisons of athlete physiques across roughly
a human lifetime. Unlike the most recent Games, the 1960 Games have
near-complete height/weight coverage (~94% of rows), so it is well
suited to body-size comparisons. Columns are identical to
`olympic_athletes`.

## Usage

``` r
olympic_athletes_1960
```

## Format

A data frame with 8,119 rows and 16 variables; see
[`olympic_athletes`](https://moderndive.github.io/olympicAthletes/reference/olympic_athletes.md)
for the full column descriptions.

## Source

See
[`olympic_athletes`](https://moderndive.github.io/olympicAthletes/reference/olympic_athletes.md).

## See also

[`olympic_athletes_2024`](https://moderndive.github.io/olympicAthletes/reference/olympic_athletes_2024.md)
for the same Games a generation later (Paris 2024).

## Examples

``` r
data(olympic_athletes_1960)
head(olympic_athletes_1960)
#>          id                       name sex age height weight          team noc
#> 62045  7621              Andrei Baraba   M  22    179     65       Romania ROU
#> 62046  8141       Toms Barris Ballestn   M  30    171     67         Spain ESP
#> 62047 10695             Michel Bernard   M  28    181     68        France FRA
#> 62048 16638         Dyrol Jay Burleson   M  20    187     72 United States USA
#> 62049 22077 Peter Michael "Pete" Close   M  22    180     69 United States USA
#> 62050 24985             Muharrem Dalkl   M  22    178     70        Turkey TUR
#>             games year season city_local_latin city_english     sport
#> 62045 1960 Summer 1960 Summer             Roma         Rome Athletics
#> 62046 1960 Summer 1960 Summer             Roma         Rome Athletics
#> 62047 1960 Summer 1960 Summer             Roma         Rome Athletics
#> 62048 1960 Summer 1960 Summer             Roma         Rome Athletics
#> 62049 1960 Summer 1960 Summer             Roma         Rome Athletics
#> 62050 1960 Summer 1960 Summer             Roma         Rome Athletics
#>                              event medal
#> 62045 Athletics Men's 1,500 metres  <NA>
#> 62046 Athletics Men's 1,500 metres  <NA>
#> 62047 Athletics Men's 1,500 metres  <NA>
#> 62048 Athletics Men's 1,500 metres  <NA>
#> 62049 Athletics Men's 1,500 metres  <NA>
#> 62050 Athletics Men's 1,500 metres  <NA>
```
