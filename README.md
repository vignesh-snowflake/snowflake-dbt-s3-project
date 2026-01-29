# snowflake-dbt-s3-project
End-to-end Snowflake + dbt pipeline using AWS S3

# Snowflake + dbt Incremental Pipeline using AWS S3

## 📌 Project Overview
This project demonstrates an end-to-end data pipeline built using **Snowflake**, **dbt**, and **AWS S3**.
It ingests semi-structured JSON data stored inside CSV files from S3, processes it in Snowflake,
and transforms it into analytics-ready tables using dbt.

---

## 🏗️ Architecture
AWS S3 (CSV with JSON)
↓
Snowflake External Stage
↓
RAW Table (VARIANT)
↓
dbt Ephemeral Model (JSON Flattening)
↓
dbt Incremental Model (MERGE)

---

## 🛠️ Tech Stack
- Snowflake
- dbt
- AWS S3
- SQL
- GitHub

---

## ⚙️ Key Features
- Snowflake warehouse with auto-suspend & auto-resume
- External stage using S3 storage integration
- JSON parsing using VARIANT and FLATTEN
- dbt ephemeral models for transformations
- dbt incremental models using MERGE strategy
- Data quality checks using dbt tests

---

## 📂 Project Structure
snowflake-dbt-s3-project/
├── snowflake/
│ ├── warehouse_setup.sql
│ └── storage_integration.sql
├── dbt_project/
│ └── models/
│ ├── staging/
│ │ └── query1.sql
│ ├── marts/
│ │ └── query2.sql
│ ├── schema.yml
│ └── sources.yml
└── README.md


---

## 🚀 How to Run
```bash
dbt debug
dbt run
dbt test

Use Case:-

This pipeline is suitable for:

Order ingestion systems

Event-based JSON data processing

Cost-optimized incremental analytics pipelines

Future Enhancements:-

Add dbt snapshots (SCD Type 2)

Add documentation generation (dbt docs)

Add advanced tests and freshness checks
