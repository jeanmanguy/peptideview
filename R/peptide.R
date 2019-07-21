#' @title Peptide
#' @rdname peptide-class
#' @description Simple class for peptidic sequences. Display the sequence in colors in the console. Also works in a [tibble][tibble::tibble-package].
#' @param x a string
#' @return an obect of class `peptide`
#' @examples
#' peptide("KIAALKE")

#' @rdname peptide-class
#' @export
peptide <- function(x) {
	as_peptide(as.character(x))
}

#' @rdname peptide-class
#' @importFrom assertthat assert_that
#' @importFrom purrr map_lgl
#' @export
as_peptide <- function(x) {
	assert_that(all(map_lgl(x, is_peptide)))
	structure(x, class = "peptide")
}

#' @export
c.peptide <- function(x, ...) {
	as_peptide(NextMethod())
}

#' @export
`[.peptide` <- function(x, i) {
	as_peptide(NextMethod())
}

#' @export
format.peptide <- function(x, ..., formatter = peptide_formatter) {
	x_valid <- which(!is.na(x))
	sequence <- unclass(x[x_valid])
	ret <- rep("<NA>", length(x))
	ret[x_valid] <- paste(
		formatter(sequence)
	)
	format(ret, justify = "right")
}

#' @importFrom purrr map_chr
peptide_formatter <- function(x) {
	format(map_chr(x, colour_peptide), justify = "left")
}


#' @export
print.peptide <- function(x, ...) {
	cat(format(x), sep = "\n")
	invisible(x)
}

#' @importFrom pillar type_sum
#' @export
type_sum.peptide <- function(x) {
	"peptide"
}

#' @importFrom pillar pillar_shaft
#' @export
pillar_shaft.peptide <- function(x, ...) {
	out <- format(x)
	out[is.na(x)] <- NA
	pillar::new_pillar_shaft_simple(out, align = "left", min_width = 5L)
}

#' @importFrom pillar is_vector_s3
#' @export
is_vector_s3.peptide <- function(x) TRUE
