# Getting started with olympicAthletes

`olympicAthletes` ships three datasets covering every modern Olympic
Games from **Athens 1896** through **Milano-Cortina 2026**. This
vignette walks through each one and shows a few representative analyses.

``` r

library(olympicAthletes)
```

## The three datasets at a glance

| Dataset            |    Rows | One row per…                          |
|--------------------|--------:|---------------------------------------|
| `olympic_athletes` | 314,749 | (athlete, Games, event) participation |
| `medal_table`      |     273 | (Games, NOC) verified medal totals    |
| `editions`         |       5 | new edition added on top of rgriff23  |

`olympic_athletes` is the headline long-format table. `medal_table` and
`editions` are companion tables that make per-team-event medal counting
and edition-level lookups easy without re-aggregating 300k+ rows.

## `olympic_athletes`: athlete-event participations

``` r

data(olympic_athletes)
str(olympic_athletes, give.attr = FALSE, vec.len = 2)
#> 'data.frame':    315090 obs. of  15 variables:
#>  $ ID    : int  12068 35094 35698 38123 41160 ...
#>  $ Name  : chr  "Arthur Charles Blake" "Angelos Fetsis" ...
#>  $ Sex   : chr  "M" "M" ...
#>  $ Age   : int  24 NA 22 23 21 ...
#>  $ Height: num  NA NA NA 154 NA ...
#>  $ Weight: num  NA NA NA 45 NA ...
#>  $ Team  : chr  "United States" "Greece" ...
#>  $ NOC   : chr  "USA" "GRE" ...
#>  $ Games : chr  "1896 Summer" "1896 Summer" ...
#>  $ Year  : int  1896 1896 1896 1896 1896 ...
#>  $ Season: chr  "Summer" "Summer" ...
#>  $ City  : chr  "Athina" "Athina" ...
#>  $ Sport : chr  "Athletics" "Athletics" ...
#>  $ Event : chr  "Athletics Men's 1,500 metres" "Athletics Men's 1,500 metres" ...
#>  $ Medal : chr  "Silver" NA ...
```

A quick sanity check — participations per Games, by season:

``` r

tab <- table(olympic_athletes$Year, olympic_athletes$Season)
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
gold-winning ice hockey roster has their own `Medal = "Gold"` row. That
matches the rgriff23 schema and is the right shape for athlete-level
analysis, but it inflates team counts when you sum naively.

``` r

# Every roster member of the men's ice hockey gold medal team
# at Beijing 2022 gets a Gold row:
hockey_2022 <- subset(
  olympic_athletes,
  Year == 2022 &
    Event == "Ice Hockey Men's Ice Hockey" &
    Medal == "Gold"
)
nrow(hockey_2022)
#> [1] 0
```

For headline medal-table totals, use `medal_table` instead.

## `medal_table`: verified per-edition totals

`medal_table` covers the five new editions (2018-2026) and uses the IOC
per-team-event convention.

``` r

data(medal_table)
head(subset(medal_table, year == 2024), 5)
#>           games year season noc                    country gold silver bronze
#> 153 2024 Summer 2024 Summer USA              United States   40     44     42
#> 154 2024 Summer 2024 Summer CHN People's Republic of China   40     27     24
#> 155 2024 Summer 2024 Summer JPN                      Japan   20     12     13
#> 156 2024 Summer 2024 Summer AUS                  Australia   18     19     16
#> 157 2024 Summer 2024 Summer FRA                     France   16     26     22
#>     total
#> 153   126
#> 154    91
#> 155    45
#> 156    53
#> 157    64
```

Top five NOCs at Paris 2024 by gold count:

``` r

paris <- subset(medal_table, year == 2024)
paris <- paris[order(-paris$gold, -paris$total), ]
head(paris[, c("noc", "country", "gold", "silver", "bronze", "total")], 5)
#>     noc                    country gold silver bronze total
#> 153 USA              United States   40     44     42   126
#> 154 CHN People's Republic of China   40     27     24    91
#> 155 JPN                      Japan   20     12     13    45
#> 156 AUS                  Australia   18     19     16    53
#> 157 FRA                     France   16     26     22    64
```

## `editions`: metadata for the new five Games

``` r

data(editions)
editions[, c("games", "city", "country",
             "opening_ceremony", "closing_ceremony",
             "participants", "medal_events")]
#>         games           city                    country opening_ceremony
#> 1 2018 Winter    PyeongChang          Republic of Korea       2018-02-09
#> 2 2020 Summer          Tokyo                      Japan       2021-07-23
#> 3 2022 Winter        Beijing People's Republic of China       2022-02-04
#> 4 2024 Summer          Paris                     France       2024-07-26
#> 5 2026 Winter Milano-Cortina                      Italy       2026-02-06
#>   closing_ceremony participants medal_events
#> 1       2018-02-25         2793          102
#> 2       2021-08-08        11319          339
#> 3       2022-02-20         2786          109
#> 4       2024-08-11        10763          329
#> 5       2026-02-22         2932          111
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
