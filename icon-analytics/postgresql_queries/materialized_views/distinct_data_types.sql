CREATE materialized view distinct_data_types AS
SELECT temp_table.ct, temp_table.data_type
FROM(
    (SELECT data_type, count(*) AS ct from reduced_trans GROUP BY data_type)
) temp_table;
