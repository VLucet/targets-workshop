library(targets)
source("R/functions.R")

Sys.setenv(RETICULATE_PYTHON = "/usr/bin/python3")

list(
  tar_target(
    penguin_data_file,
    get_palmer_data(),
    format = "file"
  ),
  tar_target(
    penguin_data,
    read_data(penguin_data_file)
  ),
  tar_target(
    penguin_data_clean,
    clean_data(penguin_data)
  ),
  tar_target(
    penguin_data_clean_file,
    write_clean_data(penguin_data_clean),
    format = "file"
  ),
  tar_target(
    lm_fit,
    fit_lm(penguin_data_clean)
  ),
  tar_target(
    fit_plot,
    create_plot(penguin_data_clean, lm_fit)
  ),
  tar_target(
    compute_means_py_file,
    get_compute_means_py_path(),
    format = "file"
  ),
  tar_target(
    means_py,
    compute_means_py(compute_means_py_file, penguin_data_clean)
  )
)
