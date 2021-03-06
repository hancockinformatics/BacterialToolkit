% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/bt_test_enrichment.R
\name{bt_test_enrichment}
\alias{bt_test_enrichment}
\title{bt_test_enrichment}
\usage{
bt_test_enrichment(query_genes, enrichment_set, total_genes)
}
\arguments{
\item{query_genes}{Genes to be tested for enrichment.}

\item{enrichment_set}{Genes associated with a function/pathway.}

\item{total_genes}{Total number of genes.}
}
\value{
Raw p-value resulting from call to \code{stats::fisher.test()}.
}
\description{
This function is designed to perform enrichment on a list of
genes of interest, comparing to some specified background. Uses Fisher's
Exact Test for p-value.
}
\references{
None.
}
\seealso{
https://github.com/hancockinformatics/BacterialToolkit
}
\author{
Travis Blimkie
}
