-- Week 4 DuckDB queries
--
-- My lake folders are named like year=2025/month=01. When hive_partitioning
-- is on, DuckDB gets the year and month from the folder names. So if I filter
-- by year or month, it can skip the folders I don't need and not open those
-- files at all. My data is only 30 rows so it's not really faster right now,
-- but with way more loan data it would make a big difference.
-- load all the lake files into one view
CREATE OR REPLACE VIEW loans AS
SELECT
    *
FROM
    read_csv('lake/loans/*/*/*.csv', hive_partitioning = TRUE);

-- making sure all 30 loans loaded
SELECT
    COUNT(*) AS total_loans
FROM
    loans;

-- Query 1: how many of each item got loaned out in January 2025
-- this only needs the year=2025/month=01 folder
SELECT
    item_category,
    COUNT(*) AS loans
FROM
    loans
WHERE
    year = 2025
    AND month = 1
GROUP BY
    item_category
ORDER BY
    loans DESC;

-- Query 2: how many loans each campus had in 2025
-- this skips the 2024 folder completely
SELECT
    campus,
    COUNT(*) AS loans
FROM
    loans
WHERE
    year = 2025
GROUP BY
    campus
ORDER BY
    loans DESC;