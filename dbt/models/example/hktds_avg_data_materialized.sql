{{ config(
    materialized='table',
    partition_by={
      "field": "as_of_date",
      "data_type": "date",
      "granularity": "day"
    }
)}}

select 
    name, 
    post_abbr, 
    PARSE_DATE("%Y%m%d", as_of_date) as as_of_date, 
    CAST(col1 AS INT64) as col1 , 
    CAST(col2 AS FLOAT64) as col2, 
    PARSE_TIMESTAMP("%F %T", col3) as timestamp
from `dataset.hktds_avg_data`