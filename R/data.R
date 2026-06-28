#' Olympic athlete-event participations, 1896-2026
#'
#' One row per (athlete, Games, event) participation across every modern
#' Summer and Winter Olympic Games from Athens 1896 through Milano-Cortina
#' 2026. Rows for 1896-2016 come from the rgriff23 \emph{Olympic_history}
#' dataset (originally scraped from sports-reference.com); rows for
#' 2018-2026 were scraped from \href{https://www.olympedia.org/}{olympedia.org}.
#'
#' @format A data frame with 315,094 rows and 16 variables:
#' \describe{
#'   \item{id}{Integer. Unique athlete ID. Original IDs are 1..135571;
#'     athletes new to the 2018-2026 editions get IDs starting at
#'     1,000,000 to avoid collision.}
#'   \item{name}{Character. ASCII-folded athlete name.}
#'   \item{sex}{Character. \code{"M"} or \code{"F"}.}
#'   \item{age}{Integer or \code{NA}. Approximate age at the start of the
#'     Games, computed from date of birth (Feb 1 reference for Winter,
#'     Jul 15 for Summer).}
#'   \item{height}{Numeric or \code{NA}. Height in centimetres.}
#'   \item{weight}{Numeric or \code{NA}. Weight in kilograms.}
#'   \item{team}{Character. Country/team name as displayed on the source.}
#'   \item{noc}{Character. Three-letter IOC code (e.g. \code{"USA"},
#'     \code{"NOR"}, \code{"ROC"}).}
#'   \item{games}{Character. \code{"<year> <Summer/Winter>"}, e.g.
#'     \code{"2026 Winter"}.}
#'   \item{year}{Integer. Calendar year of the Games. Tokyo 2020 is
#'     coded as 2020 even though it was held in 2021 (IOC convention).}
#'   \item{season}{Character. \code{"Summer"} or \code{"Winter"}.}
#'   \item{city_local_latin}{Character. Host city in the local-language
#'     form rendered in the Latin alphabet — i.e. native Latin-script
#'     names retain their diacritics (\code{"Athína"}, \code{"München"},
#'     \code{"Montréal"}, \code{"Ciudad de México"}), and non-Latin-script
#'     names use a standard romanization rather than the city's native
#'     script (\code{"Moskva"} not \code{"Москва"}, \code{"Tokyo"} not
#'     \code{"東京"}, \code{"Beijing"} not \code{"北京"},
#'     \code{"PyeongChang"} not \code{"평창"}). The column is therefore
#'     \emph{always} ASCII-or-Latin-1 and never contains the city's
#'     native non-Latin alphabet.}
#'   \item{city_english}{Character. Common English name of the host city
#'     (e.g. \code{"Athens"}, \code{"Munich"}, \code{"Moscow"},
#'     \code{"Mexico City"}).}
#'   \item{sport}{Character. Sport name. The 2018-2026 rows are normalised
#'     to the original sport names where possible (e.g. \code{"Cycling Track"}
#'     and \code{"Cycling Road"} both collapse to \code{"Cycling"}).}
#'   \item{event}{Character. Event name including the sport prefix.}
#'   \item{medal}{Character or \code{NA}. \code{"Gold"}, \code{"Silver"},
#'     \code{"Bronze"}, or \code{NA}. \strong{Per-player}: every member of
#'     a medal-winning team roster gets a row with the team's medal.}
#' }
#'
#' @source
#' \itemize{
#'   \item 1896-2016: Griffin, R. (2018). Olympic_history.
#'     \url{https://github.com/rgriff23/Olympic_history}
#'   \item 2018-2026: \url{https://www.olympedia.org/} (scraped April 2026).
#' }
#'
#' @examples
#' data(olympic_athletes)
#' head(olympic_athletes)
#' table(olympic_athletes$year, olympic_athletes$season)
#'
#' \dontrun{
#'   # Top medal-winning NOCs at Paris 2024 (one row per athlete-medal)
#'   library(dplyr)
#'   olympic_athletes |>
#'     filter(year == 2024, !is.na(medal)) |>
#'     count(noc, medal) |>
#'     tidyr::pivot_wider(names_from = medal, values_from = n, values_fill = 0) |>
#'     arrange(desc(Gold + Silver + Bronze))
#' }
"olympic_athletes"


