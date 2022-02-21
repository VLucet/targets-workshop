
# Get the palmer penguins data and save it as a file

penguins_data <- palmerpenguins::penguins
readr::write_csv(penguins_data,  "data/penguins.csv")

# Read the data

dat <- readr::read_csv("data/penguins.csv", col_types = readr::cols())

# Clean the data

dat_cleaned <- tidyr::drop_na(dat)

# Write out the clean data

readr::write_csv(dat_cleaned, "data/penguins_clean.csv")

# Fit simple linear model

fit <- lm(bill_length_mm ~ body_mass_g + species, dat_cleaned)

# Plot fit with data

preds <- predict(fit)
dat_cleaned$preds <- preds

fit_plot <- dat_cleaned |>
  ggplot2::ggplot(ggplot2::aes(y = bill_length_mm,
                               x = body_mass_g, color = species)) +
  ggplot2::geom_point() +
  ggplot2::geom_line(ggplot2::aes(x = body_mass_g,
                                  y = preds))

ggplot2::ggsave('fig1.png', fit_plot)
