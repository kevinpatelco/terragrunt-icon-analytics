CREATE materialized view no_address_transaction_data_type AS
SELECT temp_table.data_type, temp_table.ct
FROM (
SELECT data_type, count(*) AS ct FROM reduced_trans WHERE to_address = '' GROUP BY data_type
) temp_table;
