-- Warehouse creation with size xsmall and type standanard
CREATE WAREHOUSE IF NOT EXISTS VIRTUSA
WITH
    WAREHOUSE_SIZE = 'XSMALL'
    WAREHOUSE_TYPE = 'STANDARD'
    AUTO_SUSPEND = 60
    AUTO_RESUME = TRUE
    INITIALLY_SUSPENDED = TRUE
    COMMENT = 'Warehouse for Virtusa sample dbt project';
-- database db 
    CREATE DATABASE IF NOT EXISTS VIRTUSA_DB
COMMENT = 'Database for Virtusa sample dbt project';

-- schema dbt_dev
CREATE SCHEMA IF NOT EXISTS VIRTUSA_DB.DBT_DEV
COMMENT = 'Schema for Virtusa sample dbt development';

--checking account and region 
SELECT 
  CURRENT_ACCOUNT(),
  CURRENT_REGION();