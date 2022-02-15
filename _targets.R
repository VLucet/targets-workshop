library(targets)
source("R/functions.R")
list(
  tar_target(
    penguin_data,
    get_palmer_data(),
    format = "file"
  )#,
  # tar_target(
  #   raw_data,
  #   read_csv(raw_data_file, col_types = cols())
  # ),
  # tar_target(
  #   data,
  #   raw_data %>%
  #     filter(!is.na(Ozone))
  # ),
  # tar_target(hist, create_plot(data)),
  # tar_target(fit, biglm(Ozone ~ Wind + Temp, data)),
  # tar_render(report, "index.Rmd")
)
