# olympicAthletes 0.5.2

* Recovered missing `noc`/`team` (country) values: rows where the country was
  unknown but the same athlete (`id`) appears in another Games with a known
  country are now backfilled (unambiguous cases only). Reduces `NA` `noc` from
  10,094 to 3,907 rows; the rest are athletes who never appear with any known
  country, or who competed for more than one NOC, and are deliberately left `NA`.

# olympicAthletes 0.5.1

* New dataset `paris_2024_top_medals`: the ten countries that won the most total
  medals at the Paris 2024 Summer Games, in long format (one row per
  country-and-medal-type: `country`, `noc`, `medal`, `count`). A small, tidy
  dataset built for barplot examples (stacked, dodged, proportional) without
  filtering the ~90 medal-winning nations in `medal_table`.

# olympicAthletes 0.5.0

* New single-Games convenience datasets: `olympic_athletes_2024` (Paris 2024
  Summer Games) and `olympic_athletes_1960` (Rome 1960 Summer Games). The 2024
  subset is small enough to show over-plotting in a `height` vs `weight`
  scatterplot without the full dataset's scale; paired with the near-complete
  1960 subset it supports generational comparisons of athlete physiques. Both
  have columns identical to `olympic_athletes`.

# olympicAthletes 0.4.0

* New convenience datasets: `athletics_athletes`, `gymnastics_athletes`, and
  `basketball_athletes` (single-sport subsets of `olympic_athletes`), plus
  `recent_olympic_athletes` (Games since 2000, `year >= 2000`). These let
  teaching examples focus on one sport or recent Games without a `filter()`.
  Columns are identical to `olympic_athletes`.
* `olympic_athletes` bio coverage substantially improved for the five
  olympedia-scraped editions (2018-2026). Team-event and multi-athlete-row
  athletes (Ice Hockey, Curling, Bobsleigh, Football, Hockey, Rowing,
  relays, doubles, pairs, …) previously had no `age` and mostly no
  `height`/`weight`; these bios have now been fetched from olympedia.
  `age` is now ~100% complete across all five editions, and `height`/
  `weight` coverage rose accordingly (e.g. 2018 Winter height ~81% -> ~96%,
  Paris 2024 ~24% -> ~34%). The refresh is purely additive — row count,
  athlete roster, and medal counts are unchanged.
* `editions`: Tokyo 2020 `participants` corrected 11,319 -> 11,318 to match
  olympedia's revised count.

# olympicAthletes 0.3.0

* **Breaking:** all `olympic_athletes` columns are now lowercase
  snake_case (`id`, `name`, `sex`, `age`, `height`, `weight`, `team`,
  `noc`, `games`, `year`, `season`, `sport`, `event`, `medal`),
  matching the convention already used by `medal_table` and `editions`.
  The upstream rgriff23 TitleCase headers (`ID`, `Name`, `NOC`, …) are
  no longer preserved.
* Host-city columns now come in both local-language and English forms.
  In `olympic_athletes`, the `City` column has been replaced by
  `city_local_latin` and `city_english`. In `editions`, `city` has been
  replaced by `city_local_latin` and `city_english`.
  `city_local_latin` always uses the Latin alphabet — Latin-script
  names keep their native diacritics (`"Athína"`, `"München"`,
  `"Montréal"`, `"Ciudad de México"`) and non-Latin-script names use a
  standard romanization (`"Moskva"`, `"Tokyo"`, `"Beijing"`,
  `"PyeongChang"`) rather than the city's native script.

# olympicAthletes 0.2.0

* `medal_table` now covers every Olympic edition from Athens 1896 through
  Milano-Cortina 2026 (1,929 rows, up from 273). Two new columns:
  `edition_id` (Olympedia's internal edition number) and `notes`.
* `editions` now covers every Olympic edition from Athens 1896 through
  Milano-Cortina 2026, including cancelled Games (62 rows, up from 5).

# olympicAthletes 0.1.0

Initial release.

* `olympic_athletes` — 314,749 athlete-event rows spanning Athens 1896 to
  Milano-Cortina 2026, extending the rgriff23 `Olympic_history` dataset
  (1896-2016) with five additional editions scraped from
  [olympedia.org](https://www.olympedia.org/).
* `medal_table` — 273-row verified medal table for the five new editions
  (2018, 2020, 2022, 2024, 2026), with one row per (Games, NOC).
* `editions` — 5-row metadata table covering opening/closing dates,
  participants, NOC count, medal events, and disciplines for each
  new edition.
