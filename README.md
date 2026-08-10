# NHTSA Vehicle Complaints Analytics Pipeline on Azure

## Overview

This project demonstrates a small end-to-end cloud analytics workflow built with Microsoft Azure and Power BI.

The goal was to take raw vehicle complaint data from the National Highway Traffic Safety Administration (NHTSA), prepare it for analytical workloads, store it efficiently in a data lake, query it through Azure Synapse Analytics, and visualize the results in Power BI.

The project covers the full path from raw data to dashboard:

```text
NHTSA Complaints ZIP
      ↓
HTTPS source
      ↓
Azure Data Factory
      ↓
Azure Blob Storage
      ↓
ADF unzip / extraction
      ↓
NHTSA TXT file
      ↓
Azure Data Factory Data Flow
      ↓
Data cleaning and transformation
      ↓
Manufacturer-based Parquet files
      ↓
Azure Data Lake Storage Gen2
      ↓
Azure Synapse Serverless SQL
      ↓
External table
      ↓
SQL analysis
      ↓
Power BI dashboard

```

## Technologies Used
- Azure Data Factory: Data ingestion and transformation
- Azure Data Lake Storage Gen2: Storage of analytical files
- Azure Synapse Analytics: SQL analytics over data-lake files  
- Synapse Serverless SQL: Query engine
- Parquet: Efficient columnar data format
- External Tables: SQL interface over Parquet data
- SQL: Filtering, aggregation and analysis
- Power BI: Interactive visualization

## Data Pipeline

The original NHTSA complaints dataset was stored as a TXT file.

Using Azure Data Factory, I:

1. imported the raw data (ingestion),
2. filtered problematic manufacturer names (cleaning),
3. mapped the output columns (transformation),
4. created manufacturer-based filenames,
5. converted the data to Parquet (efficient storage in a columnar-oriented file format),
6. stored the resulting files in Azure Data Lake Storage Gen2 (the exposition to an analytical engine),
7. created external table and then queried it,
8. and presented the analytical results in Power BI.

The resulting manufacturer-specific Parquet files were stored in the data lake.

## Azure Synapse Analytics

I connected Azure Synapse Analytics to the data lake and created an external table over the Ford Parquet file.

This allowed the data to remain physically stored in ADLS Gen2 while still being queried with SQL.

One of the SQL analyses counted Ford F-150 crash-related complaints by model year between 1990 and 2010.

The SQL scripts are available in the `sql/` folder.

## Power BI Dashboard

The final data was explored using Power BI.

The report contains three pages:

- Crash Overview
- Crash Details
- Dealer Statistics

## Important Data Limitation

The dataset contains complaint records rather than complete vehicle exposure data.

Therefore, a model having more crash-related complaints does not necessarily mean that it is more dangerous.

A proper crash-rate comparison would also require information such as:

- number of vehicles registered,
- vehicles sold,
- or miles driven.

Some complaint records also contain incomplete model or model-year information, so not every crash-related complaint can be assigned to a specific Year & Model category.

## Repository Structure
```text
azure-nhtsa-analytics-pipeline/
│
├── README.md
├── sql/
│   ├── create_external_table.sql
│   └── ford_f150_crashes.sql
├── powerbi/
│   └── Jan_Pabiszczak_NHTSA_Ford_Microsoft_Power_BI.pbit
└── images/
    ├── adf-data-flow.png
    ├── parquet-storage.png
    ├── synapse-external-table.png
    ├── crash-overview.png
    ├── crash-details.png
    └── dealer-statistics.png
``` 
## What I Learned

This project helped me understand how the different layers of a cloud analytics system work together:
```text
ADF prepares the data
ADLS stores the data
Parquet optimizes the data
Synapse queries the data
Power BI visualizes the data
``` 
It also demonstrated the practical separation of storage and computation in a modern cloud analytics architecture. The data remains in Azure Data Lake Storage, while Azure Synapse Serverless SQL provides the computational layer used to query it.

The Power BI report is provided as a .pbit template to reduce repository size. The template contains the report structure, queries, model, and visual definitions but excludes the imported dataset.
