# USA Summer Olympics medal-table rows, 1896-2024

The subset of
[`medal_table`](https://moderndive.github.io/olympicAthletes/reference/medal_table.md)
with `noc == "USA"` and `season == "Summer"`: one row per Summer Games
the USA attended. A convenience dataset for time-series plots of one
nation's medal haul without first filtering. Columns are identical to
`medal_table`. Note the USA-boycotted 1980 Moscow Games have no row at
all.

## Usage

``` r
usa_summer_medals
```

## Format

A data frame with 30 rows and 11 variables; see
[`medal_table`](https://moderndive.github.io/olympicAthletes/reference/medal_table.md)
for the full column descriptions.

## Source

See
[`medal_table`](https://moderndive.github.io/olympicAthletes/reference/medal_table.md).

## Examples

``` r
data(usa_summer_medals)
head(usa_summer_medals)
#>    edition_id       games year season noc       country gold silver bronze
#> 1           1 1896 Summer 1896 Summer USA United States   11      7      2
#> 13          2 1900 Summer 1900 Summer USA United States   20     13     15
#> 31          3 1904 Summer 1904 Summer USA United States   80     85     83
#> 40          4 1906 Summer 1906 Summer USA United States   12      6      6
#> 58          5 1908 Summer 1908 Summer USA United States   23     12     12
#> 76          6 1912 Summer 1912 Summer USA United States   26     19     19
#>    total
#> 1     20
#> 13    48
#> 31   248
#> 40    24
#> 58    47
#> 76    64
#>                                                                                                                                                       notes
#> 1                                                                                                                                                          
#> 13                                                                                                                                                         
#> 31                                                                                                                                                         
#> 40 1906 Intercalated Games — not officially recognised by the IOC; medal counts here are olympedia's reckoning, included for parity with athlete_events.csv
#> 58                                                                                                                                                         
#> 76                                                                                                                                                         
```
