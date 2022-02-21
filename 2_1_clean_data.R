
args <-  commandArgs(trailingOnly=TRUE)
path <- args[1]
out_path <- args[2]

penguins_data <- palmerpenguins::penguins
readr::write_csv(penguins_data,  path)

# Read the data

dat <- readr::read_csv(path, col_types = readr::cols())

# Clean the data

dat_cleaned <- tidyr::drop_na(dat)

# Write out the clean data

readr::write_csv(dat_cleaned, out_path)
