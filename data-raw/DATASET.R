## DATASET.R
##
## Build the .rda files in data/ from the source CSVs in data-raw/.
##
## To update after a new scrape:
##   1. Replace the three CSVs in data-raw/ with freshly-scraped versions.
##   2. Bump Version: in DESCRIPTION.
##   3. Add an entry to NEWS.md.
##   4. Re-run this script:           Rscript data-raw/DATASET.R
##   5. Re-document and check:        devtools::document(); devtools::check()
##
## Then commit data/, data-raw/, DESCRIPTION, NEWS.md and (optionally)
## bump the package version + push.

here <- function(...) file.path("data-raw", ...)
out  <- function(...) file.path("data", ...)

message("Loading olympic_athletes from data-raw/athlete_events_through_2026.csv ...")
olympic_athletes <- utils::read.csv(
  here("athlete_events_through_2026.csv"),
  stringsAsFactors = FALSE,
  na.strings = c("NA", "")
)
# Coerce types
olympic_athletes$ID     <- as.integer(olympic_athletes$ID)
olympic_athletes$Year   <- as.integer(olympic_athletes$Year)
olympic_athletes$Age    <- as.integer(olympic_athletes$Age)
olympic_athletes$Height <- as.numeric(olympic_athletes$Height)
olympic_athletes$Weight <- as.numeric(olympic_athletes$Weight)
message("  ", format(nrow(olympic_athletes), big.mark = ","), " rows, ",
        ncol(olympic_athletes), " columns")

message("Loading medal_table from data-raw/medal_table_summary.csv ...")
medal_table <- utils::read.csv(
  here("medal_table_summary.csv"),
  stringsAsFactors = FALSE
)
medal_table$year   <- as.integer(medal_table$year)
medal_table$gold   <- as.integer(medal_table$gold)
medal_table$silver <- as.integer(medal_table$silver)
medal_table$bronze <- as.integer(medal_table$bronze)
medal_table$total  <- as.integer(medal_table$total)
message("  ", nrow(medal_table), " rows")

message("Loading editions from data-raw/edition_metadata.csv ...")
editions <- utils::read.csv(
  here("edition_metadata.csv"),
  stringsAsFactors = FALSE
)
editions$edition_id       <- as.integer(editions$edition_id)
editions$year             <- as.integer(editions$year)
editions$participants     <- as.integer(editions$participants)
editions$nocs             <- as.integer(editions$nocs)
editions$medal_events     <- as.integer(editions$medal_events)
editions$disciplines      <- as.integer(editions$disciplines)
editions$opening_ceremony <- as.Date(editions$opening_ceremony)
editions$closing_ceremony <- as.Date(editions$closing_ceremony)
message("  ", nrow(editions), " rows")

message("Saving .rda files (xz-compressed) ...")
save(olympic_athletes, file = out("olympic_athletes.rda"), compress = "xz")
save(medal_table,      file = out("medal_table.rda"),      compress = "xz")
save(editions,         file = out("editions.rda"),         compress = "xz")

message("Done. Run devtools::document() to refresh man/ and devtools::check()")
