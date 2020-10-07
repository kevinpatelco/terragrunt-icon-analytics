CREATE materialized view no_address_transaction_by_value AS
SELECT temp_table.value, temp_table.ct
FROM (
SELECT value, count(*) AS ct from reduced_trans WHERE to_address = '' GROUP BY value
) temp_table;
