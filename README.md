# BacterialToolkit
Collection of Functions for Working on Bacterial Projects

Current functions:

* **bt_gtf_cleaner** - Produces a tidy data frame from a *P. aeruginosa* GTF
  file. Supports PAO1, PA14, and LESB58.
* **bt_get_files** - Create a named list of files which can easily be read into a lists of data frames with `purrr:map(~read.csv(.))`.
* **bt_test_enrichment** - Performs Fisher's Exact Test on a query set of genes,
  given a gene set of interest.
* **bt_tidy_gage** - Creates a tidy data frame based on
  [Gage](https://bioconductor.org/packages/release/bioc/html/gage.html) results,
  and filters on q-value.

***

Install via:
```
install.packages("devtools")
library(devtools)
install_github("https://github.com/hancockinformatics/BacterialToolkit")
```
