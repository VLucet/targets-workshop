
# R functions for pipeline ------------------------------------------------

# Get the palmer penguins data and save it as a file

get_palmer_data <- function(path = "data/penguins.csv"){
  stopifnot(is.character(path))
  penguins_data <- palmerpenguins::penguins
  readr::write_csv(penguins_data, path)
  return(path)
}

# Read the data

read_data <- function(path){
  stopifnot(is.character(path))
  dat <- readr::read_csv(path, col_types = readr::cols())
  return(dat)
}

# Clean the data

clean_data <- function(dat){
  stopifnot(is.data.frame(dat))
  dat_cleaned <- tidyr::drop_na(dat)
  return(dat_cleaned)
}

# Write out the clean data

write_clean_data <- function(dat_clean, path = "data/penguins_clean.csv"){
  stopifnot(is.data.frame(dat_clean))
  stopifnot(is.character(path))
  readr::write_csv(dat_clean, path)
  return(path)
}

# Fit simple linear model

fit_lm <- function(dat_clean, formula = as.formula(bill_length_mm ~ body_mass_g + species)){
  stopifnot(is.data.frame(dat_clean))
  stopifnot(class(formula) == "formula")
  fit <- lm(formula, dat_clean)
  return(fit)
}

# Plot fit with data

create_plot <- function(dat_clean, fit){
  stopifnot(is.data.frame(dat_clean))
  stopifnot(class(fit) == "lm")

  preds <- predict(fit)
  dat_clean$preds <- preds

  fit_plot <- dat_clean |>
    ggplot2::ggplot(ggplot2::aes(y = bill_length_mm,
                                 x = body_mass_g, color = species)) +
    ggplot2::geom_point() +
    ggplot2::geom_line(ggplot2::aes(x = body_mass_g,
                                    y = preds))

  return(fit_plot)
}

# -------------------------------------------------------------------------

# Returns the python script file

get_compute_means_py_path <- function(path = "python/compute_means.py"){
  return(path)
}

# Run a python script

compute_means_py <- function(path, dat_clean, key = "body_mass_g"){
  reticulate::source_python(path)
  compute_mean(dat_clean, key)
}
