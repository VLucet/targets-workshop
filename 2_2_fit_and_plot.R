
args <-  commandArgs(trailingOnly=TRUE)
path <- args[1]
out_path <- args[2]

dat_cleaned <- readr::read_csv(path, col_types = readr::cols())

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

ggplot2::ggsave(fit_plot, out_path)
