# R-script for gathering key aa substitutions in S protein of nCoV variants of concern (VOC)

## Introduction

It's a simple R-script which gathers the key amino acid positions (18 in total) in S gene of SARS-CoV-2 variants of concern (B.1.1.7; B.1.135 (510Y.V2); P.1)
All of these positions you can find here:
 - https://cov-lineages.org/global_report_B.1.1.7.html
 - https://cov-lineages.org/global_report_B.1.351.html
 - https://cov-lineages.org/global_report_P.1.html

NB!
1) The script doesn't support **insertions**! 
2) The example sequencses are called "fake_sequence" and typed by myself for the demonstration only!

## how to use it

You will need:
* **An amino acid sequences alignment** with a reference sequence at the top (see an example);
* The 'seqinr' package installed in R. To install it, just use the next command: >install.packages("seqinr").

If everything is ready, then in the script body set the path to your work directory (in Windows, use "\\" to lead the path)
>setwd("C:\\work_dyrectory")

After that, set  required name of a sequneces.fasta file (by default, it's "sequences.fasta")
>fas<-read.fasta("sequences.fasta", seqtype = c("AA"))

that's all!

The output file is a table "sub_tab_s.tsv" with tab separated values. Excel can open it easily.

## output structure

The output table contains amino acid substitutions in the key positions of the VOC (18 positions in total).
* If there is no substitution, then a cell contains "-" symbol;
* If there is a deletion, it is marked as "del";
* If a position is not read, it is marked as "X".

The "num_of_X" column shows several unread ("X") key positions (to relatively  assess of reading quality).
The three last columns show the presence or absence of mutations in three especially concern positions (N501Y;	E484K;	K417N).

For instance, the example "sequences.fasta" alignment contains the "fake_sequence_3" which has "X"s in most of the key positions (in N501Y, E484K, K417N, in particular). It tells us about bad sequence reading, so we cannot make reliable conclusions about that isolate. In turn, "fake_sequence_5" has two remarkable substitutions in 484 and 501 positions! This would be cause for concern **if** the sequence was **real** (_I typed substitutions by myself for educational purposes only!_)

Just try the example alignment! It is easier than it sounds :)
