
# R functions for pipeline ------------------------------------------------

# Get the palmer penguins data and save it as a file

get_palmer_data <- function(path = "data/penguins.csv"){
  penguins_data <- palmerpenguins::penguins
  readr::write_csv(penguins_data, path)
  return(path)
}
