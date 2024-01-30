USE COUNTRY

-- HDI_GROWTH PER COUNTRY
SELECT TOP 5 HDI_GROWTH, COUNTRY FROM COUNTRY_DATA
ORDER BY HDI_GROWTH DESC;

-- NOMINAL GDPS PER COUNTRY
SELECT TOP 5 IMF_FORECAST_GDP_NOMINAL, UN_FORECAST_GDP_NOMINAL, WORLD_BANK_FORECAST_GDP_NOMINAL, COUNTRY FROM COUNTRY_DATA
ORDER BY IMF_FORECAST_GDP_NOMINAL, UN_FORECAST_GDP_NOMINAL, WORLD_BANK_FORECAST_GDP_NOMINAL DESC;

-- PPP GDPS PER COUNTRY
SELECT TOP 5 IMF_FORECAST_GDP_PPP, CIA_FORECAST_GDP_PPP, WORLD_BANK_FORECAST_GDP_PPP, COUNTRY FROM COUNTRY_DATA
ORDER BY IMF_FORECAST_GDP_PPP, CIA_FORECAST_GDP_PPP, WORLD_BANK_FORECAST_GDP_PPP DESC;

-- TOP 5 COUNTRIES WITH HIGHEST INTERNET USERS
SELECT TOP 5 INTERNET_USERS,COUNTRY FROM COUNTRY_DATA 
ORDER BY INTERNET_USERS DESC;

-- PERCENTAGE OF INTERNET USERS PER COUNTRY(TOP 10)
WITH CTE_MAIN AS 
(SELECT ((INTERNET_USERS/POPULATION_2023) * 100) AS P_OF_INTERNET_USERS,COUNTRY FROM COUNTRY_DATA
)
SELECT TOP 10 P_OF_INTERNET_USERS,COUNTRY FROM CTE_MAIN 
ORDER BY P_OF_INTERNET_USERS DESC

-- POPULATION CHANGE AND GDP PPP PER COUNTRY(TOP 20)
SELECT TOP 20 POPULATION_CHANGE, WORLD_BANK_FORECAST_GDP_PPP, COUNTRY FROM COUNTRY_DATA
ORDER BY WORLD_BANK_FORECAST_GDP_PPP DESC , POPULATION_CHANGE DESC;

-- POPULATION CHANGE AND HDI GROWTH PER COUNTRY(TOP 20)
SELECT TOP 20 POPULATION_CHANGE, HDI_GROWTH, COUNTRY FROM COUNTRY_DATA
ORDER BY HDI_GROWTH DESC ,POPULATION_CHANGE DESC;

-- TOTAL GDP PER CONTINENT
SELECT ROUND(SUM(WORLD_BANK_FORECAST_GDP_PPP),0) AS TOTAL_GDP ,UN_CONTINENTAL_REGION FROM COUNTRY_DATA
GROUP BY UN_CONTINENTAL_REGION
ORDER BY TOTAL_GDP DESC

