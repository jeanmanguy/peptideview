#' @title View HTML rendering of proteins and peptides sequences
#' @param sequence a string
#' @importFrom assertthat assert_that
#' @importFrom glue glue_collapse
#' @export
#' @examples
#' view_peptide("KIAALKE")
view_peptide <- function(sequence) {
	assert_that(is_peptide(sequence))
	chain <- strsplit(sequence, NULL)[[1]]
	aas <- map_chr(toupper(chain), colour_amino_acid_html)
	view_peptide_widget(glue_collapse(aas, sep = ""))
}

#' @importFrom htmlwidgets sizingPolicy createWidget
#' @importFrom htmltools HTML
view_peptide_widget <- function(peptide_html) {

	html <- HTML(peptide_html)

	if (!requireNamespace("htmlwidgets", quietly = TRUE)) {
		stop("htmlwidgets package required for str_view(). \nPlease install.packages(\"htmlwidgets\") to use this functionality.",
				 call. = FALSE)
	}

	size <- sizingPolicy(
		knitr.figure = FALSE,
		defaultHeight = pmin(10 * length(peptide_html), 300),
		knitr.defaultHeight = "100%"
	)

	createWidget(
		"view_peptide",
		list(html = html),
		sizingPolicy = size,
		package = "peptideview"
	)
}
