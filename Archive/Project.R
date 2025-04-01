# Archive/Project.R

# Load necessary libraries
library(dplyr)
library(lubridate)
library(ggplot2)
library(cluster)
library(factoextra)
library(shiny)

# Source analysis scripts
source("archive/analysis.r")
source("archive/analysis2.r")

# Run analysis
run_analysis()

# Launch Shiny app
runApp("app")
