# SQL and Google BigQuery Projects
This repository documents a SQL and Google BigQuery project focused on analyzing the relationship between climate variables and global agricultural productivity. This project demonstrates the ability to process large environmental datasets, perform complex normalization using SQL, and generate actionable insights to address global food security challenges. 


## Project Title: Comprehensive Agricultural & Climate Trend Analysis
This project utilizes SQL to aggregate yearly performance data across different climate zones and crop types. By calculating metrics such as average crop yield, total precipitation, and extreme weather frequency, the analysis identifies specific vulnerabilities in global food systems. Furthermore, advanced SQL techniques were used to calculate normalized climate impacts for specific crops like rice, allowing for a direct comparison of environmental stress across diverse geographic regions.

### Dataset
- **Source:** Kaggle (Global Agriculture Climate Impact Dataset)
- **File:** `dataset.csv`
- **Size:** 10,000 rows of global agricultural and climatic data
- **Features:** Year, Country, Region, Crop Type, Average Temperature, Total Precipitation, CO2 Emissions, Crop Yield (MT per HA), Extreme Weather Events, and Soil Health Index 

[View Project on Looker Studio](https://datastudio.google.com/s/pdKTIuOlge0)

[View BigQuery SQL as download file](https://github.com/SpencerLimSzeSing/SQL-GoogleBigQuery-Projects/blob/main/SQL%20script.sql)


## Tools Used:
- **Google BigQuery:** Served as the primary "big SQL database" for complex data transformations, analytics, and large-scale dataset management.
- **Google Cloud Storage (GCS):** Used for secure, scalable storage of raw agricultural data buckets.
- **Google Dataflow:** Employed for data preprocessing and cleaning to ensure a robust foundation for analysis.
- **Google Cloud Pub/Sub:** Facilitated the initial data ingestion and messaging service to decouple the pipeline.
- **Looker Studio:** Used for creating interactive dashboards and visualizing the interplay between climate and yield.

### Skills Demonstrated:
### SQL Querying and Data Management

- Data Aggregation: Expertise in using SQL functions like AVG and SUM to derive trends from 10,000 records, grouped by year, country, and crop type.
- Advanced Window Functions: Proficiency in using Window Functions (MIN/MAX OVER()) to calculate normalized values for precipitation and temperature, enabling objective comparison of climate impacts.
- Data Transformation: Ability to create specialized analytical tables such as comprehensive_trends and geographic_metrics to optimize datasets for BI reporting.
- Query Optimization: Demonstrated ability to structure queries that BigQuery can process in under one second, ensuring high performance even during complex aggregations

### Google BigQuery & Cloud Architecture

- Pipeline Integration: Experience integrating BigQuery with GCS and Dataflow to create a seamless end-to-end data pipeline.
- Performance Evaluation: Competence in analyzing query execution details, including monitoring slot time, bytes processed, and stage-specific durations (Input, Aggregate, Output).
- Scalability Testing: Ability to assess the platform’s capacity to handle growing data volumes while maintaining responsive dashboard rendering.

### Analytical Skills
- Correlation Analysis: Experience in identifying relationships between variables, such as the positive correlation between CO2 emissions and temperature, and the negative impact of extreme weather on yields.
- Geographic Insights: Ability to derive specialized regional insights, such as identifying how specific countries (e.g., Nigeria, USA) specialize in crops based on their unique climate profiles.
- Insight Generation: Translating complex data into strategic findings, such as recognizing the stability of cereal yields compared to the volatility of cash crops under changing climate conditions.
