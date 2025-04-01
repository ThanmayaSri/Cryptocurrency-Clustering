if (!require(shiny)) install.packages("shiny")
if (!require(ggplot2)) install.packages("ggplot2")
if (!require(plotly)) install.packages("plotly")
if (!require(dplyr)) install.packages("dplyr")

library(shiny)
library(ggplot2)
library(plotly)
library(dplyr)

# Load the processed data with error handling
crypto_data <- tryCatch({
  # Try different possible paths
  if (file.exists("crypto_data.rds")) {
    readRDS("crypto_data.rds")
  } else if (file.exists("../app/crypto_data.rds")) {
    readRDS("../app/crypto_data.rds")
  } else if (file.exists("app/crypto_data.rds")) {
    readRDS("app/crypto_data.rds")
  } else {
    stop("Could not find crypto_data.rds in any of the expected locations")
  }
}, error = function(e) {
  stop("Error loading data: ", e$message, 
       "\nRun the data processing script (run.R) first.")
})

ui <- fluidPage(
  tags$head(
    tags$style(HTML("
      .sidebar { background-color: #f8f9fa; padding: 15px; }
      .content { padding: 15px; }
    "))
  ),
  
  titlePanel("Cryptocurrency Analysis and Clustering"),
  
  sidebarLayout(
    sidebarPanel(
      class = "sidebar",
      selectInput("crypto", "Select Cryptocurrency:",
                  choices = unique(crypto_data$Symbol),
                  selected = unique(crypto_data$Symbol)[1]),
      dateRangeInput("dates", "Select Date Range:",
                     start = min(crypto_data$Date),
                     end = max(crypto_data$Date)),
      selectInput("yvar", "Select Y-axis Variable:",
                  choices = c("Close", "Volume", "Daily_Return"),
                  selected = "Close"),
      hr(),
      helpText("Select a cryptocurrency and time range to analyze its performance")
    ),
    
    mainPanel(
      class = "content",
      tabsetPanel(
        tabPanel("Price Chart", 
                 plotlyOutput("pricePlot"),
                 hr(),
                 verbatimTextOutput("stats")),
        tabPanel("Cluster Membership", 
                 plotOutput("clusterPlot"),
                 hr(),
                 helpText("Clustering shows how cryptocurrencies group based on their behavior"))
      )
    )
  )
)

server <- function(input, output) {
  filtered_data <- reactive({
    crypto_data %>%
      filter(Symbol == input$crypto,
             Date >= input$dates[1],
             Date <= input$dates[2])
  })
  
  output$pricePlot <- renderPlotly({
    p <- ggplot(filtered_data(), aes(x = Date, y = .data[[input$yvar]])) +
      geom_line(color = "blue") +
      labs(title = paste(input$yvar, "of", input$crypto),
           x = "Date", y = input$yvar) +
      theme_minimal()
    ggplotly(p)
  })
  
  output$clusterPlot <- renderPlot({
    ggplot(filtered_data(), aes(x = PC1, y = PC2, color = as.factor(Cluster))) +
      geom_point() +
      labs(title = "Cluster Membership",
           x = "Principal Component 1",
           y = "Principal Component 2",
           color = "Cluster") +
      theme_minimal()
  })
  
  output$stats <- renderPrint({
    data <- filtered_data()
    summary_stats <- data %>%
      summarise(
        Mean = mean(.data[[input$yvar]], na.rm = TRUE),
        SD = sd(.data[[input$yvar]], na.rm = TRUE),
        Min = min(.data[[input$yvar]], na.rm = TRUE),
        Max = max(.data[[input$yvar]], na.rm = TRUE)
      )
    cat("Summary Statistics:\n")
    print(summary_stats)
  })
}

shinyApp(ui = ui, server = server) 
