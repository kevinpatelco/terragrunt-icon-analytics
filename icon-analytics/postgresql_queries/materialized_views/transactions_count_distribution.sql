create materialized view transactions_count_distribution as
select transactions_count.ct, transactions_count.ct_title
FROM(
    (SELECT count(*) as ct, 'total_transactions' as ct_title
    FROM transactions)
    UNION
    (SELECT count(*) as ct, 'cx_transactions' as ct_title
    FROM transactions
    WHERE LEFT(to_address, 2) = 'cx')
    UNION
    (SELECT count(*) as ct, 'hx_transactions' as ct_title
    FROM transactions
    WHERE LEFT(to_address, 2) = 'hx')
) transactions_count;