#' Verified medal tables for every Olympic edition, 1896-2026
#'
#' One row per (Games, NOC) with verified Gold/Silver/Bronze counts cross-
#' checked against olympedia.org and Wikipedia/IOC. Use this rather than
#' aggregating \code{olympic_athletes} when you want the per-team-event
#' medal convention (one medal per gold-winning ice hockey team, not 25).
#'
#' @format A data frame with 1,929 rows and 11 variables:
#' \describe{
#'   \item{edition_id}{Integer. Olympedia's internal edition number.}
#'   \item{games}{Character. e.g. \code{"2026 Winter"}.}
#'   \item{year}{Integer.}
#'   \item{season}{Character. \code{"Summer"} or \code{"Winter"}.}
#'   \item{noc}{Character. Three-letter IOC code.}
#'   \item{country}{Character. Full country/team name.}
#'   \item{gold, silver, bronze}{Integer. Medal counts.}
#'   \item{total}{Integer. Sum of the three.}
#'   \item{notes}{Character. Free-text notes (e.g. shared medals,
#'     post-hoc reallocations).}
#' }
#'
#' @source \url{https://www.olympedia.org/} (manually verified per edition).
#'
#' @examples
#' data(medal_table)
#' subset(medal_table, year == 2024)[1:10, ]
"medal_table"


#' Edition-level metadata for every Olympic Games, 1896-2026
#'
#' One row per Olympic edition (including cancelled Games) with verified
#' totals for participants, NOCs, medal events, and disciplines, plus
#' opening/closing ceremony dates.
#'
#' @format A data frame with 62 rows and 15 variables:
#' \describe{
#'   \item{edition_id}{Integer. Olympedia's internal edition number.}
#'   \item{games}{Character. e.g. \code{"2024 Summer"}.}
#'   \item{year}{Integer.}
#'   \item{season}{Character. \code{"Summer"} or \code{"Winter"}.}
#'   \item{city_local_latin}{Character. Host city in the local-language
#'     form rendered in the Latin alphabet — i.e. native Latin-script
#'     names retain their diacritics (\code{"Athína"}, \code{"München"},
#'     \code{"Montréal"}, \code{"Ciudad de México"}), and non-Latin-script
#'     names use a standard romanization rather than the city's native
#'     script (\code{"Moskva"} not \code{"Москва"}, \code{"Tokyo"} not
#'     \code{"東京"}, \code{"Beijing"} not \code{"北京"},
#'     \code{"PyeongChang"} not \code{"평창"}). The column is therefore
#'     \emph{always} ASCII-or-Latin-1 and never contains the city's
#'     native non-Latin alphabet.}
#'   \item{city_english}{Character. Common English name of the host city
#'     (e.g. \code{"Athens"}, \code{"Munich"}, \code{"Moscow"},
#'     \code{"Mexico City"}).}
#'   \item{country}{Character.}
#'   \item{opening_ceremony, closing_ceremony}{Date or \code{NA}. ISO-8601.
#'     \code{NA} for cancelled editions and a few early Games where
#'     Olympedia does not record exact dates.}
#'   \item{participants}{Integer or \code{NA}. Olympedia's headline
#'     participant count. \code{NA} for cancelled editions.}
#'   \item{nocs}{Integer or \code{NA}. Number of NOCs represented.}
#'   \item{medal_events}{Integer or \code{NA}. Number of medal events.}
#'   \item{disciplines}{Integer or \code{NA}. Number of distinct disciplines.}
#'   \item{notes}{Character. Free-text edition notes (e.g. cancellation
#'     reasons, intercalated-Games status).}
#'   \item{source}{Character. Olympedia URL.}
#' }
#'
#' @source \url{https://www.olympedia.org/}
#'
#' @examples
#' data(editions)
#' editions[, c("games", "city_local_latin", "city_english",
#'               "participants", "medal_events")]
"editions"


#' Olympic athletics (track and field) athlete-event participations, 1896-2026
#'
#' The subset of \code{\link{olympic_athletes}} with \code{sport == "Athletics"}.
#' A convenience dataset so examples can focus on a single sport without first
#' filtering. Columns are identical to \code{olympic_athletes}.
#'
#' @format A data frame with 43,062 rows and 16 variables; see
#'   \code{\link{olympic_athletes}} for the full column descriptions.
#'
#' @source See \code{\link{olympic_athletes}}.
#'
#' @examples
#' data(athletics_athletes)
#' head(athletics_athletes)
"athletics_athletes"


#' Olympic gymnastics athlete-event participations, 1896-2026
#'
#' The subset of \code{\link{olympic_athletes}} with \code{sport == "Gymnastics"}.
#' A convenience dataset so examples can focus on a single sport without first
#' filtering. Columns are identical to \code{olympic_athletes}.
#'
#' @format A data frame with 29,413 rows and 16 variables; see
#'   \code{\link{olympic_athletes}} for the full column descriptions.
#'
#' @source See \code{\link{olympic_athletes}}.
#'
#' @examples
#' data(gymnastics_athletes)
#' head(gymnastics_athletes)
"gymnastics_athletes"


