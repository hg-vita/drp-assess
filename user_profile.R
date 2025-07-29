#-------------------------------------------------------------------
# Project: Population-Weighted Health Coverage
# Script: User Profile Configuration
# Author: XXXX
# Date: 28 July 2025
#-------------------------------------------------------------------


# Default to current working directory as the project folder
projectFolder <- getwd()

# Confirm that the main directory is correct
stopifnot(dir.exists(projectFolder))

# Set up key folders
dataDir     <- file.path(projectFolder, "01_data")
outputDir   <- file.path(projectFolder, "03_output")
scriptsDir  <- file.path(projectFolder, "02_script")
reportDir   <- file.path(projectFolder, "04_report")

# Validate that key folders exist
dir.create(dataDir, recursive = TRUE, showWarnings = FALSE)
dir.create(outputDir, recursive = TRUE, showWarnings = FALSE)
dir.create(scriptsDir, recursive = TRUE, showWarnings = FALSE)
