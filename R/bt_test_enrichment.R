#' bt_test_enrichment
#'
#' @param query_genes Genes to be tested for enrichment
#' @param enrichment_set Genes associated with a function/pathway
#' @param total_genes Total number of genes
#'
#' @return
#' @export
#'
#' @description
#' This function is designed to perform enrichment on a list of genes of
#' interest, comparing to some specified background. Uses Fisher's Exact Test
#' for p-value.
bt_test_enrichment <- function(query_genes, enrichment_set, total_genes) {

  requireNamespace(tidyverse)


  # Calculate overlap between the query list and enrichment set
  num_overlap <- as.numeric(length(intersect(query_genes, enrichment_set)))


  # Construct the matrix to be used for the test
  enrichment_matrix <- matrix(c(
    num_overlap,
    as.numeric(length(enrichment_set) - num_overlap),
    as.numeric(length(query_genes) - num_overlap),
    as.numeric(total_genes - (length(enrichment_set) - num_overlap))
  ), nrow = 2, ncol = 2)


  # Run and return Fisher's Exact test on the matrix
  raw_pval <- fisher.test(enrichment_matrix, alternative = "greater")$p.value

  return(raw_pval)

}
