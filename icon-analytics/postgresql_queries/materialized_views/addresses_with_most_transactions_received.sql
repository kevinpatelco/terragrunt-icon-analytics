create materialized view addresses_with_most_transactions_received as
select transactions_count.ct, transactions_count.to_address
FROM(
    (SELECT count(*) as ct, to_address
    FROM transactions group by to_address)
) transactions_count;
