# Olympic Art Competitions entries, 1912-1948

The subset of
[`olympic_athletes`](https://moderndive.github.io/olympicAthletes/reference/olympic_athletes.md)
with `sport == "Art Competitions"`: the painters, sculptors, writers,
musicians, and architects who won Olympic medals when the arts were
medal events. A convenience dataset for exploring how these entrants
differ from athletic competitors (notably in `age`). Columns are
identical to `olympic_athletes`.

## Usage

``` r
art_competitions_athletes
```

## Format

A data frame with 3,578 rows and 16 variables; see
[`olympic_athletes`](https://moderndive.github.io/olympicAthletes/reference/olympic_athletes.md)
for the full column descriptions.

## Source

See
[`olympic_athletes`](https://moderndive.github.io/olympicAthletes/reference/olympic_athletes.md).

## Examples

``` r
data(art_competitions_athletes)
head(art_competitions_athletes)
#>         id                                             name sex age height
#> 8452 22441                                      Andr Collin   M  NA     NA
#> 8453 31292                                     Fritz Eccard   M  NA     NA
#> 8454 34229                                  Guillaume Fatio   M  46     NA
#> 8455 48741                               Konrad Hippenmeier   M  31     NA
#> 8456 56023 Calixte Raphal Ferdinand Marie "Frantz" Jourdain   M  64     NA
#> 8457 65813                                        A. Laffen   M  NA     NA
#>      weight        team noc       games year season city_local_latin
#> 8452     NA     Belgium BEL 1912 Summer 1912 Summer        Stockholm
#> 8453     NA     Unknown UNK 1912 Summer 1912 Summer        Stockholm
#> 8454     NA Switzerland SUI 1912 Summer 1912 Summer        Stockholm
#> 8455     NA Switzerland SUI 1912 Summer 1912 Summer        Stockholm
#> 8456     NA      France FRA 1912 Summer 1912 Summer        Stockholm
#> 8457     NA     Unknown UNK 1912 Summer 1912 Summer        Stockholm
#>      city_english            sport                               event medal
#> 8452    Stockholm Art Competitions Art Competitions Mixed Architecture  <NA>
#> 8453    Stockholm Art Competitions Art Competitions Mixed Architecture  <NA>
#> 8454    Stockholm Art Competitions Art Competitions Mixed Architecture  <NA>
#> 8455    Stockholm Art Competitions Art Competitions Mixed Architecture  <NA>
#> 8456    Stockholm Art Competitions Art Competitions Mixed Architecture  <NA>
#> 8457    Stockholm Art Competitions Art Competitions Mixed Architecture  <NA>
```
