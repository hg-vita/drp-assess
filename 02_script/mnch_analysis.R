library(dplyr)

perform_mnch_analysis <- function(mnch_data, country_code) {
  country_data <- mnch_data %>%
    filter(country == country_code) %>%
    mutate(across(c(MNCH_ANC4, MNCH_SAB), as.numeric)) %>%
    arrange(year)
  
  if (nrow(country_data) == 0) return(NULL)
  
  start_year <- min(country_data$year, na.rm = TRUE)
  end_year   <- max(country_data$year, na.rm = TRUE)
  
  anc4_start <- country_data$MNCH_ANC4[which.min(country_data$year)]
  anc4_end   <- country_data$MNCH_ANC4[which.max(country_data$year)]
  sab_start  <- country_data$MNCH_SAB[which.min(country_data$year)]
  sab_end    <- country_data$MNCH_SAB[which.max(country_data$year)]
  
  trend_anc4 <- (anc4_end - anc4_start) / (end_year - start_year)
  trend_sab  <- (sab_end - sab_start) / (end_year - start_year)
  
  list(
    summary_table = country_data,
    trend_summary = tibble(
      indicator = c("MNCH_ANC4", "MNCH_SAB"),
      trend = c(trend_anc4, trend_sab),
      start_year = start_year,
      end_year = end_year
    )
  )
}