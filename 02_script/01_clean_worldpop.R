# -------------------------------------------------------------
# Script: 01a_load_clean_wpp.R
# Purpose: Load and clean World Population Prospects (WPP) data
# -------------------------------------------------------------

library(readxl)
library(dplyr)
library(janitor)

# Load raw Excel WPP data
worldpop <- read_excel("01_data/01_rawdata/WPP2022_GEN_F01_DEMOGRAPHIC_INDICATORS_COMPACT_REV1.xlsx", skip = 15) %>%
  clean_names()

# Save raw cleaned full file
saveRDS(worldpop, file = "01_data/02_processed/wpp2022_full_cleaned.rds")
