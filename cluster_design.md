# Cluster Design

## Overview

For this assignment I'm making a small fake cluster using folders on my laptop. I'm using 3 nodes and a replication factor of 2, so each block will be saved on 2 different nodes.

## Folder structure

    cluster/
      node1/
      node2/
      node3/

## How it works

Blocks: A block is just one small CSV file with some of the loan data in it. I'm splitting my loan data up by month, so each block has one month of loans.

Nodes: Each folder (node1, node2, node3) is supposed to be like its own server. In real life these would be separate machines, but for this I'm just using folders.

Replication: This means the same file gets copied into more than one node. Since my replication factor is 2, every block will be in 2 different node folders. I'm making sure both copies aren't on the same node, so if one node goes down I still have the data somewhere else.

## Where the blocks are

I split my 30 loans into 3 blocks by month. Then I copied each block into 2 different nodes since my replication factor is 2.

block1_loans_2025_01.csv (January 2025) is on node1 and node2

block2_loans_2025_02.csv (February 2025) is on node2 and node3

block3_loans_2024_12.csv (December 2024) is on node1 and node3

So node1 has block1 and block3, node2 has block1 and block2, and node3 has block2 and block3. Each node has 2 blocks, and if any one node goes down, every block is still saved on another node.

My full loan file is data_source/loans_sample.csv and the block files are in the data_source folder too.