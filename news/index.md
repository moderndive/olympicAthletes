# Changelog

## olympicAthletes 0.3.0

- **Breaking:** all `olympic_athletes` columns are now lowercase
  snake_case (`id`, `name`, `sex`, `age`, `height`, `weight`, `team`,
  `noc`, `games`, `year`, `season`, `sport`, `event`, `medal`), matching
  the convention already used by `medal_table` and `editions`. The
  upstream rgriff23 TitleCase headers (`ID`, `Name`, `NOC`, …) are no
  longer preserved.
- Host-city columns now come in both local-language and English forms.
  In `olympic_athletes`, the `City` column has been replaced by
  `city_local_latin` and `city_english`. In `editions`, `city` has been
  replaced by `city_local_latin` and `city_english`. `city_local_latin`
  always uses the Latin alphabet — Latin-script names keep their native
  diacritics (`"Athína"`, `"München"`, `"Montréal"`,
  `"Ciudad de México"`) and non-Latin-script names use a standard
  romanization (`"Moskva"`, `"Tokyo"`, `"Beijing"`, `"PyeongChang"`)
  rather than the city’s native script.

## olympicAthletes 0.2.0

- `medal_table` now covers every Olympic edition from Athens 1896
  through Milano-Cortina 2026 (1,929 rows, up from 273). Two new
  columns: `edition_id` (Olympedia’s internal edition number) and
  `notes`.
- `editions` now covers every Olympic edition from Athens 1896 through
  Milano-Cortina 2026, including cancelled Games (62 rows, up from 5).

## olympicAthletes 0.1.0

Initial release.

- `olympic_athletes` — 314,749 athlete-event rows spanning Athens 1896
  to Milano-Cortina 2026, extending the rgriff23 `Olympic_history`
  dataset (1896-2016) with five additional editions scraped from
  [olympedia.org](https://www.olympedia.org/).
- `medal_table` — 273-row verified medal table for the five new editions
  (2018, 2020, 2022, 2024, 2026), with one row per (Games, NOC).
- `editions` — 5-row metadata table covering opening/closing dates,
  participants, NOC count, medal events, and disciplines for each new
  edition.
