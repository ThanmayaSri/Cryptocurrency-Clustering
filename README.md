# 📊 Cryptocurrency Clustering with K-Means & PCA

An interactive R Shiny application that analyzes and visualizes cryptocurrency price patterns using K-Means clustering and Principal Component Analysis (PCA).

---

## 🔍 Project Overview

The cryptocurrency market is renowned for its high volatility and complexity. This project provides a data-driven approach to understand market trends by analyzing historical cryptocurrency prices. By employing clustering techniques, the application groups cryptocurrencies based on their price movements and volatility, aiding users in identifying patterns, managing risk, and making informed investment decisions.

---

## 🎯 Objectives

- **Analyze** historical price data of multiple cryptocurrencies  
- **Preprocess** and clean the data to ensure accuracy  
- **Engineer** features such as returns, moving averages, and volatility  
- **Normalize** and **reduce** data dimensions using PCA  
- **Cluster** cryptocurrencies using K-Means clustering  
- **Develop** an interactive R Shiny app for data exploration and visualization  

---

## 💡 Techniques Used

- 📈 Daily Returns, Moving Averages, Volatility Calculation  
- 📊 Principal Component Analysis (PCA)  
- 🔀 K-Means Clustering with Elbow Method  
- 💻 Interactive R Shiny App  

---

## 📁 Project Structure

- `App/` – R Shiny UI and server scripts  
- `Archive/` – Archived datasets and scripts  
- `Analysis.R` – Core script for data transformation and clustering  
- `deploy.R` – Deployment script for shinyapps.io  
- `run.R` – Entry point to launch the Shiny app locally  
- `.gitignore` – Specifies ignored files  
- `README.md` – Project documentation  

---

## 🧪 Data Preprocessing

- Convert date columns to `Date` format  
- Format numerical columns properly  
- Handle missing values (e.g., by dropping or imputing)  
- Compute daily returns, moving averages, and volatility  
- Normalize features to ensure scale consistency  
- Apply PCA to reduce dimensionality  

---

## 🔍 Clustering Insights

- Cryptocurrencies are grouped by similar price movement behavior  
- Clusters reveal insights on market trends, volatility, and stability  
- Useful for diversification and strategic investment decisions  

---

## 🌐 Live Demo

Explore the Shiny app here:  
🔗 [https://projectsdm2.shinyapps.io/crypto-analysis/](https://projectsdm2.shinyapps.io/crypto-analysis/)

---

## 🚀 How to Run the App Locally

1. Clone this repository  
   ```bash
   git clone https://github.com/ThanmayaSri/Cryptocurrency-Clustering.git
