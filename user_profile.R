#-------------------------------------------------------------------
# Project: Population-Weighted Health Coverage
# Script: User Profile Configuration
# Updated: 29 July 2025
#-------------------------------------------------------------------

# Set working directories and environment-agnostic paths
USERNAME <- Sys.getenv("USERNAME")
USER     <- Sys.getenv("USER")

# Define the project folder
projectFolder <- getwd()  # fallback to current working directory
stopifnot(dir.exists(projectFolder))  # Check folder exists

# Set up key folders
dataDir     <- file.path(projectFolder, "01_data")
outputDir   <- file.path(projectFolder, "03_output")
scriptsDir  <- file.path(projectFolder, "02_script")
reportDir   <- outputDir

# Validate that key folders exist
stopifnot(dir.exists(dataDir))
stopifnot(dir.exists(outputDir))
stopifnot(dir.exists(scriptsDir))

# Load all required packages
source(file.path(scriptsDir, "packages.R"))
