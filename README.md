# SQL and Google BigQuery Projects
This project develops an end-to-end data pipeline on Google Cloud Platform (GCP) to analyze how rising global temperatures and extreme weather events affect agricultural productivity across the dataset.

## Project Title: Comprehensive Agricultural & Climate Trend Analysis
### Background
Climate change is now one of the biggest risks to global food security. As temperatures rise, rainfall patterns shift, and extreme weather becomes more common, agricultural productivity takes a direct hit. Governments and agricultural organizations need solid data to spot vulnerable regions, track climate trends, and plan adaptation strategies.

The challenge is that the data are scattered across multiple sources, making it hard to turn raw numbers into insights without scalable, cloud-based analytics. There is no centralized platform for agricultural stakeholders to answer questions:

- Which countries have experienced the greatest decline in crop yield over time?
- Which climate zones are most vulnerable to extreme weather events?
- Which crop types are the most climate-resilient?
- Does increasing temperature correspond to declining agricultural productivity?
- Is there any observable relationship between CO₂ emissions and crop yield?
- How has agricultural productivity shifted over time?

Without large-scale analytics, these patterns stay buried in disconnected datasets instead of informing decisions.

### Project Goal
Build an end-to-end cloud analytics pipeline that turns raw climate and agriculture data into interactive dashboards — so users can track climate risks, compare performance across countries and crops, and spot long-term trends as they emerge.

## Dataset
- **Source:** [Kaggle (Global Agriculture Climate Impact Dataset)](https://www.kaggle.com/datasets/talhachoudary/global-agriculture-climate-impact-dataset/data)
- **File:** `dataset.csv`
- **Size:** 10,000 rows of global agricultural and climatic data
- **Features:** Year, Country, Region, Crop Type, Average Temperature, Total Precipitation, CO2 Emissions, Crop Yield (MT per HA), Extreme Weather Events, and Soil Health Index 


## Technical Architecture 
- Data Ingestion: Automated via Kaggle API and decoupled using **Google Cloud Pub/Sub** messaging

- Data Storage: Raw data is stored in **Google Cloud Storage (GCS)** for consistency and durability

- Data Processing:**Google Dataflow** handles cleaning and type formatting 

- Data Analytics: **Google BigQuery** serves as the primary "big SQL database" for complex transformations, analytics, and large-scale dataset management.

[View BigQuery SQL as download file](https://github.com/SpencerLimSzeSing/SQL-GoogleBigQuery-Projects/blob/main/SQL%20script.sql)

- Data Visualization: **Looker Studio** provides the final "storytelling" layer for creating interactive dashboards and visualizing the interplay between climate and yield.

[View Project on Looker Studio](https://datastudio.google.com/s/pdKTIuOlge0)

<div align="center">
  <img src="image/pipelinediagram.png" alt="Figure 1 - Proposed pipeline diagram">
  <p><i>Figure 1: The end-to-end GCP architecture, from Kaggle API ingestion to Looker Studio visualization.</i></p>
</div>

## Data Insights & Outcomes 
- The analysis successfully identified several critical relationships between climate variables and food security

- Climate Vulnerability: Tropical regions (e.g., Nigeria) show declining yields due to extreme weather, while temperate regions (e.g., USA) remain stable through technological adaptation

- Crop Resilience: Cereals and grains show high stability, whereas cash crops (coffee, sugarcane) exhibit high volatility due to environmental sensitivity

- Environmental Correlation: Identified a slight positive correlation between CO2 emissions and average temperature, with rice and cotton identified as the highest-emitting crops

<div align="center">
  <img src="image/GeographicTrend.png" alt="Figure 2 - Geographic Trend">
  <p><i>Figure 2 - Geographic Trend</i></p>
</div>
<div align="center">
  <img src="image/YearlyTrendbyClimateMetrics.png" alt="Figure  3 - Yearly Trendby Climate Metrics">
  <p><i>Figure  3 - Yearly Trendby Climate Metrics</i></p>
</div>
<div align="center">
  <img src="image/Dashboard.png" alt="Figure 4 - Dashboard">
  <p><i>Figure 2 - Geographic Trend</i></p>
</div>

## Skills Demonstrated:
### SQL Querying & Cloud Architecture
- Advanced Analytics: Leveraged Window Functions (MIN/MAX OVER) and aggregations (SUM, AVG) to normalize climate data across 10k+ records.
- Data Modeling: Engineered specialized analytical tables (geographic_metrics) to optimize BigQuery performance for downstream BI tools.
- Query Optimization: Structured queries for sub-second execution in BigQuery, minimizing compute costs and latency.
- End-to-End Pipelines: Architected a seamless flow from GCS and Dataflow into BigQuery.

### Analytical Skills
- Correlation Analysis: Identified key relationships between CO2 emissions, temperature spikes, and crop yield volatility.
- Geographic Intelligence: Derived regional climate-risk profiles for tropical vs. temperate agriculture (e.g., Nigeria vs. USA).
