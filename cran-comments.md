## R CMD check results

0 errors | 0 warnings | 1 note

Checked with `R CMD check --as-cran` on R 4.5.3.

* This is a new submission.

* The remaining NOTE reports the license as "CC BY 4.0 + file LICENSE". This is
  intentional: `olympicAthletes` is a data package, and the data is released
  under the Creative Commons Attribution 4.0 International License. The
  accompanying `LICENSE` file records the copyright holder and the two upstream
  data sources (the rgriff23 'Olympic_history' dataset and Olympedia).

## Package size

The source tarball is ~4.8 MB, under CRAN's 5 MB guideline. The bulk is the
`olympic_athletes` data frame (~315,000 rows), which is the reason the package
exists; it is stored with `LazyDataCompression: xz`. The smaller companion
datasets are teaching subsets used by the exercises in the associated
*Statistical Inference via Data Science / ModernDive* textbook.

## Test environments

* local macOS, R 4.5.3

## Downstream dependencies

There are currently no downstream dependencies (new package).
