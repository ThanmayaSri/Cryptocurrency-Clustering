# 📊 Cryptocurrency Clustering with K-Means & Hierarchical Clustering

An interactive R Shiny app that analyzes and visualizes cryptocurrency price patterns using K-Means and Hierarchical Clustering.

---

## 🔍 Project Overview

The cryptocurrency market is known for its high volatility and complexity. This project offers a data-driven approach to understand market trends and behavior by analyzing historical cryptocurrency prices. Using clustering techniques, it groups cryptocurrencies based on price movements and volatility, helping users uncover patterns, manage risk, and make informed investment decisions.

---

## 🎯 Objectives

- Analyze historical price data of multiple cryptocurrencies  
- Preprocess and clean the data for accurate analysis  
- Engineer features like returns, moving averages, and volatility  
- Normalize and reduce data dimensions using PCA  
- Cluster cryptocurrencies using K-Means and Hierarchical Clustering  
- Provide an interactive R Shiny app for exploring trends and insights  

---

## 💡 Techniques Used

- ✅ Data Cleaning & Feature Engineering  
- 📈 Daily Returns, Moving Averages, Volatility Calculation  
- 📊 Principal Component Analysis (PCA)  
- 🔀 K-Means Clustering & Elbow Method  
- 🌲 Hierarchical Clustering with Dendrograms  
- 💻 R Shiny App for deployment  

---

## 📁 Project Structure

- `data/` – Historical price datasets (from [Kaggle](https://www.kaggle.com/datasets/sudalairajkumar/cryptocurrencypricehistory))  
- `docs/` – Presentation slides and summary of methodology  
- `app.R` – Main R Shiny application file  
- `README.md` – Project documentation  

---

## 🧪 Data Preprocessing

- **Convert** date columns to proper format  
- **Format** numerical columns appropriately  
- **Handle** missing values by removing incomplete entries  
- **Calculate** daily returns, moving averages, and volatility  
- **Normalize** features for comparability  
- **Reduce** dimensionality with PCA  

---

## 🔍 Clustering Insights

- Cryptocurrencies are grouped into clusters with similar price behavior  
- Each cluster highlights unique market patterns (e.g., stability vs. volatility)  
- Helps inform portfolio diversification and risk management strategies  

---

## 🌐 Interactive Shiny App

Explore trends and cluster insights using our deployed Shiny app:

🔗 [**Launch the App**](https://projectsdm2.shinyapps.io/crypto-analysis/)

### Features:
- Select and compare cryptocurrencies  
- Visualize trends, clusters, and performance  
- Analyze key statistics and cluster memberships interactively  

---

## 🚀 How to Run the App Locally

1. Clone this repository  
2. Open the project in RStudio  
3. Install required R packages:
   ```R
   install.packages(c("shiny", "ggplot2", "dplyr", "cluster", "factoextra"))
