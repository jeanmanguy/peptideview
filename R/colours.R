#' @importFrom crayon style
colour_amino_acid <- function(aa, colour_scheme = colour_scheme_clustal) {
	style(string = aa, as = "#000000", bg = colour_scheme[toupper(aa)])
}
# scales::col_numeric("BrBG", domain = c(0, 1))(0.5)

#' @importFrom glue glue
#' @importFrom stringr str_replace_all
#' @importFrom htmltools span
colour_amino_acid_html <- function(aa, colour_scheme = "clustal") {
	aa_class <- str_replace_all(amino_acids[aa], " ", "_")
	span_class <- glue("peptideview amino_acid {aa_class}_{colour_scheme}")
	as.character(glue("<span class = '{span_class}'>{aa}</span>"))
}

#' @importFrom purrr map_chr
#' @importFrom assertthat assert_that
#' @importFrom glue glue_collapse
colour_peptide <- function(peptide, colour_scheme = colour_scheme_clustal) {
	chain <- strsplit(peptide, NULL)[[1]]
	coloured_chain <- map_chr(chain, colour_amino_acid, colour_scheme = colour_scheme_clustal)
	glue_collapse(coloured_chain)
}

