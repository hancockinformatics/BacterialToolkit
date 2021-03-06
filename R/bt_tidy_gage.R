#' bt_tidy_gage
#'
#' @param gage_result Results object from Gage enrichment.
#' @param qval Desired cutoff for significance.
#'
#' @return Tidy data frame containing results of Gage enrichment.
#'
#' @export
#'
#' @import dplyr
#' @import tibble
#'
#' @description Takes a results object from Gage and munges it into a tidy data
#' frame Also filters based on q-value, with a default of 0.1 from the Gage
#' documentation.
#'
#' @references None.
#'
#' @seealso https://github.com/hancockinformatics/BacterialToolkit
#'
#' @author Travis Blimkie
#'
bt_tidy_gage <- function(gage_result, qval = 0.1) {

  bind_rows(
    list(Up = as.data.frame(gage_result[["greater"]]) %>% rownames_to_column(),
         Down = as.data.frame(gage_result[["less"]]) %>% rownames_to_column()),
    .id = "Direction"
  ) %>%
    filter(., q.val < qval)

}
