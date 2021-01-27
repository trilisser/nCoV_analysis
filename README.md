# nCoV_analysis

## Introduction

It's a simple script which analises the key amino acid resudues in S gene of SARS-CoV-2 variants of concern (B.1.1.7; B.1.135 (510Y.V2); P.1)
All of these positions you can find here:
https://cov-lineages.org/global_report_B.1.1.7.html
https://cov-lineages.org/global_report_B.1.351.html
https://cov-lineages.org/global_report_P.1.html


## how to use it

You will need:
* An amino acid sequences alignment with a reference sequences at the top (see an example)
* The 'seqinr' package installed in R. To install it, just use the next command: >install.packages("seqinr")

If everything is ready, then in the script body set the path to your work directory (in Windows, use "\\" to lead the path)
>setwd("C:\\work_dyrectory")

After that, set  required name of a sequneces.fasta file (by default, it's "sequences.fasta")
>fas<-read.fasta("sequences.fasta", seqtype = c("AA"))

that's all!

The output fils is a table "sub_tab_s.tsv" with tab separated values. Excel can open it easily.

## output structure

