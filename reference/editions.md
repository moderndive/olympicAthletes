# Edition-level metadata for the five new Games (2018-2026)

One row per Olympic edition added to extend the original dataset, with
verified totals for participants, NOCs, medal events, and disciplines,
plus opening/closing ceremony dates.

## Usage

``` r
editions
```

## Format

A data frame with 5 rows and 14 variables:

- edition_id:

  Integer. Olympedia's internal edition number (60, 61, 62, 63, 72).

- games:

  Character. e.g. `"2024 Summer"`.

- year:

  Integer.

- season:

  Character.

- city:

  Character. Host city.

- country:

  Character.

- opening_ceremony, closing_ceremony:

  Date. ISO-8601.

- participants:

  Integer. Olympedia's headline participant count.

- nocs:

  Integer. Number of NOCs represented.

- medal_events:

  Integer. Number of medal events.

- disciplines:

  Integer. Number of distinct disciplines.

- notes:

  Character. Free-text edition notes.

- source:

  Character. Olympedia URL.

## Source

<https://www.olympedia.org/>

## Examples

``` r
data(editions)
editions[, c("games", "city", "participants", "medal_events")]
#>         games           city participants medal_events
#> 1 2018 Winter    PyeongChang         2793          102
#> 2 2020 Summer          Tokyo        11319          339
#> 3 2022 Winter        Beijing         2786          109
#> 4 2024 Summer          Paris        10763          329
#> 5 2026 Winter Milano-Cortina         2932          111
```
