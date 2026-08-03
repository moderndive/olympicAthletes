# olympicAthletes

A tidy R data package covering every athlete-event participation in the
modern Olympic Games, **Athens 1896 through Milano-Cortina 2026** —
about 315,000 rows.

## Installation

Install the released version from CRAN:

``` r

install.packages("olympicAthletes")
```

Or the development version from GitHub:

``` r

# install.packages("remotes")
remotes::install_github("moderndive/olympicAthletes")
```

## Datasets

``` r

library(olympicAthletes)

data(olympic_athletes)   # ~315,000 athlete-event rows, 1896-2026
data(medal_table)        # verified medal table for every edition, 1896-2026
data(editions)           # metadata for every Games, 1896-2026

# Convenience subsets of olympic_athletes (same 16 columns)
data(athletics_athletes)       # sport == "Athletics"
data(gymnastics_athletes)      # sport == "Gymnastics"
data(basketball_athletes)      # sport == "Basketball"
data(volleyball_athletes)      # sport == "Volleyball"
data(curling_athletes)         # sport == "Curling"
data(olympic_athletes_2024)    # Paris 2024 Summer Games only
data(team_sport_athletes)      # Basketball + Volleyball + Curling
data(art_competitions_athletes)  # the 1912-1948 Art Competitions entrants
data(usa_summer_medals)        # medal_table rows: USA at each Summer Games

# Pre-counted summaries for plotting examples
data(paris_2024_top_medals)    # top-10 countries x Gold/Silver/Bronze (long format)
data(season_counts)            # athlete-event rows per season (2 rows)

?olympic_athletes
```

| Dataset | Rows | Description |
|----|---:|----|
| `olympic_athletes` | 315,094 | One row per (athlete, Games, event). 16 columns. |
| `medal_table` | 1,929 | One row per (Games, NOC) with Gold/Silver/Bronze counts. |
| `editions` | 62 | Year, season, host city, dates, participant counts. Includes cancelled Games. |
| `athletics_athletes` | 43,062 | Subset of `olympic_athletes` where `sport == "Athletics"`. |
| `gymnastics_athletes` | 29,413 | Subset where `sport == "Gymnastics"`. |
| `basketball_athletes` | 5,159 | Subset where `sport == "Basketball"`. |
| `volleyball_athletes` | 4,792 | Subset where `sport == "Volleyball"`. |
| `curling_athletes` | 961 | Subset where `sport == "Curling"`. |
| `olympic_athletes_2024` | 13,660 | Subset where `year == 2024 & season == "Summer"` (Paris 2024). |
| `team_sport_athletes` | 10,912 | Subset where `sport` is Basketball, Volleyball, or Curling. |
| `art_competitions_athletes` | 3,578 | Subset where `sport == "Art Competitions"` (1912–1948). |
| `usa_summer_medals` | 30 | `medal_table` rows for the USA at each Summer Games attended. |
| `paris_2024_top_medals` | 30 | Top-10 countries by total medals at Paris 2024, long format (`country`, `noc`, `medal`, `count`). For barplot examples. |
| `season_counts` | 2 | Athlete-event rows per season (Summer/Winter), pre-counted for `geom_col()` examples. |

`olympic_athletes` extends the original
[rgriff23/Olympic_history](https://github.com/rgriff23/Olympic_history)
dataset. Column names are lowercase snake_case (e.g. `noc`, `medal`)
rather than the upstream TitleCase, and the host-city column has been
split into `city_local_latin` and `city_english`. `city_local_latin`
always uses the Latin alphabet — non-Latin-script cities are romanized
(`"Moskva"`, `"Tokyo"`, `"Beijing"`, `"PyeongChang"`), not rendered in
their native script.

## Provenance

Rows for 1896-2016 come from the rgriff23 dataset (originally scraped
from sports-reference.com). Rows for 2018-2026 were scraped from
[olympedia.org](https://www.olympedia.org/) using the pipeline in the
[olympic-moderndive-data](https://github.com/ismayc/olympic-moderndive-data)
repository. See `data-raw/DATASET.R` for the reproducible build.

## Caveats

- **Medal counts are per-player, not per-team-event.** A team gold
  (e.g. Ice Hockey Men) produces one `medal = "Gold"` row per roster
  member. Group by `medal` and `noc` and divide team-event medals by
  team size to reproduce the IOC medal table — or use the `medal_table`
  companion dataset which uses the IOC convention.
- **Bio coverage:** as of the v0.4.0 bio refresh, `age` is ~100%
  complete for all five 2018-2026 editions. `height`/`weight` coverage
  ranges from _(96%/)93% for 2018 Winter down to _(34%/)29% for Paris
  2024 — highest for Winter team sports (Ice Hockey rosters are
  near-complete on olympedia) and lowest for the largest, most-recent
  Summer Games, where olympedia simply hasn’t published measurements for
  many athletes — same pattern as in the original 1896-2016 source.

## License

CC BY 4.0. Please cite this package, the rgriff23 source, and Olympedia.

## Citation

Run `citation("olympicAthletes")` for citations that always reflect your
installed package version. It renders three entries — the package itself
plus its two upstream data sources:

    Ismay C (2026). olympicAthletes: Olympic Athlete Event Data, Athens
    1896 to Milano-Cortina 2026. R package version 0.5.9,
    <https://moderndive.github.io/olympicAthletes/>.

    Griffin R (2018). "Olympic history: longitudinal data scraped from
    sports-reference.com." <https://github.com/rgriff23/Olympic_history>.

    OlyMADMen (2026). "Olympedia." <https://www.olympedia.org/>.
