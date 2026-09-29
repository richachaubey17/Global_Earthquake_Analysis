SET GLOBAL local_infile = 1;
SHOW GLOBAL VARIABLES LIKE 'local_infile';
show databases;
create database if not exists earthquake_db;
USE earthquake_db;
TRUNCATE TABLE earthquakes;
CREATE TABLE if not exists earthquakes (
    Date DATETIME,
    Title VARCHAR(255),
    Magnitude DECIMAL(4,2),
    Place VARCHAR(255),
    Latitude DECIMAL(10,6),
    Longitude DECIMAL(10,6),
    Depth_km DECIMAL(8,3)
);
USE earthquake_db;

LOAD DATA LOCAL INFILE 'C:/Users/hp/OneDrive/Desktop/Catalogue/world_M6_earthquakes_1.csv'
INTO TABLE earthquakes
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
select * from earthquakes;
-- Objective 1 — Understand the dataset
SELECT COUNT(*) AS total_earthquakes
FROM earthquakes;
SELECT *
FROM earthquakes
LIMIT 10;
describe earthquakes;
SELECT
    COUNT(*) AS total,
    COUNT(Date) AS date_available,
    COUNT(Magnitude) AS magnitude_available,
    COUNT(Latitude) AS latitude_available,
    COUNT(Longitude) AS longitude_available,
    COUNT(Depth_km) AS depth_available
FROM earthquakes;

-- Objective 2 — Understand earthquake magnitude distribution
SELECT AVG(Magnitude) AS avg_magnitude
FROM earthquakes;

SELECT
    MIN(Magnitude) AS minimum_magnitude,
    MAX(Magnitude) AS maximum_magnitude
FROM earthquakes;

SELECT
    COUNT(*) AS total_events,
    MIN(Magnitude) AS min_mag,
    MAX(Magnitude) AS max_mag,
    AVG(Magnitude) AS avg_mag,
    STDDEV(Magnitude) AS std_mag
FROM earthquakes;

SELECT
    Title,
    Magnitude,
    CASE
        WHEN Magnitude >= 8 THEN 'Great'
        WHEN Magnitude >= 7 THEN 'Major'
        WHEN Magnitude >= 6 THEN 'Strong'
        ELSE 'Below 6'
    END AS magnitude_category
FROM earthquakes;

-- Objective 3 — Does earthquake depth vary significantly?
SELECT
    MIN(Depth_km) AS shallowest,
    MAX(Depth_km) AS deepest,
    AVG(Depth_km) AS average_depth
FROM earthquakes;

SELECT
    Title,
    Depth_km,
    CASE
        WHEN Depth_km < 70 THEN 'Shallow'
        WHEN Depth_km < 300 THEN 'Intermediate'
        ELSE 'Deep'
    END AS depth_category
FROM earthquakes;

SELECT
    CASE
        WHEN Depth_km < 70 THEN 'Shallow'
        WHEN Depth_km < 300 THEN 'Intermediate'
        ELSE 'Deep'
    END AS depth_category,
    COUNT(*) AS earthquake_count
FROM earthquakes
GROUP BY depth_category
ORDER BY earthquake_count DESC;

-- Objective 4 — Where are the earthquakes concentrated?
SELECT
    Place,
    COUNT(*) AS earthquake_count
FROM earthquakes
GROUP BY Place
ORDER BY earthquake_count DESC;

SELECT *
FROM earthquakes
WHERE Magnitude >= 7
ORDER BY Magnitude DESC;

SELECT *
FROM earthquakes
WHERE Latitude BETWEEN 20 AND 40
AND Longitude BETWEEN 70 AND 90;

SELECT
    YEAR(Date) AS year,
    COUNT(*) AS earthquake_count
FROM earthquakes
GROUP BY YEAR(Date)
ORDER BY year;

SELECT
    MONTH(Date) AS month,
    COUNT(*) AS earthquake_count
FROM earthquakes
GROUP BY MONTH(Date)
ORDER BY month;

SELECT
    YEAR(Date) AS year,
    MONTH(Date) AS month,
    COUNT(*) AS earthquake_count
FROM earthquakes
GROUP BY YEAR(Date), MONTH(Date)
ORDER BY year, month;

SELECT
    Title,
    Magnitude,
    RANK() OVER (ORDER BY Magnitude DESC) AS magnitude_rank
FROM earthquakes;

SELECT *
FROM (
    SELECT
        Title,
        Magnitude,
        RANK() OVER (ORDER BY Magnitude DESC) AS magnitude_rank
    FROM earthquakes
) x
WHERE magnitude_rank <= 10;

SELECT
    Title,
    Magnitude,
    ROW_NUMBER() OVER (ORDER BY Magnitude DESC) AS row_num,
    RANK() OVER (ORDER BY Magnitude DESC) AS ranking
FROM earthquakes;

WITH strong_earthquakes AS (
    SELECT *
    FROM earthquakes
    WHERE Magnitude >= 7
)
SELECT
    COUNT(*) AS strong_earthquake_count,
    AVG(Magnitude) AS average_magnitude
FROM strong_earthquakes;

SELECT
    Title,
    Magnitude
FROM earthquakes
WHERE Magnitude > (
    SELECT AVG(Magnitude)
    FROM earthquakes
)
ORDER BY Magnitude DESC;

SELECT
    YEAR(Date) AS year,
    COUNT(*) AS earthquake_count
FROM earthquakes
GROUP BY YEAR(Date)
HAVING COUNT(*) > 5
ORDER BY earthquake_count DESC;