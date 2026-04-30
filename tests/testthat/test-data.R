test_that("olympic_athletes has the expected schema and span", {
  data(olympic_athletes)
  expected <- c("ID", "Name", "Sex", "Age", "Height", "Weight", "Team", "NOC",
                "Games", "Year", "Season", "City", "Sport", "Event", "Medal")
  expect_identical(colnames(olympic_athletes), expected)
  expect_gt(nrow(olympic_athletes), 300000)
  expect_equal(min(olympic_athletes$Year), 1896L)
  expect_equal(max(olympic_athletes$Year), 2026L)
  expect_setequal(unique(olympic_athletes$Season), c("Summer", "Winter"))
  expect_true(all(is.na(olympic_athletes$Medal) |
                  olympic_athletes$Medal %in% c("Gold", "Silver", "Bronze")))
})

test_that("medal_table covers all five new editions", {
  data(medal_table)
  expect_setequal(unique(medal_table$year), c(2018, 2020, 2022, 2024, 2026))
  expect_true(all(c("gold", "silver", "bronze", "total") %in% colnames(medal_table)))
  expect_true(all(medal_table$total == medal_table$gold +
                                       medal_table$silver +
                                       medal_table$bronze))
})

test_that("editions has 5 rows and the expected columns", {
  data(editions)
  expect_equal(nrow(editions), 5L)
  expect_setequal(editions$edition_id, c(60L, 61L, 62L, 63L, 72L))
  expect_true(inherits(editions$opening_ceremony, "Date"))
})
