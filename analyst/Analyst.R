setwd("/projectnb/bf528/users/dreadlocks/project_2/")

#######TASK1########
gene_exp <- read.table("Programmer/cuffdiff_out/gene_exp.diff")
names(gene_exp) <- c("test_id","gene_id","gene","locus","sample_1", "sample_2",
                     "status","value_1", "value_2","log2_foldchange", "test_stat"
                     ,"p_value","q_value","significant")
gene_exp <- gene_exp[-c(1),] 
sort_gene_exp <- gene_exp[order(gene_exp$q_value),]
col <- c("gene","value_1","value_2","log2_foldchange","p_value","q_value")
sort_gene_exp_top_10 <- sort_gene_exp[,(names(sort_gene_exp) %in% col)]
sort_gene_exp_top_10 <- sort_gene_exp_top_10[1:10,]

######TASK2###########
hist(as.numeric(sort_gene_exp$log2_foldchange), main = "Histogram of log2FC",
     xlab = "log2FC", breaks = 20)

######TASK3###########
sort_gene_exp_sign <- subset(sort_gene_exp,significant=="yes")

######TASK4###########
hist(as.numeric(sort_gene_exp_sign$log2_foldchange), main = "Histogram of log2FC of Significant Gene",
     xlab = "log2FC", breaks = 20)

######TASK5###########
up_gene_exp <- subset(sort_gene_exp_sign, log2_foldchange > 0)
down_gene_exp <- subset(sort_gene_exp_sign, log2_foldchange < 0)

######TASK6###########
write.csv(up_gene_exp$gene,"analyst/up_regulated.csv", row.names = FALSE, quote = F)
write.csv(down_gene_exp$gene,"analyst/down_regulated.csv", row.names = FALSE, quote = F)

