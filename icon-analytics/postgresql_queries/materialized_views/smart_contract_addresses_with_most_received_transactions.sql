CREATE materialized view score_addresses_with_most_transactions AS
SELECT temp_table.address, temp_table.name, temp_table.ct
FROM(
    SELECT s.address, s.name, count(*) AS ct from
    score_addresses AS s
    JOIN
    reduced_trans AS r
    ON s.address = r.to_address
    GROUP BY s.address, s.name
) temp_table;
