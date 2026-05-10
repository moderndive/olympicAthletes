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
  na.strings = c("NA", ""),
  encoding = "UTF-8"
)
# The upstream CSV (rgriff23 schema) uses TitleCase headers; rename to
# lowercase snake_case to match the rest of the package.
names(olympic_athletes) <- c(
  "id", "name", "sex", "age", "height", "weight", "team", "noc",
  "games", "year", "season", "city", "sport", "event", "medal"
)
# Coerce types
olympic_athletes$id     <- as.integer(olympic_athletes$id)
olympic_athletes$year   <- as.integer(olympic_athletes$year)
olympic_athletes$age    <- as.integer(olympic_athletes$age)
olympic_athletes$height <- as.numeric(olympic_athletes$height)
olympic_athletes$weight <- as.numeric(olympic_athletes$weight)
message("  ", format(nrow(olympic_athletes), big.mark = ","), " rows, ",
        ncol(olympic_athletes), " columns")

message("Loading medal_table from data-raw/medal_table_summary.csv ...")
medal_table <- utils::read.csv(
  here("medal_table_summary.csv"),
  stringsAsFactors = FALSE,
  encoding = "UTF-8"
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
  stringsAsFactors = FALSE,
  encoding = "UTF-8"
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

## Host-city name lookup --------------------------------------------------
##
## The source CSVs use a mix of local and anglicised forms (e.g. "Athina",
## "Roma", "Munich", "Mexico City"). Build a single mapping keyed on the
## verbatim source string so we can derive a stable local-language name and
## a common English name for both olympic_athletes$City and editions$city.
## Latin transliteration is used for non-Latin scripts (Moskva, Tokyo,
## PyeongChang); Latin-script names retain their native diacritics.
city_lookup <- data.frame(
  source_city = c(
    "Albertville", "Amsterdam", "Antwerpen", "Athina", "Atlanta", "Barcelona",
    "Beijing", "Berlin", "Calgary", "Chamonix", "Ciudad de México",
    "Cortina d'Ampezzo", "Garmisch-Partenkirchen", "Grenoble", "Helsinki",
    "Innsbruck", "Lake Placid", "Lillehammer", "London", "Los Angeles",
    "Melbourne", "Mexico City", "Milano-Cortina",
    "Milano-Cortina d'Ampezzo", "Montreal", "Montréal", "Moskva",
    "Munich", "München", "Nagano", "Oslo", "Paris", "PyeongChang",
    "Rio de Janeiro", "Roma", "Salt Lake City", "Sankt Moritz", "Sapporo",
    "Sarajevo", "Seoul", "Sochi", "Squaw Valley", "St. Louis", "Stockholm",
    "Sydney", "Tokyo", "Torino", "Vancouver"
  ),
  city_local_latin = c(
    "Albertville", "Amsterdam", "Antwerpen", "Athína", "Atlanta",
    "Barcelona", "Beijing", "Berlin", "Calgary", "Chamonix",
    "Ciudad de México", "Cortina d'Ampezzo", "Garmisch-Partenkirchen",
    "Grenoble", "Helsinki", "Innsbruck", "Lake Placid", "Lillehammer",
    "London", "Los Angeles", "Melbourne", "Ciudad de México",
    "Milano-Cortina d'Ampezzo", "Milano-Cortina d'Ampezzo", "Montréal",
    "Montréal", "Moskva", "München", "München", "Nagano",
    "Oslo", "Paris", "PyeongChang", "Rio de Janeiro", "Roma",
    "Salt Lake City", "St. Moritz", "Sapporo", "Sarajevo", "Seoul", "Sochi",
    "Squaw Valley", "St. Louis", "Stockholm", "Sydney", "Tokyo", "Torino",
    "Vancouver"
  ),
  city_english = c(
    "Albertville", "Amsterdam", "Antwerp", "Athens", "Atlanta", "Barcelona",
    "Beijing", "Berlin", "Calgary", "Chamonix", "Mexico City",
    "Cortina d'Ampezzo", "Garmisch-Partenkirchen", "Grenoble", "Helsinki",
    "Innsbruck", "Lake Placid", "Lillehammer", "London", "Los Angeles",
    "Melbourne", "Mexico City", "Milan-Cortina d'Ampezzo",
    "Milan-Cortina d'Ampezzo", "Montreal", "Montreal", "Moscow", "Munich",
    "Munich", "Nagano", "Oslo", "Paris", "PyeongChang", "Rio de Janeiro",
    "Rome", "Salt Lake City", "St. Moritz", "Sapporo", "Sarajevo", "Seoul",
    "Sochi", "Squaw Valley", "St. Louis", "Stockholm", "Sydney", "Tokyo",
    "Turin", "Vancouver"
  ),
  stringsAsFactors = FALSE
)
Encoding(city_lookup$source_city)  <- "UTF-8"
Encoding(city_lookup$city_local_latin)   <- "UTF-8"
Encoding(city_lookup$city_english) <- "UTF-8"

apply_city_lookup <- function(x, src_col) {
  m <- match(x[[src_col]], city_lookup$source_city)
  if (anyNA(m)) {
    bad <- unique(x[[src_col]][is.na(m)])
    stop("Unmapped host-city values in '", src_col, "': ",
         paste(bad, collapse = ", "), call. = FALSE)
  }
  list(local = city_lookup$city_local_latin[m],
       english = city_lookup$city_english[m])
}

message("Mapping host-city names (local + English) ...")
oa_city <- apply_city_lookup(olympic_athletes, "city")
olympic_athletes$city_local_latin   <- oa_city$local
olympic_athletes$city_english <- oa_city$english
olympic_athletes$city <- NULL
olympic_athletes <- olympic_athletes[, c(
  "id", "name", "sex", "age", "height", "weight", "team", "noc",
  "games", "year", "season",
  "city_local_latin", "city_english",
  "sport", "event", "medal"
)]

ed_city <- apply_city_lookup(editions, "city")
editions$city_local_latin   <- ed_city$local
editions$city_english <- ed_city$english
editions$city <- NULL
editions <- editions[, c(
  "edition_id", "games", "year", "season",
  "city_local_latin", "city_english", "country",
  "opening_ceremony", "closing_ceremony",
  "participants", "nocs", "medal_events", "disciplines",
  "notes", "source"
)]

message("Saving .rda files (xz-compressed) ...")
save(olympic_athletes, file = out("olympic_athletes.rda"), compress = "xz")
save(medal_table,      file = out("medal_table.rda"),      compress = "xz")
save(editions,         file = out("editions.rda"),         compress = "xz")

message("Done. Run devtools::document() to refresh man/ and devtools::check()")
