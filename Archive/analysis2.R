# Archive/analysis2.r

# Function to determine the optimal number of clusters using the Elbow Method
determine_optimal_clusters <- function(data) {
  set.seed(123)
  wss <- sapply(1:10, function(k){
    kmeans(data, centers = k, nstart = 10 )$tot.withinss
  })
  
  # Plot the Elbow Method
  plot(1:10, wss, type = "b", pch = 19, frame = FALSE,
       xlab = "Number of clusters K",
       ylab = "Total within-clusters sum of squares")
  
  # Return WSS values
  return(wss)
}
