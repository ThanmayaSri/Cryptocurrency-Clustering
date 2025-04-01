run_analysis <- function() {
  # Load necessary libraries
  library(dplyr)
  library(lubridate)
  library(ggplot2)
  library(cluster)
  library(factoextra)
  library(TTR)
  
  # Get list of CSV files in the archive folder, excluding combined data
  file_list <- list.files("archive", pattern = "^coin_.*\\.csv$", full.names = TRUE)
  
  # Initialize an empty list to store data
  crypto_data_list <- list()
  
  # Loop through each file and read the data
  for (file in file_list) {
    # Read the CSV file
    data <- read.csv(file)
    
    # Extract the symbol from the file name (between 'coin_' and '.csv')
    symbol <- sub(".*coin_(.+)\\.csv$", "\\1", basename(file))
    
    # Skip if this is the combined data file
    if (symbol == "combined_crypto_data") {
      next
    }
    
    # Convert Date column to Date type
    data$Date <- as.Date(data$Date, format = "%Y-%m-%d")
    
    # Convert numerical columns
    num_cols <- c("Open", "High", "Low", "Close", "Volume", "Marketcap")
    data[num_cols] <- lapply(data[num_cols], as.numeric)
    
    # Add Symbol column
    data$Symbol <- symbol
    
    # Print debug information
    print(paste("Processing:", symbol))
    
    # Append to the list
    crypto_data_list[[symbol]] <- data
  }
  
  # Combine all data into a single data frame
  crypto_data <- bind_rows(crypto_data_list)
  
  # Print unique symbols for debugging
  print("Unique symbols in dataset:")
  print(unique(crypto_data$Symbol))
  
  # Remove missing values
  crypto_data <- na.omit(crypto_data)
  
  # Feature Engineering
  
  # Calculate Daily Return, Moving Average, and Volatility
  crypto_data <- crypto_data %>%
    arrange(Symbol, Date) %>%
    group_by(Symbol) %>%
    mutate(
      Daily_Return = (Close - lag(Close)) / lag(Close),
      MA7 = SMA(Close, n = 7),
      Volatility = runSD(Close, n = 7)
    ) %>%
    ungroup()
  
  # Remove NA values from rolling calculations
  crypto_data <- na.omit(crypto_data)
  
  # Normalize features
  normalize <- function(x) {
    return ((x - min(x)) / (max(x) - min(x)))
  }
  
  crypto_data <- crypto_data %>%
    mutate(
      Open = normalize(Open),
      High = normalize(High),
      Low = normalize(Low),
      Close = normalize(Close),
      Volume = normalize(Volume),
      Daily_Return = normalize(Daily_Return),
      MA7 = normalize(MA7),
      Volatility = normalize(Volatility)
    )
  
  # Dimensionality Reduction with PCA
  features <- crypto_data %>%
    select(Open, High, Low, Close, Volume, Daily_Return, MA7, Volatility)
  
  pca_result <- prcomp(features, scale. = TRUE)
  
  # Append PCA results to the data
  pca_scores <- as.data.frame(pca_result$x)
  crypto_data <- cbind(crypto_data, pca_scores)
  
  # Clustering
  
  set.seed(123)
  
  # Determine optimal clusters (e.g., k = 3)
  k <- 3
  kmeans_result <- kmeans(features, centers = k, nstart = 25)
  
  # Add cluster assignments
  crypto_data$Cluster <- kmeans_result$cluster
  
  # Save processed data in multiple locations for flexibility
  saveRDS(crypto_data, file = "app/crypto_data.rds")
  saveRDS(crypto_data, file = "crypto_data.rds")  # Also save in root directory
  
  # Print confirmation
  print("Data processed and saved successfully")
}
