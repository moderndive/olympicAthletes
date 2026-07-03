# Athlete-event rows per Olympic season, pre-counted

A tiny pre-counted table: one row per Olympic season (Summer/Winter)
with the number of athlete-event rows in
[`olympic_athletes`](https://moderndive.github.io/olympicAthletes/reference/olympic_athletes.md)
for that season. Added so plotting exercises can contrast `geom_bar()`
(counts raw rows for you) with `geom_col()` (plots pre-counted values)
without introducing base R counting code.

## Usage

``` r
season_counts
```

## Format

A data frame with 2 rows and 2 variables:

- season:

  Factor. `"Summer"` or `"Winter"`.

- n:

  Integer. Number of athlete-event rows in
  [`olympic_athletes`](https://moderndive.github.io/olympicAthletes/reference/olympic_athletes.md)
  for that season.

## Source

Derived from
[`olympic_athletes`](https://moderndive.github.io/olympicAthletes/reference/olympic_athletes.md)
(one count per season).

## Examples

``` r
data(season_counts)
season_counts
#>   season      n
#> 1 Summer 250747
#> 2 Winter  64347
```
