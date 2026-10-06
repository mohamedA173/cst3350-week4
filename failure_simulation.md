# Failure Simulation

## What failed

I picked node2 to fail. To fake it going down I just renamed the folder:

    mv cluster/node2 cluster/node2_failed

node2 had 2 blocks on it, block1 (January 2025) and block2 (February 2025), so those copies were "lost."

## Did I lose any data?

No. Since my replication factor is 2, both of those blocks still had a copy on another node. block1 was still on node1 and block2 was still on node3. So all 3 months of loan data were still there.

The only problem was that block1 and block2 were down to just 1 copy each. If another node went down before I fixed it, I could actually lose data.

## How I fixed it

I made a new folder called node2_replacement and copied the missing blocks into it from the nodes that were still working:

    mkdir cluster/node2_replacement
    cp cluster/node1/block1_loans_2025_01.csv cluster/node2_replacement/
    cp cluster/node3/block2_loans_2025_02.csv cluster/node2_replacement/

## After fixing it

node1 has block1 and block3, node2_replacement has block1 and block2, and node3 has block2 and block3. Every block is back to 2 copies. I kept the node2_failed folder so you can see what was on it before it went down.

In a real system like Hadoop this would happen on its own when it notices a node stopped working, but here I had to do it myself.