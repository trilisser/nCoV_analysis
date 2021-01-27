# nCoV_analysis

## Introduction

It's a simple script which analises the key amino acid positions (18 in total) in S gene of SARS-CoV-2 variants of concern (B.1.1.7; B.1.135 (510Y.V2); P.1)
All of these positions you can find here:
https://cov-lineages.org/global_report_B.1.1.7.html
https://cov-lineages.org/global_report_B.1.351.html
https://cov-lineages.org/global_report_P.1.html

NB! The script doesn't support **insertions**!

## how to use it

You will need:
* An amino acid sequences alignment with a reference sequences at the top (see an example)
* The 'seqinr' package installed in R. To install it, just use the next command: >install.packages("seqinr")

If everything is ready, then in the script body set the path to your work directory (in Windows, use "\\" to lead the path)
>setwd("C:\\work_dyrectory")

After that, set  required name of a sequneces.fasta file (by default, it's "sequences.fasta")
>fas<-read.fasta("sequences.fasta", seqtype = c("AA"))

that's all!

The output file is a table "sub_tab_s.tsv" with tab separated values. Excel can open it easily.

## output structure

The output table contains amino acid substitutions in the key positions of the VOC (18 positions in total).
* If there is no substitution, then a cell contains "-" symbol.
* If there is a deletion, it is marked as "del".
* If a position is not read, it is marked as "X".

The "num_of_X" column shows a number of unread ("X") key positions (to realtively assess of read quality)
The three last columns show presence or absence of mutations in three especially concern positions (N501Y;	E484K;	K417N).

Just try the example alignment! It is easier than it sounds :)
