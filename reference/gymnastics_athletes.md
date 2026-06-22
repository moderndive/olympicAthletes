# Olympic gymnastics athlete-event participations, 1896-2026

The subset of
[`olympic_athletes`](https://moderndive.github.io/olympicAthletes/reference/olympic_athletes.md)
with `sport == "Gymnastics"`. A convenience dataset so examples can
focus on a single sport without first filtering. Columns are identical
to `olympic_athletes`.

## Usage

``` r
gymnastics_athletes
```

## Format

A data frame with 29,413 rows and 16 variables; see
[`olympic_athletes`](https://moderndive.github.io/olympicAthletes/reference/olympic_athletes.md)
for the full column descriptions.

## Source

See
[`olympic_athletes`](https://moderndive.github.io/olympicAthletes/reference/olympic_athletes.md).

## Examples

``` r
data(gymnastics_athletes)
head(gymnastics_athletes)
#>        id                         name sex age height weight    team noc
#> 163 12563    Conrad Helmut Fritz Bcker   M  25     NA     NA Germany GER
#> 164 35740                Alfred Flatow   M  26     NA     NA Germany GER
#> 165 35741          Gustav Felix Flatow   M  21     NA     NA Germany GER
#> 166 48633            Georg Otto Hilmar   M  19     NA     NA Germany GER
#> 167 56757          Gyula Kakas (Kokas)   M  NA     NA     NA Hungary HUN
#> 168 74612 Julius Carl Fritz Manteuffel   M  21     NA     62 Germany GER
#>           games year season city_local_latin city_english      sport
#> 163 1896 Summer 1896 Summer           Athína       Athens Gymnastics
#> 164 1896 Summer 1896 Summer           Athína       Athens Gymnastics
#> 165 1896 Summer 1896 Summer           Athína       Athens Gymnastics
#> 166 1896 Summer 1896 Summer           Athína       Athens Gymnastics
#> 167 1896 Summer 1896 Summer           Athína       Athens Gymnastics
#> 168 1896 Summer 1896 Summer           Athína       Athens Gymnastics
#>                               event  medal
#> 163 Gymnastics Men's Horizontal Bar   <NA>
#> 164 Gymnastics Men's Horizontal Bar Silver
#> 165 Gymnastics Men's Horizontal Bar   <NA>
#> 166 Gymnastics Men's Horizontal Bar   <NA>
#> 167 Gymnastics Men's Horizontal Bar   <NA>
#> 168 Gymnastics Men's Horizontal Bar   <NA>
```
