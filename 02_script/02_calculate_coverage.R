
# 02_calculate_coverage.R

library(dplyr)

# Load cleaned data
cleaned_data <- readRDS("data/cleaned_data.rds")

# Calculate population-weighted coverage
weighted_coverage <- cleaned_data %>%
  filter(!is.na(anc4_coverage), !is.na(sba_coverage), !is.na(pop_fem_15_49)) %>%
  group_by(year) %>%
  summarise(
    anc4_weighted = sum(anc4_coverage * pop_fem_15_49, na.rm = TRUE) / sum(pop_fem_15_49, na.rm = TRUE),
    sba_weighted = sum(sba_coverage * pop_fem_15_49, na.rm = TRUE) / sum(pop_fem_15_49, na.rm = TRUE)
  )

# Save output
saveRDS(weighted_coverage, "data/weighted_coverage.rds")
