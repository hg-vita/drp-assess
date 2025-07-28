# -------------------------------------------------------------
# Script: 01b_load_clean_unicef.R
# Purpose: Dynamically fetch and clean UNICEF indicators using SDMX API
# -------------------------------------------------------------

library(rsdmx)
library(dplyr)
library(tidyverse)
library(janitor)

# -------Configuration------------------


indicate <- c("MNCH_ANC4", "MNCH_SAB")  # You can add more
start_year <- 2018
end_year <- 2022

# -------Generate Query--------

ind_str <- paste(indicate, collapse = "+")
unicef_url <- paste0(
  "https://sdmx.data.unicef.org/ws/public/sdmxapi/rest/data/",
  "UNICEF,GLOBAL_DATAFLOW,1.0/.", ind_str,
  ".?startPeriod=", start_year,
  "&endPeriod=", end_year
)

cat("Fetching data from:", unicef_url, "\n")

# ----Fetch and Clean Data----

sdmx_data <- readSDMX(unicef_url)
df <- as.data.frame(sdmx_data) %>% clean_names()

unicef_clean <- df %>%
  filter(sex == "_T") %>%
  transmute(
    country = ref_area,
    year = time_period,
    indicator,
    value = obs_value
  ) %>%
  pivot_wider(
    names_from = indicator,
    values_from = value
  )

# -----Save Clean Data-----

saveRDS(unicef_clean, "01_data/02_process_data/undata_api.rds")
