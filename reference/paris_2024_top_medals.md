# Top-10 countries by medals at the Paris 2024 Summer Olympics

A small, tidy summary of the ten countries that won the most total
medals at the Paris 2024 Summer Games, in long format with one row per
country-and-medal-type. Built for barplot examples: ten ordered
categories (rather than the ~90 medal-winning nations in
[`medal_table`](https://moderndive.github.io/olympicAthletes/reference/medal_table.md))
plus a `medal` fill variable, so stacked, dodged, and proportional
barplots all read cleanly without any filtering.

## Usage

``` r
paris_2024_top_medals
```

## Format

A data frame with 30 rows (10 countries x 3 medal types) and 4
variables:

- country:

  Factor. Country/NOC name, levels ordered from the most to the fewest
  total medals (United States first).

- noc:

  Character. Three-letter IOC code (e.g. `"USA"`, `"CHN"`).

- medal:

  Factor with levels `"Gold"`, `"Silver"`, `"Bronze"`.

- count:

  Integer. Number of that medal type won by that country.

## Source

Derived from
[`medal_table`](https://moderndive.github.io/olympicAthletes/reference/medal_table.md)
(games `"2024 Summer"`).

## Examples

``` r
data(paris_2024_top_medals)
head(paris_2024_top_medals)
#>                      country noc  medal count
#> 1              United States USA   Gold    40
#> 2              United States USA Silver    44
#> 3              United States USA Bronze    42
#> 4 People's Republic of China CHN   Gold    40
#> 5 People's Republic of China CHN Silver    27
#> 6 People's Republic of China CHN Bronze    24
```
