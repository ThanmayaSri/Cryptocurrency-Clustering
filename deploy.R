# Install rsconnect if not already installed
if (!require(rsconnect)) {
  install.packages('rsconnect')
}

library(rsconnect)

# Configure account with the correct credentials
rsconnect::setAccountInfo(
  name='projectsdm2',
  token='4EBAE4D97D6ADC75E3C9D66576C7D9E7',
  secret='xGacWMO+DebueOn/ugCrzM4EQqyWBHpzl0UpdytW'
)

# Deploy the application
tryCatch({
  rsconnect::deployApp(
    appDir = 'app',
    appName = 'crypto-analysis',
    appTitle = "Cryptocurrency Analysis"
  )
}, error = function(e) {
  cat("Deployment Error:", e$message, "\n")
  cat("Check internet connection and credentials.\n")
})
