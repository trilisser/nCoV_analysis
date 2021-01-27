# nCoV_analysis
It's a simple script which analises the key amino acid resudues in S gene of SARS-CoV-2 variants of concern

You will need:
* An amino acid sequences alignment with a reference sequences at the top (see an example)
* The 'seqinr' package installed in R. To install it, just use the next command: >install.packages("seqinr")

If everything is ready, then in the script body set the path to your work directory (in Windows, use "\\" to lead the path)
>setwd("C:\\work_dyrectory")

After that, set  required name of a sequneces.fasta file (by default, it's "sequences.fasta")
>fas<-read.fasta("sequences.fasta", seqtype = c("AA"))

that's all!

The output fils is a table "sub_tab_s.tsv" with tab separated values. Excel can open it easily.

