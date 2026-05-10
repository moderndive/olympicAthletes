# Getting started with olympicAthletes

`olympicAthletes` ships three datasets covering every modern Olympic
Games from **Athens 1896** through **Milano-Cortina 2026**. This
vignette walks through each one and shows a few representative analyses.

``` r

library(olympicAthletes)
```

## The three datasets at a glance

| Dataset            |    Rows | One row per…                            |
|--------------------|--------:|-----------------------------------------|
| `olympic_athletes` | 315,090 | (athlete, Games, event) participation   |
| `medal_table`      |   1,929 | (Games, NOC) verified medal totals      |
| `editions`         |      62 | Olympic edition (incl. cancelled Games) |

`olympic_athletes` is the headline long-format table. `medal_table` and
`editions` are companion tables that make per-team-event medal counting
and edition-level lookups easy without re-aggregating 300k+ rows.

## `olympic_athletes`: athlete-event participations

``` r

data(olympic_athletes)
str(olympic_athletes, give.attr = FALSE, vec.len = 2)
#> 'data.frame':    315090 obs. of  16 variables:
#>  $ id              : int  12068 35094 35698 38123 41160 ...
#>  $ name            : chr  "Arthur Charles Blake" "Angelos Fetsis" ...
#>  $ sex             : chr  "M" "M" ...
#>  $ age             : int  24 NA 22 23 21 ...
#>  $ height          : num  NA NA NA 154 NA ...
#>  $ weight          : num  NA NA NA 45 NA ...
#>  $ team            : chr  "United States" "Greece" ...
#>  $ noc             : chr  "USA" "GRE" ...
#>  $ games           : chr  "1896 Summer" "1896 Summer" ...
#>  $ year            : int  1896 1896 1896 1896 1896 ...
#>  $ season          : chr  "Summer" "Summer" ...
#>  $ city_local_latin: chr  "Athína" "Athína" ...
#>  $ city_english    : chr  "Athens" "Athens" ...
#>  $ sport           : chr  "Athletics" "Athletics" ...
#>  $ event           : chr  "Athletics Men's 1,500 metres" "Athletics Men's 1,500 metres" ...
#>  $ medal           : chr  "Silver" NA ...
```

A quick sanity check — participations per Games, by season:

``` r

tab <- table(olympic_athletes$year, olympic_athletes$season)
tail(tab, 10)
#>       
#>        Summer Winter
#>   2008  13602      0
#>   2010      0   4402
#>   2012  12920      0
#>   2014      0   4891
#>   2016  13688      0
#>   2018      0   5119
#>   2020  14536      0
#>   2022      0   5247
#>   2024  13659      0
#>   2026      0   5413
```

### A note on team medals

Medals in `olympic_athletes` are **per-player**: every member of a
gold-winning ice hockey roster has their own `medal = "Gold"` row. It is
the right shape for athlete-level analysis, but it inflates team counts
when you sum naively.

``` r

# Every roster member of the men's ice hockey gold medal team
# at Beijing 2022 gets a Gold row:
hockey_2022 <- subset(
  olympic_athletes,
  year == 2022 &
    event == "Ice Hockey Men's Ice Hockey" &
    medal == "Gold"
)
nrow(hockey_2022)
#> [1] 0
```

For headline medal-table totals, use `medal_table` instead.

## `medal_table`: verified per-edition totals

`medal_table` covers every Olympic edition from Athens 1896 through
Milano-Cortina 2026 and uses the IOC per-team-event convention.

``` r

data(medal_table)
head(subset(medal_table, year == 2024), 5)
#>      edition_id       games year season noc                    country gold
#> 1808         63 2024 Summer 2024 Summer USA              United States   40
#> 1809         63 2024 Summer 2024 Summer CHN People's Republic of China   40
#> 1810         63 2024 Summer 2024 Summer JPN                      Japan   20
#> 1811         63 2024 Summer 2024 Summer AUS                  Australia   18
#> 1812         63 2024 Summer 2024 Summer FRA                     France   16
#>      silver bronze total notes
#> 1808     44     42   126      
#> 1809     27     24    91      
#> 1810     12     13    45      
#> 1811     19     16    53      
#> 1812     26     22    64
```

Top five NOCs at Paris 2024 by gold count:

``` r

paris <- subset(medal_table, year == 2024)
paris <- paris[order(-paris$gold, -paris$total), ]
head(paris[, c("noc", "country", "gold", "silver", "bronze", "total")], 5)
#>      noc                    country gold silver bronze total
#> 1808 USA              United States   40     44     42   126
#> 1809 CHN People's Republic of China   40     27     24    91
#> 1810 JPN                      Japan   20     12     13    45
#> 1811 AUS                  Australia   18     19     16    53
#> 1812 FRA                     France   16     26     22    64
```

## `editions`: metadata for every Games

`editions` includes one row per Olympic edition (62 in total), including
the handful of Games cancelled by the World Wars.

``` r

data(editions)
head(editions[, c("games", "city_local_latin", "city_english", "country",
                  "opening_ceremony", "closing_ceremony",
                  "participants", "medal_events")], 10)
#>          games city_local_latin city_english       country opening_ceremony
#> 1  1896 Summer           Athína       Athens        Greece       1896-04-06
#> 2  1900 Summer            Paris        Paris        France             <NA>
#> 3  1904 Summer        St. Louis    St. Louis United States       1904-05-14
#> 4  1906 Summer           Athína       Athens        Greece       1906-04-22
#> 5  1908 Summer           London       London Great Britain       1908-07-13
#> 6  1912 Summer        Stockholm    Stockholm        Sweden       1912-07-06
#> 7  1916 Summer           Berlin       Berlin       Germany             <NA>
#> 8  1920 Summer        Antwerpen      Antwerp       Belgium       1920-08-14
#> 9  1924 Summer            Paris        Paris        France       1924-07-05
#> 10 1924 Winter         Chamonix     Chamonix        France       1924-01-24
#>    closing_ceremony participants medal_events
#> 1        1896-04-15          176           43
#> 2              <NA>         1241           95
#> 3              <NA>          650           95
#> 4        1906-05-02          841           74
#> 5        1908-07-25         2024          110
#> 6        1912-07-15         2409          107
#> 7              <NA>           NA           NA
#> 8        1920-08-30         2680          162
#> 9        1924-07-27         3255          131
#> 10       1924-02-05          312           17
```

Use it to enrich `olympic_athletes` with edition-level facts (host
country, opening date, total medal events) without scraping anything
yourself.

## Provenance recap

- **1896-2016** rows come from
  [rgriff23/Olympic_history](https://github.com/rgriff23/Olympic_history),
  originally scraped from sports-reference.com.
- **2018-2026** rows were scraped from
  [olympedia.org](https://www.olympedia.org/) using the pipeline at
  [ismayc/olympic-moderndive-data](https://github.com/ismayc/olympic-moderndive-data).
- The build script in `data-raw/DATASET.R` reproduces every `.rda` in
  `data/` from the CSVs in `data-raw/`.

See
[`?olympic_athletes`](https://moderndive.github.io/olympicAthletes/reference/olympic_athletes.md),
[`?medal_table`](https://moderndive.github.io/olympicAthletes/reference/medal_table.md),
and
[`?editions`](https://moderndive.github.io/olympicAthletes/reference/editions.md)
for full column-level documentation.
