# 📊 Cryptocurrency Clustering with K-Means & Hierarchical Clustering

An interactive R Shiny app that analyzes and visualizes cryptocurrency price patterns using K-Means and Hierarchical Clustering.

---

## 🔍 Project Overview

This project explores historical cryptocurrency market behavior by clustering similar coins based on price fluctuations and returns. It helps investors and analysts identify patterns, optimize portfolios, and understand market volatility using AI-powered statistical methods.

---

## 💡 Techniques Used
- Principal Component Analysis (PCA)
- K-Means Clustering
- Hierarchical Clustering (Dendrograms)
- R Shiny for deployment

---

## 📁 Project Structure
- `data/` – Historical price datasets (from [Kaggle](https://www.kaggle.com/datasets/sudalairajkumar/cryptocurrencypricehistory))
- `docs/` – Presentation slides outlining methodology and results

---

## 🚀 How to Run the App

1. Clone this repository
2. Open RStudio and install required packages:
   ```R
   install.packages(c("shiny", "ggplot2", "dplyr", "cluster", "factoextra"))

