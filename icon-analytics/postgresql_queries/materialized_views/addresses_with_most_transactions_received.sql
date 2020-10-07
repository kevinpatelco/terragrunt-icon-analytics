CREATE materialized view addresses_with_most_transactions_received AS
SELECT transactions_count.ct, transactions_count.to_address
FROM(
    (SELECT COUNT(*) AS ct, to_address
    FROM transactions GROUP BY to_address)
) transactions_count;
