CREATE materialized view transactions_count_distribution AS
SELECT transactions_count.ct, transactions_count.ct_title
FROM(
    (SELECT COUNT(*) AS ct, 'total_transactions' AS ct_title
    FROM transactions)
    UNION
    (SELECT COUNT(*) AS ct, 'cx_transactions' AS ct_title
    FROM transactions
    WHERE LEFT(to_address, 2) = 'cx')
    UNION
    (SELECT COUNT(*) AS ct, 'hx_transactions' AS ct_title
    FROM transactions
    WHERE LEFT(to_address, 2) = 'hx')
) transactions_count;
