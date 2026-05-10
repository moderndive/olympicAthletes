# Olympic athlete-event participations, 1896-2026

One row per (athlete, Games, event) participation across every modern
Summer and Winter Olympic Games from Athens 1896 through Milano-Cortina
2026. Rows for 1896-2016 come from the rgriff23 *Olympic_history*
dataset (originally scraped from sports-reference.com); rows for
2018-2026 were scraped from [olympedia.org](https://www.olympedia.org/).

## Usage

``` r
olympic_athletes
```

## Format

A data frame with 315,090 rows and 16 variables:

- id:

  Integer. Unique athlete ID. Original IDs are 1..135571; athletes new
  to the 2018-2026 editions get IDs starting at 1,000,000 to avoid
  collision.

- name:

  Character. ASCII-folded athlete name.

- sex:

  Character. `"M"` or `"F"`.

- age:

  Integer or `NA`. Approximate age at the start of the Games, computed
  from date of birth (Feb 1 reference for Winter, Jul 15 for Summer).

- height:

  Numeric or `NA`. Height in centimetres.

- weight:

  Numeric or `NA`. Weight in kilograms.

- team:

  Character. Country/team name as displayed on the source.

- noc:

  Character. Three-letter IOC code (e.g. `"USA"`, `"NOR"`, `"ROC"`).

- games:

  Character. `"<year> <Summer/Winter>"`, e.g. `"2026 Winter"`.

- year:

  Integer. Calendar year of the Games. Tokyo 2020 is coded as 2020 even
  though it was held in 2021 (IOC convention).

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

- sport:

  Character. Sport name. The 2018-2026 rows are normalised to the
  original sport names where possible (e.g. `"Cycling Track"` and
  `"Cycling Road"` both collapse to `"Cycling"`).

- event:

  Character. Event name including the sport prefix.

- medal:

  Character or `NA`. `"Gold"`, `"Silver"`, `"Bronze"`, or `NA`.
  **Per-player**: every member of a medal-winning team roster gets a row
  with the team's medal.

## Source

- 1896-2016: Griffin, R. (2018). Olympic_history.
  <https://github.com/rgriff23/Olympic_history>

- 2018-2026: <https://www.olympedia.org/> (scraped April 2026).

## Examples

``` r
data(olympic_athletes)
head(olympic_athletes)
#>      id                       name sex age height weight          team noc
#> 1 12068       Arthur Charles Blake   M  24     NA     NA United States USA
#> 2 35094             Angelos Fetsis   M  NA     NA     NA        Greece GRE
#> 3 35698 Edwin Harold "Teddy" Flack   M  22     NA     NA     Australia AUS
#> 4 38123                 Carl Galle   M  23    154     45       Germany GER
#> 5 41160       Dimitrios P. Golemis   M  21     NA     NA        Greece GRE
#> 6 57441  Konstantinos Karakatsanis   M  NA     NA     NA        Greece GRE
#>         games year season city_local_latin city_english     sport
#> 1 1896 Summer 1896 Summer           Athína       Athens Athletics
#> 2 1896 Summer 1896 Summer           Athína       Athens Athletics
#> 3 1896 Summer 1896 Summer           Athína       Athens Athletics
#> 4 1896 Summer 1896 Summer           Athína       Athens Athletics
#> 5 1896 Summer 1896 Summer           Athína       Athens Athletics
#> 6 1896 Summer 1896 Summer           Athína       Athens Athletics
#>                          event  medal
#> 1 Athletics Men's 1,500 metres Silver
#> 2 Athletics Men's 1,500 metres   <NA>
#> 3 Athletics Men's 1,500 metres   Gold
#> 4 Athletics Men's 1,500 metres   <NA>
#> 5 Athletics Men's 1,500 metres   <NA>
#> 6 Athletics Men's 1,500 metres   <NA>
table(olympic_athletes$year, olympic_athletes$season)
#>       
#>        Summer Winter
#>   1896    380      0
#>   1900   1936      0
#>   1904   1301      0
#>   1906   1733      0
#>   1908   3101      0
#>   1912   4040      0
#>   1920   4292      0
#>   1924   5233    460
#>   1928   4992    582
#>   1932   2969    352
#>   1936   6506    895
#>   1948   6405   1075
#>   1952   8270   1088
#>   1956   5127   1307
#>   1960   8119   1116
#>   1964   7702   1778
#>   1968   8588   1891
#>   1972  10304   1655
#>   1976   8641   1861
#>   1980   7191   1746
#>   1984   9454   2134
#>   1988  12037   2639
#>   1992  12977   3436
#>   1994      0   3160
#>   1996  13780      0
#>   1998      0   3605
#>   2000  13821      0
#>   2002      0   4109
#>   2004  13443      0
#>   2006      0   4382
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

if (FALSE) { # \dontrun{
  # Top medal-winning NOCs at Paris 2024 (one row per athlete-medal)
  library(dplyr)
  olympic_athletes |>
    filter(year == 2024, !is.na(medal)) |>
    count(noc, medal) |>
    tidyr::pivot_wider(names_from = medal, values_from = n, values_fill = 0) |>
    arrange(desc(Gold + Silver + Bronze))
} # }
```
