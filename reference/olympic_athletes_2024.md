# Olympic athlete-event participations at the Paris 2024 Summer Games

The subset of
[`olympic_athletes`](https://moderndive.github.io/olympicAthletes/reference/olympic_athletes.md)
from the Paris 2024 Summer Games (`year == 2024 & season == "Summer"`).
A single-Games convenience dataset: small enough that a `height` vs
`weight` scatterplot shows over-plotting without the
multi-hundred-thousand-row scale of the full data, and no
[`filter()`](https://dplyr.tidyverse.org/reference/filter.html) is
required. Note that bio data (height/weight) is missing for many recent
athletes, so roughly a third of rows have complete `height` and
`weight`. Columns are identical to `olympic_athletes`.

## Usage

``` r
olympic_athletes_2024
```

## Format

A data frame with 13,660 rows and 16 variables; see
[`olympic_athletes`](https://moderndive.github.io/olympicAthletes/reference/olympic_athletes.md)
for the full column descriptions.

## Source

See
[`olympic_athletes`](https://moderndive.github.io/olympicAthletes/reference/olympic_athletes.md).

## See also

For the same data a generation earlier (Rome 1960), filter the full
data: `olympic_athletes |> filter(year == 1960, season == "Summer")`.

## Examples

``` r
data(olympic_athletes_2024)
head(olympic_athletes_2024)
#>            id                   name sex age height weight team noc       games
#> 296020  37705      Takaharu Furukawa   M  39    174     89  JPN JPN 2024 Summer
#> 296021  39227             Mete Gazoz   M  25    181     60  TUR TUR 2024 Summer
#> 296022  85360          Mauro Nespoli   M  36    181     78  ITA ITA 2024 Summer
#> 296023  88595              Dan Olaru   M  27    175     70  MDA MDA 2024 Summer
#> 296024  98399          Tarundeep Rai   M  40    174     60  IND IND 2024 Summer
#> 296025 124031 Jean-Charles Valladont   M  35    180     83  FRA FRA 2024 Summer
#>        year season city_local_latin city_english   sport
#> 296020 2024 Summer            Paris        Paris Archery
#> 296021 2024 Summer            Paris        Paris Archery
#> 296022 2024 Summer            Paris        Paris Archery
#> 296023 2024 Summer            Paris        Paris Archery
#> 296024 2024 Summer            Paris        Paris Archery
#> 296025 2024 Summer            Paris        Paris Archery
#>                                   event medal
#> 296020 Archery Individual, Recurve, Men  <NA>
#> 296021 Archery Individual, Recurve, Men  <NA>
#> 296022 Archery Individual, Recurve, Men  <NA>
#> 296023 Archery Individual, Recurve, Men  <NA>
#> 296024 Archery Individual, Recurve, Men  <NA>
#> 296025 Archery Individual, Recurve, Men  <NA>
```
