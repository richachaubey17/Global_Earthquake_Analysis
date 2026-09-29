# 🌎 Global Earthquake Analysis Using SQL

## 📌 Project Overview

This project analyzes global earthquake data using MySQL and SQL.

The objective is to understand earthquake patterns based on:

- Magnitude
- Depth
- Geographic location
- Date and time
- Frequency of earthquake occurrence

The project demonstrates how SQL can be used for data exploration, data cleaning, aggregation, filtering, ranking, and analytical queries.

---

## 📑 Table of Contents

1. [Project Objective](#-project-objective)
2. [Dataset](#-dataset)
3. [Tools Used](#-tools-used)
4. [Database Structure](#-database-structure)
5. [SQL Analysis](#-sql-analysis)
6. [Key Questions](#-key-questions)
7. [Results](#-results)
8. [Project Structure](#-project-structure)
9. [Future Work](#-future-work)

---

## 🎯 Project Objective

The main objective is to investigate:

- What is the distribution of earthquake magnitudes?
- What is the distribution of earthquake depths?
- Which earthquakes have the highest magnitudes?
- How are earthquakes distributed geographically?
- How does earthquake frequency vary with time?
- What proportion of earthquakes are shallow, intermediate, and deep?

---

## 📊 Dataset

The dataset contains global earthquake records with information including:

- Date
- Earthquake title
- Magnitude
- Place
- Latitude
- Longitude
- Depth in kilometres

---

## 🛠 Tools Used

- MySQL
- SQL
- GitHub

---

## 🗄 Database Structure

The main table used in this project is:

`earthquakes`

| Column | Description |
|---|---|
| Date | Earthquake origin date/time |
| Title | Earthquake event description |
| Magnitude | Earthquake magnitude |
| Place | Location of the earthquake |
| Latitude | Geographic latitude |
| Longitude | Geographic longitude |
| Depth_km | Earthquake depth in kilometres |

---

## 🔎 SQL Analysis

The project uses SQL techniques including:

- SELECT
- WHERE
- ORDER BY
- LIMIT
- DISTINCT
- COUNT
- AVG
- MIN
- MAX
- GROUP BY
- HAVING
- CASE WHEN
- Subqueries
- Common Table Expressions (CTEs)
- Window functions
- RANK()
- ROW_NUMBER()
- Date functions
- SQL Views

---

## ❓ Key Questions

### 1. What is the average earthquake magnitude?

### 2. What is the largest earthquake in the dataset?

### 3. Which earthquakes are deeper than the average depth?

### 4. How many earthquakes occurred in each year?

### 5. How many earthquakes fall into different magnitude categories?

### 6. How many earthquakes are shallow, intermediate, and deep?

### 7. What are the top 10 largest earthquakes?

### 8. Which geographic regions have the highest number of earthquakes?

---

## 📈 Results

The important SQL query results and visualizations will be added here as the analysis progresses.

---

## 📁 Project Structure

```text
Global_Earthquake_Analysis/
│
├── README.md
│
├── data/
│   └── earthquake_data.csv
│
├── sql/
│   ├── database_setup.sql
│   ├── table_creation.sql
│   └── earthquake_analysis.sql
│
├── results/
│   └── analysis_results.pdf
│
└── images/
    └── earthquake_analysis.png
