#-------------------------------------------------------------------
# Project: Population-Weighted Health Coverage
# Script: Report Runner
# Author: [Your Name]
# Date: 28 July 2025
#-------------------------------------------------------------------

# Load user profile (sets folders and installs packages)
source("user_profile.R")

# Render the R Markdown report
rmarkdown::render(
  input       = "report.Rmd",
  output_file = file.path(outputDir, "report.html"),
  output_dir  = outputDir,
  clean       = TRUE
)

message("✅ Report successfully rendered to: ", file.path(outputDir, "report.html"))
