# olympicAthletes 0.5.9

- Replace the `\dontrun{}` block in the `olympic_athletes` example with
  `@examplesIf`, so the dplyr/tidyr example runs whenever those Suggests
  packages are installed (per CRAN policy on runnable examples).
- `citation("olympicAthletes")` now returns all three entries the README
  promises: the package plus its two upstream data sources (the rgriff23
  'Olympic_history' dataset and Olympedia).
- Refresh the README and vignette dataset listings to cover all 14 shipped
  datasets (`volleyball_athletes`, `curling_athletes`, and `season_counts`
  were missing).
- Fix the PDF manual build on CRAN's win-builder (R-devel): the `editions` and
  `olympic_athletes` docs cited native-script host-city names (Cyrillic, CJK,
  and Hangul examples such as the native forms of Moskva, Tokyo, Beijing, and
  PyeongChang) that pdflatex cannot typeset. The docs now list only the
  romanized forms; Latin-1 diacritics (e.g. "Athína", "München") are retained.

# olympicAthletes 0.5.8

- **CRAN preparation.** No data changes — every dataset is retained. Brought the
  source tarball back under CRAN's 5 MB limit (5.13 MB -> 4.80 MB) by resizing
  the oversized `man/figures/logo.png` (885x1024, 512 KB -> 480 px, 184 KB); the
  full-resolution master is kept at the repo-root `hex.png`.
- Added `Language: en-US` and an `inst/WORDLIST` so `spelling::spell_check_package()`
  runs clean (the flagged words were all proper nouns and British spellings, not
  typos).
- Wrapped the Olympedia URL in `DESCRIPTION` with angle brackets and added a
  `cran-comments.md` for submission.
- `R CMD check --as-cran` now reports 0 errors, 0 warnings, and only the routine
  new-submission / CC-BY-license NOTE.

# olympicAthletes 0.5.7

- Add `season_counts` (2 rows): athlete-event row counts per Olympic season,
  pre-counted so plotting exercises can contrast `geom_bar()` (counts raw rows)
  with `geom_col()` (plots pre-counted values) without base-R counting code.

# olympicAthletes 0.5.6

- **Removed `olympic_athletes_2000_2026`** (1.4 MB — the second-largest file in
  the package) to bring the built package back under CRAN's 5 MB source-package
  guideline. It was a pure subset of `olympic_athletes`
  (`year >= 2000`); recreate it any time with
  `olympic_athletes |> filter(year >= 2000)`. The ModernDive exercises that
  used it now use `team_sport_athletes`, `athletics_athletes`, or an explicit
  `filter()`.
- **Removed `olympic_athletes_1960`** (referenced nowhere in the book,
  exercises, or teaching materials); recreate with
  `olympic_athletes |> filter(year == 1960, season == "Summer")`.

# olympicAthletes 0.5.5

- Add three exercise-support subsets so ModernDive Chapter 2 exercises (which
  predate dplyr) never need base-R subsetting workarounds: `usa_summer_medals`
  (30 rows — one per Summer Games the USA attended; note the boycotted 1980
  Games have no row), `art_competitions_athletes` (3,578 rows — the 1912-1948
  Art Competitions entrants), and `team_sport_athletes` (10,912 rows —
  Basketball, Volleyball, and Curling combined, for cross-group distribution
  comparisons).

# olympicAthletes 0.5.4

- Renamed `recent_olympic_athletes` to `olympic_athletes_2000_2026` for a clearer, time-explicit name. The data is unchanged (`year >= 2000`, i.e. the 2000–2026 Games).

# olympicAthletes 0.5.3

- Add `volleyball_athletes` (4,792 rows) and `curling_athletes` (961 rows) convenience subsets, parallel to the existing `basketball_athletes` / `gymnastics_athletes`, for ModernDive Chapter 5+ regression examples.

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
