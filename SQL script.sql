--1. Comprehensive Trends Table
--This query aggregates yearly data by climate zones and crop types to identify broad patterns in agricultural productivity and climate variables.

CREATE OR REPLACE TABLE `bdaa-agriculture.agriculture_climate.comprehensive_trends` AS
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
FROM `bdaa-agriculture.agriculture_climate.cleaned_data`
GROUP BY Year, Country, Region, Crop_Type
ORDER BY Year, Country, Region;

--==============================================================

--2. Geographic Metrics Table
--This query focuses on geographical trends by aggregating metrics specifically by country and region

CREATE OR REPLACE TABLE `bdaa-agriculture.agriculture_climate.geographic_metrics` AS
SELECT
  Country,
  Region,
  AVG(Average_Temperature_C) AS Avg_Temperature,
  SUM(Crop_Yield_MT_per_HA) AS Total_Crop_Yield,
  AVG(`Irrigation_Access_%`) AS Avg_Irrigation_Access,
  SUM(Extreme_Weather_Events) AS Total_Weather_Events
FROM `bdaa-agriculture.agriculture_climate.cleaned_data`
GROUP BY Country, Region
ORDER BY Country, Region;

--==============================================================

--3. Climate Impact Analysis on Rice Table
--This advanced query narrows the study to rice production between 2020 and 2024. It utilizes window functions to calculate normalized values for precipitation, temperature, and extreme weather events to allow for direct comparison of climate impacts across different countries

CREATE TABLE `bdaa-project-gp1.climate_change_impact_on_agriculture_2024.climate_impact_analysis_on_rice` AS
SELECT
  Country,
  AVG(Average_Temperature_C) AS Avg_Temperature_C,
  AVG(Total_Precipitation_mm) AS Avg_Precipitation_mm,
  AVG(Extreme_Weather_Events) AS Avg_Extreme_Weather_Events,
  AVG(Crop_Yield_MT_per_HA) AS Avg_Crop_Yield_MT_per_HA,
  -- Normalized Precipitation
  (AVG(Total_Precipitation_mm) - MIN(AVG(Total_Precipitation_mm)) OVER()) /
  (MAX(AVG(Total_Precipitation_mm)) OVER() - MIN(AVG(Total_Precipitation_mm)) OVER()) AS Norm_Avg_Precipitation,
  -- Normalized Temperature
  (AVG(Average_Temperature_C) - MIN(AVG(Average_Temperature_C)) OVER()) /
  (MAX(AVG(Average_Temperature_C)) OVER() - MIN(AVG(Average_Temperature_C)) OVER()) AS Norm_Avg_Temperature,
  -- Normalized Extreme Weather Events
  (AVG(Extreme_Weather_Events) - MIN(AVG(Extreme_Weather_Events)) OVER()) /
  (MAX(AVG(Extreme_Weather_Events)) OVER() - MIN(AVG(Extreme_Weather_Events)) OVER()) AS Norm_Avg_Extreme_Weather
FROM
  `bdaa-project-gp1.climate_change_impact_on_agriculture_2024.climate_impact_analysis`
WHERE
  Crop_Type = 'Rice' AND Year BETWEEN 2020 AND 2024
GROUP BY
  Country;