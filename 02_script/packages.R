#-------------------------------------------------------------------
# Script: packages.R
# Purpose: Install and load all required R packages
# Updated: 29 July 2025
#-------------------------------------------------------------------

required_packages <- c(
  "tidyverse",
  "readr",
  "ggplot2",
  "janitor",
  "dplyr",
  "readxl",
  "knitr",
  "rmarkdown",
  "tibble",
  "DT",
  "glue",
  "stringr"
)

# Install missing packages
installed <- rownames(installed.packages())
missing <- setdiff(required_packages, installed)

if (length(missing)) {
  install.packages(missing)
}

# Load packages
invisible(lapply(required_packages, library, character.only = TRUE))
