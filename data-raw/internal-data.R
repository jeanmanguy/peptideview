colour_scheme_clustal <- c(
  "A" = "#197fe5",
  "C" = "#E57F7F",
  "D" = "#8C60C2",
  "E" = "#8C60C2",
  "F" = "#197fe5",
  "G" = "#e5994c",
  "H" = "#00B2B2",
  "I" = "#197fe5",
  "K" = "#e53319",
  "L" = "#197fe5",
  "M" = "#197fe5",
  "N" = "#3FBE4F",
  "P" = "#cccc00",
  "Q" = "#3FBE4F",
  "R" = "#e53319",
  "S" = "#3FBE4F",
  "T" = "#3FBE4F",
  "V" = "#197fe5",
  "W" = "#00B2B2",
  "Y" = "#00B2B2"
)

amino_acids <- c(
  "A" = "Alanine",
  "R" = "Arginine",
  "N" = "Asparagine",
  "D" = "Aspartic acid",
  "C" = "Cysteine",
  "E" = "Glutamic acid",
  "Q" = "Glutamine",
  "G" = "Glycine",
  "H" = "Histidine",
  "I" = "Isoleucine",
  "L" = "Leucine",
  "K" = "Lysine",
  "M" = "Methionine",
  "F" = "Phenylalanine",
  "P" = "Proline",
  "S" = "Serine",
  "T" = "Threonine",
  "W" = "Tryptophan",
  "Y" = "Tyrosine",
  "V" = "Valine"
)

usethis::use_data(
  amino_acids,
  colour_scheme_clustal,
  internal = TRUE,
  overwrite = TRUE,
  version = 3
)
