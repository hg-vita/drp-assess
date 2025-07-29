# -------------------------------------------------------------
# Script: 01a_load_clean_wpp.R
# Purpose: Load and clean World Population Prospects (WPP) data
# -------------------------------------------------------------

library(readxl)
library(dplyr)
library(janitor)

# Load raw Excel WPP data
worldpop <- read_excel("01_data/01_rawdata/WPP2022_GEN_F01_DEMOGRAPHIC_INDICATORS_COMPACT_REV1.xlsx", skip = 16) %>%
  clean_names()

library(readxl)
worldpop <- read_excel("01_data/01_rawdata/WPP2022_GEN_F01_DEMOGRAPHIC_INDICATORS_COMPACT_REV1.xlsx", 
                                                                  col_types = c("numeric", "text", "text", 
                                                                                "text", "numeric", "text", "text", 
                                                                                "numeric", "text", "numeric", "numeric", 
                                                                                "text", "text", "text", "text", "text", 
                                                                                "text", "text", "text", "text", "text", 
                                                                                "text", "text", "text", "text", "text", 
                                                                                "text", "text", "text", "text", "text", 
                                                                                "text", "text", "text", "text", "text", 
                                                                                "text", "text", "text", "text", "text", 
                                                                                "text", "text", "text", "text", "text", 
                                                                                "text", "text", "text", "text", "text", 
                                                                                "text", "text", "text", "text", "text", 
                                                                                "text", "text", "text", "text", "text", 
                                                                                "text", "text", "text", "text"))
View(WPP2022_GEN_F01_DEMOGRAPHIC_INDICATORS_COMPACT_REV1)

library(readxl)
library(dplyr)
library(janitor)

ncol(read_excel("01_data/01_rawdata/WPP2022_GEN_F01_DEMOGRAPHIC_INDICATORS_COMPACT_REV1.xlsx", n_max = 0))  # just reads header row to count columns

# Define common col_types: first 7 explicitly, rest guessed
col_types <- c(
  "numeric", "text", "text", "text", "numeric", "text", "text",
  rep("guess", 58)  # Adjust based on remaining columns
)

# Load Estimates sheet
estimates <- read_excel(
  "01_data/01_rawdata/WPP2022_GEN_F01_DEMOGRAPHIC_INDICATORS_COMPACT_REV1.xlsx",
  sheet = "Estimates",
  col_types = col_types
) %>%
  clean_names() %>%
  mutate(t_type = "estimates") %>%
  filter(type == "Country/Area")

# Load Projections sheet
projections <- read_excel(
  "01_data/01_rawdata/WPP2022_GEN_F01_DEMOGRAPHIC_INDICATORS_COMPACT_REV1.xlsx",
  sheet = "Projections",
  col_types = col_types  
) %>%
  clean_names() %>%
  mutate(t_type = "projections") %>%
  filter(type == "Country/Area")

# Combine both
worldpop <- bind_rows(estimates, projections)


# un_population <- un_population %>%
#   filter(Type == "Country/Area", Year == 2022) %>%
#   select(
#     country_code = `ISO3 Alpha-code`,
#     total_population = `Total Population, as of 1 July (thousands)`,
#     births = `Births (thousands)`,
#     country_name = `Region, subregion, country or area *`
#   ) %>%
#   mutate(
#     total_population = as.numeric(total_population),
#     births = as.numeric(births)
#   )

# Save raw cleaned full file
saveRDS(worldpop, file = "01_data/02_process_data/wpp_processed.rds")




