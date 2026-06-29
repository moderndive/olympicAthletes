pkgname <- "olympicAthletes"
source(file.path(R.home("share"), "R", "examples-header.R"))
options(warn = 1)
library('olympicAthletes')

base::assign(".oldSearch", base::search(), pos = 'CheckExEnv')
base::assign(".old_wd", base::getwd(), pos = 'CheckExEnv')
cleanEx()
nameEx("athletics_athletes")
### * athletics_athletes

flush(stderr()); flush(stdout())

### Name: athletics_athletes
### Title: Olympic athletics (track and field) athlete-event
###   participations, 1896-2026
### Aliases: athletics_athletes
### Keywords: datasets

### ** Examples

data(athletics_athletes)
head(athletics_athletes)



cleanEx()
nameEx("basketball_athletes")
### * basketball_athletes

flush(stderr()); flush(stdout())

### Name: basketball_athletes
### Title: Olympic basketball athlete-event participations, 1896-2026
### Aliases: basketball_athletes
### Keywords: datasets

### ** Examples

data(basketball_athletes)
head(basketball_athletes)



cleanEx()
nameEx("curling_athletes")
### * curling_athletes

flush(stderr()); flush(stdout())

### Name: curling_athletes
### Title: Olympic curling athlete-event participations, 1896-2026
### Aliases: curling_athletes
### Keywords: datasets

### ** Examples

data(curling_athletes)
head(curling_athletes)



cleanEx()
nameEx("editions")
### * editions

flush(stderr()); flush(stdout())

### Name: editions
### Title: Edition-level metadata for every Olympic Games, 1896-2026
### Aliases: editions
### Keywords: datasets

### ** Examples

data(editions)
editions[, c("games", "city_local_latin", "city_english",
              "participants", "medal_events")]



cleanEx()
nameEx("gymnastics_athletes")
### * gymnastics_athletes

flush(stderr()); flush(stdout())

### Name: gymnastics_athletes
### Title: Olympic gymnastics athlete-event participations, 1896-2026
### Aliases: gymnastics_athletes
### Keywords: datasets

### ** Examples

data(gymnastics_athletes)
head(gymnastics_athletes)



cleanEx()
nameEx("medal_table")
### * medal_table

flush(stderr()); flush(stdout())

### Name: medal_table
### Title: Verified medal tables for every Olympic edition, 1896-2026
### Aliases: medal_table
### Keywords: datasets

### ** Examples

data(medal_table)
subset(medal_table, year == 2024)[1:10, ]



cleanEx()
nameEx("olympic_athletes")
### * olympic_athletes

flush(stderr()); flush(stdout())

### Name: olympic_athletes
### Title: Olympic athlete-event participations, 1896-2026
### Aliases: olympic_athletes
### Keywords: datasets

### ** Examples

data(olympic_athletes)
head(olympic_athletes)
table(olympic_athletes$year, olympic_athletes$season)

## Not run: 
##D   # Top medal-winning NOCs at Paris 2024 (one row per athlete-medal)
##D   library(dplyr)
##D   olympic_athletes |>
##D     filter(year == 2024, !is.na(medal)) |>
##D     count(noc, medal) |>
##D     tidyr::pivot_wider(names_from = medal, values_from = n, values_fill = 0) |>
##D     arrange(desc(Gold + Silver + Bronze))
## End(Not run)



cleanEx()
nameEx("olympic_athletes_1960")
### * olympic_athletes_1960

flush(stderr()); flush(stdout())

### Name: olympic_athletes_1960
### Title: Olympic athlete-event participations at the Rome 1960 Summer
###   Games
### Aliases: olympic_athletes_1960
### Keywords: datasets

### ** Examples

data(olympic_athletes_1960)
head(olympic_athletes_1960)



cleanEx()
nameEx("olympic_athletes_2000_2026")
### * olympic_athletes_2000_2026

flush(stderr()); flush(stdout())

### Name: olympic_athletes_2000_2026
### Title: Olympic athlete-event participations, 2000-2026
### Aliases: olympic_athletes_2000_2026
### Keywords: datasets

### ** Examples

data(olympic_athletes_2000_2026)
head(olympic_athletes_2000_2026)



cleanEx()
nameEx("olympic_athletes_2024")
### * olympic_athletes_2024

flush(stderr()); flush(stdout())

### Name: olympic_athletes_2024
### Title: Olympic athlete-event participations at the Paris 2024 Summer
###   Games
### Aliases: olympic_athletes_2024
### Keywords: datasets

### ** Examples

data(olympic_athletes_2024)
head(olympic_athletes_2024)



cleanEx()
nameEx("paris_2024_top_medals")
### * paris_2024_top_medals

flush(stderr()); flush(stdout())

### Name: paris_2024_top_medals
### Title: Top-10 countries by medals at the Paris 2024 Summer Olympics
### Aliases: paris_2024_top_medals
### Keywords: datasets

### ** Examples

data(paris_2024_top_medals)
head(paris_2024_top_medals)



cleanEx()
nameEx("volleyball_athletes")
### * volleyball_athletes

flush(stderr()); flush(stdout())

### Name: volleyball_athletes
### Title: Olympic volleyball athlete-event participations, 1896-2026
### Aliases: volleyball_athletes
### Keywords: datasets

### ** Examples

data(volleyball_athletes)
head(volleyball_athletes)



### * <FOOTER>
###
cleanEx()
options(digits = 7L)
base::cat("Time elapsed: ", proc.time() - base::get("ptime", pos = 'CheckExEnv'),"\n")
grDevices::dev.off()
###
### Local variables: ***
### mode: outline-minor ***
### outline-regexp: "\\(> \\)?### [*]+" ***
### End: ***
quit('no')
