
#-------------------------------------------------------------------
# Script: packages.R
# Purpose: Install and load all required R packages
#-------------------------------------------------------------------

required_packages <- c(
  "tidyverse",
  "readr",
  "ggplot2",
  "janitor",
  "dplyr",
  "readxl",
  "knitr",
  "rmarkdown"
)

# Install any missing packages
installed <- rownames(installed.packages())
missing <- setdiff(required_packages, installed)

if (length(missing)) {
  install.packages(missing)
}

# Load all packages
invisible(lapply(required_packages, library, character.only = TRUE))
