USE ROLE ACCOUNTADMIN;
use warehouse virtusa
alter warehouse virtusa resume;

CREATE OR REPLACE STORAGE INTEGRATION s3_int
  TYPE = EXTERNAL_STAGE
  STORAGE_PROVIDER = S3
  ENABLED = TRUE
  STORAGE_AWS_ROLE_ARN =
    'arn:aws:iam::6848445913743:role/snowflake_s3_role'
  STORAGE_ALLOWED_LOCATIONS =
    ('s3://my-snowflake-data-bucket-vignesh/');

    DESC STORAGE INTEGRATION s3_int;


CREATE OR REPLACE FILE FORMAT csv_json_ff
  TYPE = 'CSV'
  field_delimiter=','
  SKIP_HEADER = 1;


  CREATE OR REPLACE STAGE my_s3_stage
  URL = 's3://my-snowflake-data-bucket-vignesh/'
  STORAGE_INTEGRATION = s3_int
  FILE_FORMAT = csv_json_ff;

  LIST @my_s3_stage;
  
select $1,$2 from @my_s3_stage;



  CREATE OR REPLACE TABLE raw_csv_json (
  details VARIANT
);


COPY INTO raw_csv_json
FROM (select $2 from @my_s3_stage)



select * from raw_csv_json;