#' Olympic basketball athlete-event participations, 1896-2026
#'
#' The subset of \code{\link{olympic_athletes}} with \code{sport == "Basketball"}.
#' A convenience dataset so examples can focus on a single sport without first
#' filtering. Columns are identical to \code{olympic_athletes}.
#'
#' @format A data frame with 5,159 rows and 16 variables; see
#'   \code{\link{olympic_athletes}} for the full column descriptions.
#'
#' @source See \code{\link{olympic_athletes}}.
#'
#' @examples
#' data(basketball_athletes)
#' head(basketball_athletes)
"basketball_athletes"


#' Recent Olympic athlete-event participations, 2000-2026
#'
#' The subset of \code{\link{olympic_athletes}} with \code{year >= 2000}
#' (Sydney 2000 onward). Smaller and less over-plotted than the full dataset,
#' which makes it handy for scatterplot examples. Columns are identical to
#' \code{olympic_athletes}.
#'
#' @format A data frame with 129,236 rows and 16 variables; see
#'   \code{\link{olympic_athletes}} for the full column descriptions.
#'
#' @source See \code{\link{olympic_athletes}}.
#'
#' @examples
#' data(recent_olympic_athletes)
#' head(recent_olympic_athletes)
"recent_olympic_athletes"


#' Olympic athlete-event participations at the Paris 2024 Summer Games
#'
#' The subset of \code{\link{olympic_athletes}} from the Paris 2024 Summer
#' Games (\code{year == 2024 & season == "Summer"}). A single-Games convenience
#' dataset: small enough that a \code{height} vs \code{weight} scatterplot shows
#' over-plotting without the multi-hundred-thousand-row scale of the full data,
#' and no \code{filter()} is required. Note that bio data (height/weight) is
#' missing for many recent athletes, so roughly a third of rows have complete
#' \code{height} and \code{weight}. Columns are identical to
#' \code{olympic_athletes}.
#'
#' @format A data frame with 13,660 rows and 16 variables; see
#'   \code{\link{olympic_athletes}} for the full column descriptions.
#'
#' @source See \code{\link{olympic_athletes}}.
#'
#' @seealso \code{\link{olympic_athletes_1960}} for the same data a generation
#'   earlier (Rome 1960), useful for comparing athlete physiques over time.
#'
#' @examples
#' data(olympic_athletes_2024)
#' head(olympic_athletes_2024)
"olympic_athletes_2024"


#' Olympic athlete-event participations at the Rome 1960 Summer Games
#'
#' The subset of \code{\link{olympic_athletes}} from the Rome 1960 Summer Games
#' (\code{year == 1960 & season == "Summer"}). Paired with
#' \code{\link{olympic_athletes_2024}}, it supports generational comparisons of
#' athlete physiques across roughly a human lifetime. Unlike the most recent
#' Games, the 1960 Games have near-complete height/weight coverage (~94\% of
#' rows), so it is well suited to body-size comparisons. Columns are identical
#' to \code{olympic_athletes}.
#'
#' @format A data frame with 8,119 rows and 16 variables; see
#'   \code{\link{olympic_athletes}} for the full column descriptions.
#'
#' @source See \code{\link{olympic_athletes}}.
#'
#' @seealso \code{\link{olympic_athletes_2024}} for the same Games a generation
#'   later (Paris 2024).
#'
#' @examples
#' data(olympic_athletes_1960)
#' head(olympic_athletes_1960)
"olympic_athletes_1960"


#' Top-10 countries by medals at the Paris 2024 Summer Olympics
#'
#' A small, tidy summary of the ten countries that won the most total medals at
#' the Paris 2024 Summer Games, in long format with one row per
#' country-and-medal-type. Built for barplot examples: ten ordered categories
#' (rather than the ~90 medal-winning nations in \code{\link{medal_table}}) plus
#' a \code{medal} fill variable, so stacked, dodged, and proportional barplots
#' all read cleanly without any filtering.
#'
#' @format A data frame with 30 rows (10 countries x 3 medal types) and 4
#'   variables:
#' \describe{
#'   \item{country}{Factor. Country/NOC name, levels ordered from the most to
#'     the fewest total medals (United States first).}
#'   \item{noc}{Character. Three-letter IOC code (e.g. \code{"USA"}, \code{"CHN"}).}
#'   \item{medal}{Factor with levels \code{"Gold"}, \code{"Silver"}, \code{"Bronze"}.}
#'   \item{count}{Integer. Number of that medal type won by that country.}
#' }
#'
#' @source Derived from \code{\link{medal_table}} (games \code{"2024 Summer"}).
#'
#' @examples
#' data(paris_2024_top_medals)
#' head(paris_2024_top_medals)
"paris_2024_top_medals"
