#' @title Assertions
#' @seealso [assert_that][assertthat::assert_that]
#' @rdname assertions
#' @param x an object to examine
#' @return logical
#' @importFrom assertthat on_failure<- assert_that
#' @importFrom glue glue glue_collapse

#' @rdname assertions
#' @importFrom assertthat is.string
is_amino_acid <- function(x) {
	assert_that(is.character(x), all(nchar(x) == 1L))
	toupper(x) %in% names(amino_acids)
}

on_failure(is_amino_acid) <- function(call, env) {
	glue("{deparse(eval(call$x, envir = env))} is not an amino acid (1 letter code).")
}

#' @rdname assertions
#' @importFrom assertthat is.string
is_peptide <- function(x) {
	assert_that(is.string(x))
	chain <- strsplit(x, NULL)[[1]]
	all(is_amino_acid(chain))
}

#' @importFrom purrr discard
on_failure(is_peptide) <- function(call, env) {
	x <- eval(call$x, envir = env)
	chain <- strsplit(x, NULL)[[1]]
	not_aa <- unique(discard(chain, is_amino_acid))
  glue("{glue_collapse(not_aa, sep = ', ', last = ' and ')} are not amino acids.")
}
