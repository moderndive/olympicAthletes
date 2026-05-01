# Verified medal tables for the 2018-2026 editions

One row per (Games, NOC) with verified Gold/Silver/Bronze counts cross-
checked against olympedia.org and Wikipedia/IOC. Use this rather than
aggregating `olympic_athletes` when you want the per-team-event medal
convention (one medal per gold-winning ice hockey team, not 25).

## Usage

``` r
medal_table
```

## Format

A data frame with 273 rows and 9 variables:

- games:

  Character. e.g. `"2026 Winter"`.

- year:

  Integer.

- season:

  Character. `"Summer"` or `"Winter"`.

- noc:

  Character. Three-letter IOC code.

- country:

  Character. Full country/team name.

- gold, silver, bronze:

  Integer. Medal counts.

- total:

  Integer. Sum of the three.

## Source

<https://www.olympedia.org/> (manually verified per edition).

## Examples

``` r
data(medal_table)
subset(medal_table, year == 2024)[1:10, ]
#>           games year season noc                    country gold silver bronze
#> 153 2024 Summer 2024 Summer USA              United States   40     44     42
#> 154 2024 Summer 2024 Summer CHN People's Republic of China   40     27     24
#> 155 2024 Summer 2024 Summer JPN                      Japan   20     12     13
#> 156 2024 Summer 2024 Summer AUS                  Australia   18     19     16
#> 157 2024 Summer 2024 Summer FRA                     France   16     26     22
#> 158 2024 Summer 2024 Summer NED                Netherlands   15      7     12
#> 159 2024 Summer 2024 Summer GBR              Great Britain   14     22     29
#> 160 2024 Summer 2024 Summer KOR          Republic of Korea   13      9     10
#> 161 2024 Summer 2024 Summer ITA                      Italy   12     13     15
#> 162 2024 Summer 2024 Summer GER                    Germany   12     13      8
#>     total
#> 153   126
#> 154    91
#> 155    45
#> 156    53
#> 157    64
#> 158    34
#> 159    65
#> 160    32
#> 161    40
#> 162    33
```
