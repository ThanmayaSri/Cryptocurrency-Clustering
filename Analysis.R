# analysis.r

library(shiny)
library(ggplot2)
library(plotly)
library(dplyr)

# Load the processed data
crypto_data <- readRDS("crypto_data.rds")

ui <- fluidPage(
  titlePanel("Cryptocurrency Analysis and Clustering"),
  
  sidebarLayout(
    sidebarPanel(
      selectInput("crypto", "Select Cryptocurrency:",
                  choices = unique(crypto_data$Symbol),
                  selected = unique(crypto_data$Symbol)[1]),
      dateRangeInput("dates", "Select Date Range:",
                     start = min(crypto_data$Date),
                     end = max(crypto_data$Date)),
      selectInput("yvar", "Select Y-axis Variable:",
                  choices = c("Close", "Volume", "Daily_Return"),
                  selected = "Close")
    ),
    
    mainPanel(
      tabsetPanel(
        tabPanel("Price Chart", plotlyOutput("pricePlot")),
        tabPanel("Cluster Membership", plotOutput("clusterPlot"))
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
           x = "Date", y = input$yvar)
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
}

# Run the application 
shinyApp(ui = ui, server = server)
