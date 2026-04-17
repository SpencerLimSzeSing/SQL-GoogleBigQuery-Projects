--1. Comprehensive Trends Table
--This query aggregates yearly data by climate zones and crop types to identify broad patterns in agricultural productivity and climate variables.

CREATE OR REPLACE TABLE `project-775e345d-e857-446c-863.agriculture_climate.comprehensive_trends` AS
SELECT
  Year,
  Country,
  Region,
  Crop_Type,
  AVG(Average_Temperature_C) AS Avg_Temperature,
  SUM(Total_Precipitation_mm) AS Total_Precipitation,
  AVG(Crop_Yield_MT_per_HA) AS Avg_Crop_Yield,
  SUM(Crop_Yield_MT_per_HA) AS Total_Crop_Yield,
  SUM(Extreme_Weather_Events) AS Total_Weather_Events,
  AVG(`Irrigation_Access_%`) AS Avg_Irrigation_Access,
  SUM(CO2_Emissions_MT) AS Total_CO2_Emissions
FROM `project-775e345d-e857-446c-863.agriculture_climate.cleaned_data`
GROUP BY 1, 2, 3, 4
ORDER BY 1, 2, 3;
--==============================================================

--2. Geographic Metrics Table
--This query focuses on geographical trends by aggregating metrics specifically by country and region

CREATE OR REPLACE TABLE `project-775e345d-e857-446c-863.agriculture_climate.geographic_metrics` AS
SELECT
  Year,              -- Position 1
  Country,           -- Position 2
  Region,            -- Position 3
  CASE 
    WHEN Country IN ('Brazil', 'India', 'Nigeria') THEN 'Tropical'
    WHEN Country IN ('Argentina', 'China', 'France', 'USA') THEN 'Temperate'
    WHEN Country IN ('Australia') THEN 'Arid'
    WHEN Country IN ('Canada', 'Russia') THEN 'Cold'
    ELSE 'Other'
  END AS Climate_Group, -- Position 4
  CASE 
    WHEN Crop_Type IN ('Corn', 'Rice', 'Wheat', 'Barley') THEN 'Cereal/Grain'
    WHEN Crop_Type IN ('Soybeans') THEN 'Legume'
    WHEN Crop_Type IN ('Cotton', 'Coffee', 'Sugarcane') THEN 'Cash Crop'
    WHEN Crop_Type IN ('Fruits', 'Vegetables') THEN 'Fruits/Vegetables'
    ELSE 'Other'
  END AS Crop_Category, -- Position 5
  Crop_Type,            -- Position 6
  
  -- Aggregated Metrics (These don't need to be in GROUP BY)
  AVG(Crop_Yield_MT_per_HA) AS Avg_Crop_Yield,
  SUM(CO2_Emissions_MT) AS Total_CO2_Emissions,
  SUM(Total_Precipitation_mm) AS Total_Precipitation,
  AVG(Average_Temperature_C) AS Avg_Temperature,
  SUM(Extreme_Weather_Events) AS Total_Weather_Events
FROM 
  `project-775e345d-e857-446c-863.agriculture_climate.cleaned_data`
GROUP BY 
  1, 2, 3, 4, 5, 6; 

--==============================================================

--3. Climate Impact Analysis on Rice Table
--This advanced query narrows the study to rice production between 2020 and 2024. It utilizes window functions to calculate normalized values for precipitation, temperature, and extreme weather events to allow for direct comparison of climate impacts across different countries

CREATE OR REPLACE TABLE `project-775e345d-e857-446c-863.agriculture_climate.climate_impact_analysis_on_rice` AS
WITH CountryStats AS (
  SELECT
    Country,
    AVG(Average_Temperature_C) AS Avg_Temperature_C,
    AVG(Total_Precipitation_mm) AS Avg_Precipitation_mm,
    AVG(Extreme_Weather_Events) AS Avg_Extreme_Weather_Events,
    AVG(Crop_Yield_MT_per_HA) AS Avg_Crop_Yield_MT_per_HA
  FROM
    `project-775e345d-e857-446c-863.agriculture_climate.cleaned_data`
  WHERE
    Crop_Type = 'Rice' 
    AND Year BETWEEN 2020 AND 2024
  GROUP BY
    Country
)
SELECT
  *,
  -- Normalized Precipitation
  SAFE_DIVIDE(
    (Avg_Precipitation_mm - MIN(Avg_Precipitation_mm) OVER()),
    (MAX(Avg_Precipitation_mm) OVER() - MIN(Avg_Precipitation_mm) OVER())
  ) AS Norm_Avg_Precipitation,
  -- Normalized Temperature
  SAFE_DIVIDE(
    (Avg_Temperature_C - MIN(Avg_Temperature_C) OVER()),
    (MAX(Avg_Temperature_C) OVER() - MIN(Avg_Temperature_C) OVER())
  ) AS Norm_Avg_Temperature,
  -- Normalized Extreme Weather Events
  SAFE_DIVIDE(
    (Avg_Extreme_Weather_Events - MIN(Avg_Extreme_Weather_Events) OVER()),
    (MAX(Avg_Extreme_Weather_Events) OVER() - MIN(Avg_Extreme_Weather_Events) OVER())
  ) AS Norm_Avg_Extreme_Weather
FROM
  CountryStats;