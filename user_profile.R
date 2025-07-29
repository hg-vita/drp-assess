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
outputDir   <- file.path(projectFolder, "outputs")
scriptsDir  <- file.path(projectFolder, "02_script")
reportDir   <- file.path(projectFolder, "report")

# Validate that key folders exist
stopifnot(dir.exists(dataDir))
stopifnot(dir.exists(outputDir))
stopifnot(dir.exists(scriptsDir))
