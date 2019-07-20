#' @export
peptide <- function(sequence) {
	as_peptide(as.character(sequence))
}

#' @export
as_peptide <- function(x) {
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

peptide_formatter <- function(x) {
	# add crayon stuff
	str <- strsplit(x, NULL)[[1]]
	format(x, justify = "left")
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
