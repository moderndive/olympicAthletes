# Olympic athlete-event participations, 2000-2026

The subset of
[`olympic_athletes`](https://moderndive.github.io/olympicAthletes/reference/olympic_athletes.md)
with `year >= 2000` (Sydney 2000 onward). Smaller and less over-plotted
than the full dataset, which makes it handy for scatterplot examples.
Columns are identical to `olympic_athletes`.

## Usage

``` r
olympic_athletes_2000_2026
```

## Format

A data frame with 129,236 rows and 16 variables; see
[`olympic_athletes`](https://moderndive.github.io/olympicAthletes/reference/olympic_athletes.md)
for the full column descriptions.

## Source

See
[`olympic_athletes`](https://moderndive.github.io/olympicAthletes/reference/olympic_athletes.md).

## Examples

``` r
data(olympic_athletes_2000_2026)
head(olympic_athletes_2000_2026)
#>           id                       name sex age height weight    team noc
#> 185859  1587               zdemir Akbal   M  23    178     58  Turkey TUR
#> 185860  4578             Serhiy Antonov   M  35    185     92 Ukraine UKR
#> 185861  5045      Ismely Arias Castillo   M  23    170     63    Cuba CUB
#> 185862  5984    Miika Juha Ilmari Aulio   M  24    174     65 Finland FIN
#> 185863  6710 Bair Dorzhiyevich Badyonov   M  24    178     75  Russia RUS
#> 185864 11799             Matteo Bisiani   M  24    184     85   Italy ITA
#>              games year season city_local_latin city_english   sport
#> 185859 2000 Summer 2000 Summer           Sydney       Sydney Archery
#> 185860 2000 Summer 2000 Summer           Sydney       Sydney Archery
#> 185861 2000 Summer 2000 Summer           Sydney       Sydney Archery
#> 185862 2000 Summer 2000 Summer           Sydney       Sydney Archery
#> 185863 2000 Summer 2000 Summer           Sydney       Sydney Archery
#> 185864 2000 Summer 2000 Summer           Sydney       Sydney Archery
#>                           event medal
#> 185859 Archery Men's Individual  <NA>
#> 185860 Archery Men's Individual  <NA>
#> 185861 Archery Men's Individual  <NA>
#> 185862 Archery Men's Individual  <NA>
#> 185863 Archery Men's Individual  <NA>
#> 185864 Archery Men's Individual  <NA>
```
