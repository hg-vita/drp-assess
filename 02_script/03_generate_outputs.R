
# 03_generate_outputs.R

library(ggplot2)
library(readr)
library(dplyr)

# Load result
weighted_coverage <- readRDS("data/weighted_coverage.rds")

# Save summary table
write_csv(weighted_coverage, "outputs/summary_table.csv")

# Plot
p <- ggplot(weighted_coverage, aes(x = year)) +
  geom_line(aes(y = anc4_weighted, color = "ANC4")) +
  geom_line(aes(y = sba_weighted, color = "SBA")) +
  labs(title = "Population-Weighted Health Coverage",
       y = "% coverage", x = "Year") +
  theme_minimal()

ggsave("outputs/anc4_sba_plot.png", p, width = 8, height = 5)
