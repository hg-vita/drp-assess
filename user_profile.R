
#-------------------------------------------------------------------
# Project: Population-Weighted Health Coverage
# Script: User Profile Configuration
# Author: [Your Name]
# Date: 28 July 2025
#-------------------------------------------------------------------

# Set working directories and environment-agnostic paths
# This profile should be loaded before running any other script

USERNAME <- Sys.getenv("USERNAME")
USER     <- Sys.getenv("USER")

# Define the project folder based on user
if (USER %in% c("karavan88", "your_unix_user")) {
  projectFolder <- file.path("/Users", USER, "Documents", "GitHub", "consultancy-assessment")
} else {
  projectFolder <- getwd()  # fallback to current directory
}

# Confirm that the main directory is correct
stopifnot(dir.exists(projectFolder))

# Set up key folders
dataDir     <- file.path(projectFolder, "data")
outputDir   <- file.path(projectFolder, "outputs")
scriptsDir  <- file.path(projectFolder, "scripts")
reportDir   <- file.path(projectFolder, "report")

# Validate that key folders exist
stopifnot(dir.exists(dataDir))
stopifnot(dir.exists(outputDir))
stopifnot(dir.exists(scriptsDir))
