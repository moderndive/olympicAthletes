## Resubmission

This is a resubmission. In response to Konstanze Lauseker's review:

* The `LICENSE` file has been removed and `DESCRIPTION` now declares
  `License: CC BY 4.0` with no `+ file LICENSE` reference. The package adds no
  restrictions beyond CC BY 4.0. The upstream data-source attribution that the
  file carried (the rgriff23 'Olympic_history' dataset and Olympedia) is already
  recorded in the README, in `citation("olympicAthletes")`, and in the `@source`
  field of each dataset's help page.

## R CMD check results

0 errors | 0 warnings | 1 note

Checked with `R CMD check --as-cran` on R 4.6.1.

* This is a new submission.

* The words flagged as possibly misspelled in DESCRIPTION (Cortina, Milano,
  Olympedia, PyeongChang, rgriff) are proper nouns: Olympic host cities, the
  Olympedia data source, and the GitHub username of the upstream dataset's
  author.

## Package size

The source tarball is ~4.8 MB, under CRAN's 5 MB guideline. The bulk is the
`olympic_athletes` data frame (~315,000 rows), which is the reason the package
exists; it is stored with `LazyDataCompression: xz`. The smaller companion
datasets are teaching subsets used by the exercises in the associated
*Statistical Inference via Data Science / ModernDive* textbook.

## Test environments

* local macOS, R 4.6.1
* win-builder, R-devel
* GitHub Actions: windows-latest (release), macOS-latest (release),
  ubuntu-latest (devel, release, oldrel-1)

## Downstream dependencies

There are currently no downstream dependencies (new package).
