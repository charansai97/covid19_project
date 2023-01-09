#HOW MANY COVID-19 CASES IN THE INDIA?HOW MANY DEATHS?WHAT IS THE PERCENTAGE DEATH RATE?

 SELECT location,date,total_cases,total_deaths,(total_deaths/total_cases)*100 AS Deathpercent
FROM covidproject
WHERE location LIKE '%INDIA%'
ORDER BY date;

SELECT location,MAX(CAST(total_cases AS INT)) AS TOTAL_CASES,MAX(CAST(total_deaths AS INT))AS TOTAL_DEATHS,(MAX(CONVERT(INT,total_deaths))/MAX(total_cases))*100 AS DEATH_PER_RATE
FROM covidproject
WHERE location LIKE '%INDIA%'
GROUP BY location;

#as of november 2022 there are 44671708 total cases and the death percentage is about 1.18%
#this means that 44671708 people have been infected by COVID-19 since JAN 2020 and that there is about a 1.18% chance of dying if you contract COVID-19 while living in INDIA.

#THIS SHOW WHAT PERCENTAGE OF THE INDIAN POPULATION WAS INFECTED WITH COVID-19
SELECT LOCATION,MAX(total_cases)AS TOTAL_CASES,MAX(CAST(total_deaths AS INT))AS TOTAL_DEATH,(MAX(total_cases)/MAX(population))*100 AS POPULATION_INFECTED_PER,(MAX(CAST(total_deaths AS INT))/MAX(population))*100 AS POPULATION_DEATH_PER
FROM covidproject
WHERE location LIKE '%INDIA%'
GROUP BY location;
#3.15% POPULATION OF INDIA WAS INFECTED AND 0.037% POPULATION OF INDIA WAS DEAD BY COVID-19 TILL NOVEMBER 2022


#SHOWING COUNTRIES WITH HIGHEST INFECTION RATE COMPARED TO THEIR POPULATION
SELECT LOCATION, MAX(total_cases)AS TOTAL_CASES,MAX(population)AS TOTAL_POPULATION,(MAX(TOTAL_CASES)/MAX(population))*100 AS POPULATION_INFECTED_PER
FROM covidproject
GROUP BY location
ORDER BY POPULATION_INFECTED_PER DESC;

#WHERE is india place

SELECT LOCATION, MAX(total_cases)AS TOTAL_CASES,MAX(population)AS TOTAL_POPULATION,(MAX(TOTAL_CASES)/MAX(population))*100 AS POPULATION_INFECTED_PER
FROM covidproject
WHERE LOCATION LIKE '%INDIA%'
GROUP BY location;
#THE COUNTRY WITH THE HUGHEST INFECTION RATE IS CYPRUS.THE INDIA HAS AN INFECTION RATE OF 3.15% AND WE'RE 160TH

#SHOWING THE CONTRIES WITH HIGHEST DEATH COUNT PER POPULATION IN 2022,2021 AND 2020

SELECT LOCATION, MAX(CAST(total_deaths AS int))AS TOTAL_DEATH
FROM covidproject
WHERE continent IS NOT NULL 
GROUP BY location
ORDER BY TOTAL_DEATH DESC;

#2021
SELECT LOCATION, MAX(CAST(total_deaths AS int))AS TOTAL_DEATH
FROM covidproject
WHERE continent IS NOT NULL AND (DATEPART(YY,DATE)=2021)
GROUP BY location
ORDER BY TOTAL_DEATH DESC

#2020
SELECT LOCATION, MAX(CAST(total_deaths AS int))AS TOTAL_DEATH
FROM covidproject
WHERE continent IS NOT NULL AND (DATEPART(YY,DATE)=2020)
GROUP BY location
ORDER BY TOTAL_DEATH DESC;

#THE UNITED STATE, BRAZIL AND INDIA HAVE THE HIGHEST DEATH COUNTS EACH YEAR.
#THE DEATH COUNT IN MEXICO HAS IMPROVED SINCE 2020, GOING FROM 4TH PLACE TO 5TH UK WENT FROM 5TH TO 7TH.RUSSIA WENT FROM 9TH TO 4TH

#HIGHEST INFECTION COUNT AND HIGHEST DEATH COUNT BY CONTINENT 

#HIGHEST INFECTION COUNT
SELECT continent,MAX(total_cases)AS TOTAL_CASES_COUNT
FROM covidproject
WHERE continent IS NOT NULL
GROUP BY continent
ORDER BY TOTAL_CASES_COUNT DESC;

#HIGHEST DEATH COUNT
SELECT continent,MAX(CAST(total_deaths AS INT))AS TOTAL_DEATH_COUNT
FROM covid project
WHERE continent IS NOT NULL
GROUP BY continent
ORDER BY TOTAL_DEATH_COUNT DESC;

#AS OF NOW NORTH AMERICA HAS THE HIGHEST INFECTION COUNT AND HIGHEST DEATH COUNT

#WHAT IS THE GLOBAL DEATH PERCENTAGE PER DAY?
SELECT DATE,SUM(new_cases) AS TOTAL_CASES,SUM(CAST(NEW_DEATHS AS INT)) AS TOTAL_DEATHS,(SUM(CAST(NEW_DEATHS AS INT))/SUM(new_cases))*100 AS GLOBAL_DEATH_PER
FROM covidproject
WHERE continent IS NOT NULL
GROUP BY DATE
ORDER BY TOTAL_CASES,date;

Select SUM(new_cases) as total_cases, SUM(new_deaths) as total_deaths, SUM(new_deaths)/SUM(New_Cases)*100 as DeathPercentage
From covidproject
where continent is not null 
order by 1,2;

SELECT continent,total_deaths as total_death_count
FROM covidproject
WHERE continent IS NOT NULL
ORDER BY total_death_count DESC;


SELECT
	location, 
	population, 
	MAX(total_cases) AS highest_infection_count,  
	Max((total_cases/population))*100 AS percent_population_infected
FROM 
	covidproject
GROUP BY location, population
ORDER BY percent_population_infected DESC;

SELECT 
	location, 
	population, 
	date,
	MAX(total_cases) AS highest_infection_count,  
	Max((total_cases/population))*100 AS percent_population_infected
FROM 
	covidproject
GROUP BY location, population, date
ORDER BY percent_population_infected DESC;

SELECT 
	date,location,
	SUM(new_cases) AS total_cases, 
	SUM(new_deaths) AS total_deaths, 
	SUM(new_deaths)/SUM(new_cases)*100 AS global_death_pecentage
FROM 
	covidproject
WHERE continent IS NOT NULL
GROUP BY date,location
ORDER BY date, total_cases;

SELECT 
	continent, 
	MAX(total_deaths) as total_death_count
FROM 
	covidproject
WHERE 
	continent IS NOT NULL
GROUP BY continent
ORDER BY total_death_count DESC