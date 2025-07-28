# -------------------------------------------------------------
# Script: 01c_merge_data_scalable.R
# Purpose: Merge WPP and UNICEF datasets based on selected variables
# -------------------------------------------------------------

library(dplyr)
library(readr)

# ----Configuration------


# Defining selected variables from each dataset
vars_wpp     <- c("iso3_alpha_code", "year", "total_population_as_of_1_july_thousands")
vars_unicef  <- c("country", "year", "MNCH_ANC4", "MNCH_SAB")

# ----Load Processed Data----


wpp_data     <- readRDS("01_data/02_process_data/wpp_processed.rds")   
unicef_data  <- readRDS("01_data/02_process_data/undata_api.rds")

# ----Subset and Standardize----

wpp_sel <- wpp_data %>%
  select(all_of(vars_wpp)) %>%
  rename_with(tolower) %>%
  rename(country = iso3_alpha_code)

unicef_sel <- unicef_data %>%
  select(all_of(vars_unicef)) %>%
  rename_with(tolower) %>%
  mutate(year = as.numeric(year)) 

# ----Merge----

merged_data <- left_join(unicef_sel, wpp_sel, by = c("country", "year"))

# -----Save Output------

saveRDS(merged_data, "01_data/03_prod_data/merged_unicef_wpp.rds")

