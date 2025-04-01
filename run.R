# Install required packages if not already installed
packages <- c("dplyr", "lubridate", "ggplot2", "cluster", 
              "factoextra", "TTR", "shiny", "plotly")

for (package in packages) {
  if (!require(package, character.only = TRUE)) {
    install.packages(package)
  }
}

# Create app directory if it doesn't exist
dir.create("app", showWarnings = FALSE)

# Source the analysis scripts
tryCatch({
  source("archive/Project.r")
}, error = function(e) {
  cat("Error:", e$message, "\n")
  cat("Please ensure all required files are in the correct locations.\n")
}) 
