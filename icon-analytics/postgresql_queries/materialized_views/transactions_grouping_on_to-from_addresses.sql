CREATE materialized view transactions_cluster_to_and_from AS
SELECT temp_table.ct, temp_table.to_address, temp_table.from_address
FROM(
    (SELECT count(*) AS ct, to_address, from_address
    FROM transactions GROUP BY to_address, from_address)
) temp_table;
