# ✅ Load required packages
library(dplyr)
library(tibble)

cat("🔧 Running mnch_analysis.R...\n")

# ✅ Load merged UNICEF+MNCH dataset
merged_data <- readRDS("01_data/03_prod_data/merged_unicef_wpp.rds")

# Ensure ANC4 and SBA values are numeric
merged_data <- merged_data %>%
  mutate(
    mnch_anc4 = as.numeric(mnch_anc4),
    mnch_sab  = as.numeric(mnch_sab)
  )


cat("✅ merged_data loaded with", nrow(merged_data), "rows\n")

# ✅ Load WPP data for projected births
wpp_processed <- readRDS("01_data/02_process_data/wpp_processed.rds")

# Filter births for 2022
births_2022 <- wpp_processed %>%
  filter(year == 2022) %>%
  rename(country_code = iso3_alpha_code) %>%
  select(country_code, births_thousands) %>%
  mutate(births_thousands = as.numeric(births_thousands))


cat("✅ births_2022 loaded with", nrow(births_2022), "rows\n")

# ✅ Function: country-wise trend summary
perform_mnch_analysis <- function(mnch_data, country_code_input) {
  if (!(country_code_input %in% mnch_data$country_code)) {
    warning(paste("❌ Country code", country_code_input, "not found in data"))
    return(NULL)
  }
  
  country_data <- mnch_data %>%
    filter(country_code == country_code_input) %>%
    arrange(year)
  
  if (nrow(country_data) == 0) return(NULL)
  
  start_year <- min(country_data$year, na.rm = TRUE)
  end_year   <- max(country_data$year, na.rm = TRUE)
  
  anc4_start <- country_data$mnch_anc4[which.min(country_data$year)]
  anc4_end   <- country_data$mnch_anc4[which.max(country_data$year)]
  sab_start  <- country_data$mnch_sab[which.min(country_data$year)]
  sab_end    <- country_data$mnch_sab[which.max(country_data$year)]
  
  trend_anc4 <- (anc4_end - anc4_start) / (end_year - start_year)
  trend_sab  <- (sab_end - sab_start) / (end_year - start_year)
  
  list(
    summary_table = country_data,
    trend_summary = tibble(
      indicator   = c("mnch_anc4", "mnch_sab"),
      trend       = c(trend_anc4, trend_sab),
      start_year  = start_year,
      end_year    = end_year
    )
  )
}

# ✅ Optional: global ANC4/SBA trend table across all countries
rank_trend <- merged_data %>%
  arrange(country_code, year) %>%
  group_by(country_code) %>%
  summarise(
    start_year = min(year, na.rm = TRUE),
    end_year   = max(year, na.rm = TRUE),
    anc4_start = first(mnch_anc4[year == min(year, na.rm = TRUE)]),
    anc4_end   = first(mnch_anc4[year == max(year, na.rm = TRUE)]),
    sab_start  = first(mnch_sab[year == min(year, na.rm = TRUE)]),
    sab_end    = first(mnch_sab[year == max(year, na.rm = TRUE)]),
    trend_anc4 = (anc4_end - anc4_start) / (end_year - start_year),
    trend_sab  = (sab_end - sab_start) / (end_year - start_year),
    .groups = "drop"
  )

u5mr_status <- read_excel("01_data/01_rawdata/On-track and off-track countries.xlsx") %>%
  select(country_code = ISO3Code, u5mr_status = `Status.U5MR`) %>%
  mutate(
    u5mr_classification = case_when(
      tolower(u5mr_status) %in% c("achieved", "on track") ~ "On Track",
      tolower(u5mr_status) == "acceleration needed" ~ "Off Track",
      TRUE ~ NA_character_
    )
  )


# ✅ Merge with rank_trend to attach U5MR classification
rank_trend <- rank_trend %>%
  left_join(u5mr_status, by = "country_code")
