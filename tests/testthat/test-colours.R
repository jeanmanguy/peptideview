test_that("add colour to an amino acid with crayon correctly", {
	expect_true(crayon:::has_style(peptideview:::colour_amino_acid("L")))
  expect_equal(crayon:::strip_style(peptideview:::colour_amino_acid("L")), "L")
  expect_equal(peptideview:::colour_amino_acid("L"), "\033[38;5;232m\033[48;5;33mL\033[49m\033[39m")
})

test_that("add colour to a peptide", {
	expect_true(crayon::has_style(peptideview:::colour_peptide("wwwf")))
})

test_that("add HTML tag", {
	expect_equal(peptideview:::colour_amino_acid_html("L"), "<span class = 'peptideview amino_acid Leucine_clustal'>L</span>")
})


peptideview:::colour_amino_acid_html("L")
