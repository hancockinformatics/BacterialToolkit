#' bt_gtf_cleaner
#'
#' @param gtf_file Path to GTF/GFF file to be cleaned.
#'
#' @return Tidy data frame of annotations.
#'
#' @export
#'
#' @import dplyr
#' @import stringr
#' @import tidyr
#'
#' @description Given an input GTF file (Pseudomonas aeruginosa), separates and
#' cleans columns, returning a clean and tidy data frame. Only returns locus
#' tag, gene name, description, start, end, and strand columns. Only supports
#' PAO1, PA14, and LESB58. Uses a single regex to match and extract locus tag
#' for all three strains.
#'
#' @references None.
#'
#' @seealso https://github.com/hancockinformatics/BacterialToolkit
#'
#' @author Travis Blimkie
#'
bt_gtf_cleaner <- function(gtf_file) {

  # Specify column names
  gtf_cols <- c("seqname", "source", "feature", "start", "end",
                "score", "strand", "frame", "attribute")

  # Load in the raw GTF file as a tibble
  gtf <- readr::read_tsv(gtf_file, col_names = gtf_cols)


  # Perform all the cleaning steps
  clean_gtf <- gtf %>%
    filter(feature == "CDS") %>%
    separate(
      attribute,
      into = c("gene_id", "transcript_id", "locus_tag", "name", "ref"),
      sep = ";"
    ) %>%
    select(locus_tag, name, start, end, strand) %>%
    # Regex is important as it is meant to match IDs for three PA strains, PAO1,
    # PA14, and LESB58
    mutate(
      locus_tag = str_extract(locus_tag, pattern = "PA(14|LES)?_?[0-9]{4,5}"),
      name = str_replace(name, pattern = ' name "(.*)"', replacement = "\\1")
    ) %>%
    separate(name, into = c("name", "description"), sep = " ,", fill = "left") %>%
    # Set name to be equal to locus tag if name is NA. Needs to be AFTER the
    # separate() call
    mutate(name = case_when(is.na(name) ~ locus_tag, TRUE ~ name))

  # Explicit return for the cleaned file
  return(clean_gtf)
}
