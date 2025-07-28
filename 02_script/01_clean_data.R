
# 01_clean_data.R

library(readr)
library(dplyr)
library(janitor)

# Load and clean raw data
raw_data <- read_csv("data/coverage_data.csv")
cleaned_data <- raw_data %>%
  janitor::clean_names()

# Save cleaned data
saveRDS(cleaned_data, "data/cleaned_data.rds")
