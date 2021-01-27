setwd("C:\\SARS-CoV-2 Забайкалье\\Fasta\\для работы")
library(seqinr)

#чтение набора, набор должен обязательно содержать --->прототип!!<---

fas<-read.fasta("sequences.fasta", seqtype = c("AA"))
nam<-names(fas)
nam<-nam[-1] #удаляем аутгруппу

snp<-c(18, 20, 26, 80, 138, 190, 215, 417, 484, 501, 570, 655, 681, 701, 716, 982, 1027, 1118)
snp_char<-c(as.character(snp), "num_of_X", "N501Y", "E484K", "K417N")

#cоздаем таблицу с заменами (номер позиции) и статистикой по Х и наличию маркерных мутаций
sub_tab<-data.frame("isolate"=rep("0", length(nam)), stringsAsFactors = FALSE)
for (i in 1:(length(snp_char))) {
	sub_tab[,i]<-rep("0", length(nam))
}
sub_tab[,20]<-rep("no", length(nam))
sub_tab[,21]<-rep("no", length(nam))
sub_tab[,22]<-rep("no", length(nam))

names(sub_tab)<-snp_char
row.names(sub_tab)<-nam

#попарное сравнение сиквенсов с референсом
n_seq<-2
del<-c()


for(i in 1:length(snp)) {
	while(n_seq <= length(fas)) {
	ref_p<-fas[[1]][snp[i]]
	test_p<-fas[[n_seq]][snp[i]]
		if (test_p == ref_p) {
		sub_tab[n_seq-1, i] <- "-" #знак "-" если замены совпадают, n_seq-1 корректирует индекс номера сиквенса в итоговой таблице с учетом аутгруппы в исходной таблице
		n_seq<-n_seq+1
		next
		}
		if (test_p == "X") {
		sub_tab[n_seq-1, i] <- "X" #знак "X" если позиция не прочитана
		n_seq<-n_seq+1
		next
		}
		if (test_p == "-") {
		sub_tab[n_seq-1, i] <- "del" # если произошла делеция
		n_seq<-n_seq+1
		next
		}
		if (test_p != ref_p) {
		aa<-paste(ref_p, snp[i], test_p, sep="") #записываем замену, в случае замены (вот это поворот!)
		str<-c(names(fas)[n_seq], aa)
		
		sub_tab[n_seq-1, i] <- aa
		n_seq<-n_seq+1
		next
		}
		}
n_seq<-2
}

#статистика по Х-ам и трем основным позициям 

for (i in 1:length(nam)) {
	sub_tab[i, 19]<-length(which(sub_tab[i,] == "X"))
}

for (i in 1:length(nam)) {
	k417n<-sub_tab[i, 8]
	e484k<-sub_tab[i, 9]
	n501y<-sub_tab[i, 10]
	if (k417n == "K417N") {
	sub_tab[i,22] <- "yes"
	}
	if (k417n == "X") {
	sub_tab[i,22] <- "X"
	}
	
	if (e484k == "E484K") {
	sub_tab[i,21] <- "yes"
	}
	if (e484k == "X") {
	sub_tab[i,21] <- "X"
	}
	
	if (n501y == "N501Y") {
	sub_tab[i,20] <- "yes"
	}
	if (n501y == "X") {
	sub_tab[i,20] <- "X"
	}
}


write.table(sub_tab, "sub_tab_s.tsv", quote = FALSE, sep="\t")
