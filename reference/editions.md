# Edition-level metadata for every Olympic Games, 1896-2026

One row per Olympic edition (including cancelled Games) with verified
totals for participants, NOCs, medal events, and disciplines, plus
opening/closing ceremony dates.

## Usage

``` r
editions
```

## Format

A data frame with 62 rows and 15 variables:

- edition_id:

  Integer. Olympedia's internal edition number.

- games:

  Character. e.g. `"2024 Summer"`.

- year:

  Integer.

- season:

  Character. `"Summer"` or `"Winter"`.

- city_local_latin:

  Character. Host city in the local-language form rendered in the Latin
  alphabet — i.e. native Latin-script names retain their diacritics
  (`"Athína"`, `"München"`, `"Montréal"`, `"Ciudad de México"`), and
  non-Latin-script names use a standard romanization rather than the
  city's native script (`"Moskva"` not `"Москва"`, `"Tokyo"` not
  `"東京"`, `"Beijing"` not `"北京"`, `"PyeongChang"` not `"평창"`). The
  column is therefore *always* ASCII-or-Latin-1 and never contains the
  city's native non-Latin alphabet.

- city_english:

  Character. Common English name of the host city (e.g. `"Athens"`,
  `"Munich"`, `"Moscow"`, `"Mexico City"`).

- country:

  Character.

- opening_ceremony, closing_ceremony:

  Date or `NA`. ISO-8601. `NA` for cancelled editions and a few early
  Games where Olympedia does not record exact dates.

- participants:

  Integer or `NA`. Olympedia's headline participant count. `NA` for
  cancelled editions.

- nocs:

  Integer or `NA`. Number of NOCs represented.

- medal_events:

  Integer or `NA`. Number of medal events.

- disciplines:

  Integer or `NA`. Number of distinct disciplines.

- notes:

  Character. Free-text edition notes (e.g. cancellation reasons,
  intercalated-Games status).

- source:

  Character. Olympedia URL.

## Source

<https://www.olympedia.org/>

## Examples

``` r
data(editions)
editions[, c("games", "city_local_latin", "city_english",
             "participants", "medal_events")]
#>          games         city_local_latin            city_english participants
#> 1  1896 Summer                   Athína                  Athens          176
#> 2  1900 Summer                    Paris                   Paris         1241
#> 3  1904 Summer                St. Louis               St. Louis          650
#> 4  1906 Summer                   Athína                  Athens          841
#> 5  1908 Summer                   London                  London         2024
#> 6  1912 Summer                Stockholm               Stockholm         2409
#> 7  1916 Summer                   Berlin                  Berlin           NA
#> 8  1920 Summer                Antwerpen                 Antwerp         2680
#> 9  1924 Summer                    Paris                   Paris         3255
#> 10 1924 Winter                 Chamonix                Chamonix          312
#> 11 1928 Summer                Amsterdam               Amsterdam         3296
#> 12 1928 Winter               St. Moritz              St. Moritz          458
#> 13 1932 Summer              Los Angeles             Los Angeles         1924
#> 14 1932 Winter              Lake Placid             Lake Placid          241
#> 15 1936 Summer                   Berlin                  Berlin         4483
#> 16 1936 Winter   Garmisch-Partenkirchen  Garmisch-Partenkirchen          669
#> 17 1940 Summer                 Helsinki                Helsinki           NA
#> 18 1940 Winter   Garmisch-Partenkirchen  Garmisch-Partenkirchen           NA
#> 19 1944 Summer                   London                  London           NA
#> 20 1944 Winter        Cortina d'Ampezzo       Cortina d'Ampezzo           NA
#> 21 1948 Summer                   London                  London         4421
#> 22 1948 Winter               St. Moritz              St. Moritz          667
#> 23 1952 Summer                 Helsinki                Helsinki         4932
#> 24 1952 Winter                     Oslo                    Oslo          693
#> 25 1956 Summer                Melbourne               Melbourne         3190
#> 26 1956 Summer                Stockholm               Stockholm          158
#> 27 1956 Winter        Cortina d'Ampezzo       Cortina d'Ampezzo          822
#> 28 1960 Summer                     Roma                    Rome         5348
#> 29 1960 Winter             Squaw Valley            Squaw Valley          665
#> 30 1964 Summer                    Tokyo                   Tokyo         5137
#> 31 1964 Winter                Innsbruck               Innsbruck         1094
#> 32 1968 Summer         Ciudad de México             Mexico City         5558
#> 33 1968 Winter                 Grenoble                Grenoble         1160
#> 34 1972 Summer                  München                  Munich         7114
#> 35 1972 Winter                  Sapporo                 Sapporo         1005
#> 36 1976 Summer                 Montréal                Montreal         6073
#> 37 1976 Winter                Innsbruck               Innsbruck         1129
#> 38 1980 Summer                   Moskva                  Moscow         5255
#> 39 1980 Winter              Lake Placid             Lake Placid         1072
#> 40 1984 Summer              Los Angeles             Los Angeles         6800
#> 41 1984 Winter                 Sarajevo                Sarajevo         1273
#> 42 1988 Summer                    Seoul                   Seoul         8453
#> 43 1988 Winter                  Calgary                 Calgary         1424
#> 44 1992 Summer                Barcelona               Barcelona         9385
#> 45 1992 Winter              Albertville             Albertville         1801
#> 46 1994 Winter              Lillehammer             Lillehammer         1738
#> 47 1996 Summer                  Atlanta                 Atlanta        10340
#> 48 1998 Winter                   Nagano                  Nagano         2180
#> 49 2000 Summer                   Sydney                  Sydney        10647
#> 50 2002 Winter           Salt Lake City          Salt Lake City         2399
#> 51 2004 Summer                   Athína                  Athens        10557
#> 52 2006 Winter                   Torino                   Turin         2494
#> 53 2008 Summer                  Beijing                 Beijing        10899
#> 54 2010 Winter                Vancouver               Vancouver         2536
#> 55 2012 Summer                   London                  London        10518
#> 56 2014 Winter                    Sochi                   Sochi         2747
#> 57 2016 Summer           Rio de Janeiro          Rio de Janeiro        11182
#> 58 2018 Winter              PyeongChang             PyeongChang         2793
#> 59 2020 Summer                    Tokyo                   Tokyo        11319
#> 60 2022 Winter                  Beijing                 Beijing         2786
#> 61 2024 Summer                    Paris                   Paris        10763
#> 62 2026 Winter Milano-Cortina d'Ampezzo Milan-Cortina d'Ampezzo         2807
#>    medal_events
#> 1            43
#> 2            95
#> 3            95
#> 4            74
#> 5           110
#> 6           107
#> 7            NA
#> 8           162
#> 9           131
#> 10           17
#> 11          125
#> 12           14
#> 13          131
#> 14           14
#> 15          149
#> 16           17
#> 17           NA
#> 18           NA
#> 19           NA
#> 20           NA
#> 21          153
#> 22           22
#> 23          149
#> 24           22
#> 25          145
#> 26            6
#> 27           24
#> 28          150
#> 29           27
#> 30          163
#> 31           34
#> 32          172
#> 33           35
#> 34          195
#> 35           35
#> 36          198
#> 37           37
#> 38          203
#> 39           38
#> 40          221
#> 41           39
#> 42          237
#> 43           46
#> 44          257
#> 45           57
#> 46           61
#> 47          271
#> 48           68
#> 49          300
#> 50           78
#> 51          301
#> 52           84
#> 53          302
#> 54           86
#> 55          303
#> 56           98
#> 57          306
#> 58          102
#> 59          339
#> 60          109
#> 61          329
#> 62          116
```
