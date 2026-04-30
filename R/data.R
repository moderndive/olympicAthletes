#' Olympic athlete-event participations, 1896-2026
#'
#' One row per (athlete, Games, event) participation across every modern
#' Summer and Winter Olympic Games from Athens 1896 through Milano-Cortina
#' 2026. Rows for 1896-2016 come from the rgriff23 \emph{Olympic_history}
#' dataset (originally scraped from sports-reference.com); rows for
#' 2018-2026 were scraped from \href{https://www.olympedia.org/}{olympedia.org}.
#'
#' @format A data frame with 314,749 rows and 15 variables:
#' \describe{
#'   \item{ID}{Integer. Unique athlete ID. Original IDs are 1..135571;
#'     athletes new to the 2018-2026 editions get IDs starting at
#'     1,000,000 to avoid collision.}
#'   \item{Name}{Character. ASCII-folded athlete name.}
#'   \item{Sex}{Character. \code{"M"} or \code{"F"}.}
#'   \item{Age}{Integer or \code{NA}. Approximate age at the start of the
#'     Games, computed from date of birth (Feb 1 reference for Winter,
#'     Jul 15 for Summer).}
#'   \item{Height}{Numeric or \code{NA}. Height in centimetres.}
#'   \item{Weight}{Numeric or \code{NA}. Weight in kilograms.}
#'   \item{Team}{Character. Country/team name as displayed on the source.}
#'   \item{NOC}{Character. Three-letter IOC code (e.g. \code{"USA"},
#'     \code{"NOR"}, \code{"ROC"}).}
#'   \item{Games}{Character. \code{"<year> <Summer/Winter>"}, e.g.
#'     \code{"2026 Winter"}.}
#'   \item{Year}{Integer. Calendar year of the Games. Tokyo 2020 is
#'     coded as 2020 even though it was held in 2021 (IOC convention).}
#'   \item{Season}{Character. \code{"Summer"} or \code{"Winter"}.}
#'   \item{City}{Character. Host city.}
#'   \item{Sport}{Character. Sport name. The 2018-2026 rows are normalised
#'     to the original sport names where possible (e.g. \code{"Cycling Track"}
#'     and \code{"Cycling Road"} both collapse to \code{"Cycling"}).}
#'   \item{Event}{Character. Event name including the sport prefix.}
#'   \item{Medal}{Character or \code{NA}. \code{"Gold"}, \code{"Silver"},
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
#' table(olympic_athletes$Year, olympic_athletes$Season)
#'
#' \dontrun{
#'   # Top medal-winning NOCs at Paris 2024 (one row per athlete-medal)
#'   library(dplyr)
#'   olympic_athletes |>
#'     filter(Year == 2024, !is.na(Medal)) |>
#'     count(NOC, Medal) |>
#'     tidyr::pivot_wider(names_from = Medal, values_from = n, values_fill = 0) |>
#'     arrange(desc(Gold + Silver + Bronze))
#' }
"olympic_athletes"


#' Verified medal tables for the 2018-2026 editions
#'
#' One row per (Games, NOC) with verified Gold/Silver/Bronze counts cross-
#' checked against olympedia.org and Wikipedia/IOC. Use this rather than
#' aggregating \code{olympic_athletes} when you want the per-team-event
#' medal convention (one medal per gold-winning ice hockey team, not 25).
#'
#' @format A data frame with 273 rows and 9 variables:
#' \describe{
#'   \item{games}{Character. e.g. \code{"2026 Winter"}.}
#'   \item{year}{Integer.}
#'   \item{season}{Character. \code{"Summer"} or \code{"Winter"}.}
#'   \item{noc}{Character. Three-letter IOC code.}
#'   \item{country}{Character. Full country/team name.}
#'   \item{gold, silver, bronze}{Integer. Medal counts.}
#'   \item{total}{Integer. Sum of the three.}
#' }
#'
#' @source \url{https://www.olympedia.org/} (manually verified per edition).
#'
#' @examples
#' data(medal_table)
#' subset(medal_table, year == 2024)[1:10, ]
"medal_table"


#' Edition-level metadata for the five new Games (2018-2026)
#'
#' One row per Olympic edition added to extend the original dataset, with
#' verified totals for participants, NOCs, medal events, and disciplines,
#' plus opening/closing ceremony dates.
#'
#' @format A data frame with 5 rows and 14 variables:
#' \describe{
#'   \item{edition_id}{Integer. Olympedia's internal edition number
#'     (60, 61, 62, 63, 72).}
#'   \item{games}{Character. e.g. \code{"2024 Summer"}.}
#'   \item{year}{Integer.}
#'   \item{season}{Character.}
#'   \item{city}{Character. Host city.}
#'   \item{country}{Character.}
#'   \item{opening_ceremony, closing_ceremony}{Date. ISO-8601.}
#'   \item{participants}{Integer. Olympedia's headline participant count.}
#'   \item{nocs}{Integer. Number of NOCs represented.}
#'   \item{medal_events}{Integer. Number of medal events.}
#'   \item{disciplines}{Integer. Number of distinct disciplines.}
#'   \item{notes}{Character. Free-text edition notes.}
#'   \item{source}{Character. Olympedia URL.}
#' }
#'
#' @source \url{https://www.olympedia.org/}
#'
#' @examples
#' data(editions)
#' editions[, c("games", "city", "participants", "medal_events")]
"editions"
