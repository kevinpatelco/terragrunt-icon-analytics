CREATE materialized view transactions_destination_distinct_count_distribution AS
SELECT temp_table.ct, temp_table.ct_title
FROM(
    (SELECT COUNT(*) AS ct, 'EOA_Address_Receiver' AS ct_title
    	FROM (SELECT DISTINCT to_address FROM addresses_with_most_transactions_received WHERE LEFT(to_address, 2) = 'hx') x)
    UNION
    (SELECT COUNT(*) AS ct, 'SCORE_Address_Receiver' AS ct_title
    	FROM (SELECT DISTINCT to_address FROM addresses_with_most_transactions_received WHERE LEFT(to_address, 2) = 'cx') x)
    UNION
    (SELECT COUNT(*) AS ct, 'Speciality_Address_Receiver' AS ct_title
    	FROM (SELECT DISTINCT to_address FROM addresses_with_most_transactions_received WHERE LEFT(to_address, 2) NOT IN ('hx', 'cx', '')) x)
) temp_table;
