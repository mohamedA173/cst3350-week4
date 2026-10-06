# CST 335 Week 4: Mini Equipment Lending Data Lake

For this assignment I made a small pretend storage cluster and data lake for equipment loan data at a university. Everything is just folders on my laptop. I split the loan data into blocks, copied them onto different nodes, made one node fail and fixed it, and then ran some queries on the data with DuckDB.

## My cluster

I used 3 nodes (node1, node2, node3) and a replication factor of 2, so every block is saved on 2 different nodes. I have 3 blocks, one for each month (December 2024, January 2025, February 2025), and each one has 10 loans. For the failure part I made node2 fail by renaming it to node2_failed, then I made node2_replacement and copied the missing blocks back into it.

You can read more about this in cluster_design.md and failure_simulation.md.

## My lake

I split the loan data into folders by year and month:

    lake/loans/year=2024/month=12/
    lake/loans/year=2025/month=01/
    lake/loans/year=2025/month=02/

There's more about this in lake_design.md.

## How to run it

To see how the folders are set up, open the project in VS Code and look at the sidebar, or run `ls -R cluster lake` in the terminal.

To run the queries, first install DuckDB, Then run this in the project folder:

The first result should show 30 total loans.
