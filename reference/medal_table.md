# Verified medal tables for every Olympic edition, 1896-2026

One row per (Games, NOC) with verified Gold/Silver/Bronze counts cross-
checked against olympedia.org and Wikipedia/IOC. Use this rather than
aggregating `olympic_athletes` when you want the per-team-event medal
convention (one medal per gold-winning ice hockey team, not 25).

## Usage

``` r
medal_table
```

## Format

A data frame with 1,929 rows and 11 variables:

- edition_id:

  Integer. Olympedia's internal edition number.

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

- notes:

  Character. Free-text notes (e.g. shared medals, post-hoc
  reallocations).

## Source

<https://www.olympedia.org/> (manually verified per edition).

## Examples

``` r
data(medal_table)
subset(medal_table, year == 2024)[1:10, ]
#>      edition_id       games year season noc                    country gold
#> 1808         63 2024 Summer 2024 Summer USA              United States   40
#> 1809         63 2024 Summer 2024 Summer CHN People's Republic of China   40
#> 1810         63 2024 Summer 2024 Summer JPN                      Japan   20
#> 1811         63 2024 Summer 2024 Summer AUS                  Australia   18
#> 1812         63 2024 Summer 2024 Summer FRA                     France   16
#> 1813         63 2024 Summer 2024 Summer NED                Netherlands   15
#> 1814         63 2024 Summer 2024 Summer GBR              Great Britain   14
#> 1815         63 2024 Summer 2024 Summer KOR          Republic of Korea   13
#> 1816         63 2024 Summer 2024 Summer ITA                      Italy   12
#> 1817         63 2024 Summer 2024 Summer GER                    Germany   12
#>      silver bronze total notes
#> 1808     44     42   126      
#> 1809     27     24    91      
#> 1810     12     13    45      
#> 1811     19     16    53      
#> 1812     26     22    64      
#> 1813      7     12    34      
#> 1814     22     29    65      
#> 1815      9     10    32      
#> 1816     13     15    40      
#> 1817     13      8    33      
```
