test_that("olympic_athletes has the expected schema and span", {
  data(olympic_athletes)
  expected <- c("id", "name", "sex", "age", "height", "weight", "team", "noc",
                "games", "year", "season", "city_local_latin", "city_english",
                "sport", "event", "medal")
  expect_identical(colnames(olympic_athletes), expected)
  expect_gt(nrow(olympic_athletes), 300000)
  expect_equal(min(olympic_athletes$year), 1896L)
  expect_equal(max(olympic_athletes$year), 2026L)
  expect_setequal(unique(olympic_athletes$season), c("Summer", "Winter"))
  expect_true(all(is.na(olympic_athletes$medal) |
                  olympic_athletes$medal %in% c("Gold", "Silver", "Bronze")))
})

test_that("medal_table covers every Olympic edition from 1896 to 2026", {
  data(medal_table)
  expected <- c("edition_id", "games", "year", "season", "noc", "country",
                "gold", "silver", "bronze", "total", "notes")
  expect_identical(colnames(medal_table), expected)
  expect_equal(nrow(medal_table), 1929L)
  expect_equal(min(medal_table$year), 1896L)
  expect_equal(max(medal_table$year), 2026L)
  expect_setequal(unique(medal_table$season), c("Summer", "Winter"))
  expect_true(all(medal_table$total == medal_table$gold +
                                       medal_table$silver +
                                       medal_table$bronze))
})

test_that("editions covers every Olympic edition from 1896 to 2026", {
  data(editions)
  expected <- c("edition_id", "games", "year", "season",
                "city_local_latin", "city_english", "country",
                "opening_ceremony", "closing_ceremony",
                "participants", "nocs", "medal_events", "disciplines",
                "notes", "source")
  expect_identical(colnames(editions), expected)
  expect_equal(nrow(editions), 62L)
  expect_equal(min(editions$year), 1896L)
  expect_equal(max(editions$year), 2026L)
  expect_setequal(unique(editions$season), c("Summer", "Winter"))
  expect_true(inherits(editions$opening_ceremony, "Date"))
  expect_true(inherits(editions$closing_ceremony, "Date"))
})

test_that("exercise-support subsets match their parent-data derivations", {
  data(usa_summer_medals); data(medal_table)
  expect_identical(colnames(usa_summer_medals), colnames(medal_table))
  expect_equal(nrow(usa_summer_medals), 30L)
  expect_true(all(usa_summer_medals$noc == "USA" & usa_summer_medals$season == "Summer"))
  expect_false(1980 %in% usa_summer_medals$year)  # Moscow boycott: no row at all

  data(art_competitions_athletes); data(olympic_athletes)
  expect_identical(colnames(art_competitions_athletes), colnames(olympic_athletes))
  expect_true(all(art_competitions_athletes$sport == "Art Competitions"))
  expect_equal(range(art_competitions_athletes$year), c(1912L, 1948L))

  data(team_sport_athletes)
  expect_identical(colnames(team_sport_athletes), colnames(olympic_athletes))
  expect_setequal(unique(team_sport_athletes$sport),
                  c("Basketball", "Volleyball", "Curling"))
})
