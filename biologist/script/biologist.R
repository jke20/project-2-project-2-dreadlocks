setwd("/projectnb/bf528/users/dreadlocks/project_2/")

library(tidyverse)

## 7.1
p_0_1_fpkm_matrix <- read.table("ryan_tmp/result/P0_1_cufflinks/genes.fpkm_tracking",
                                header = T)
p_0_2_fpkm_matrix <- read.table("/project/bf528/project_2/data/samples/P0_2/genes.fpkm_tracking",
                                header = T)
ad_1_fpkm_matrix <- read.table("/project/bf528/project_2/data/samples/Ad_1/genes.fpkm_tracking",
                                header = T)
ad_2_fpkm_matrix <- read.table("/project/bf528/project_2/data/samples/Ad_2/genes.fpkm_tracking",
                               header = T)
p_4_1_fpkm_matrix <- read.table("/project/bf528/project_2/data/samples/P4_1/genes.fpkm_tracking",
                               header = T)
p_4_2_fpkm_matrix <- read.table("/project/bf528/project_2/data/samples/P4_2/genes.fpkm_tracking",
                               header = T)
p7_1_fpkm_matrix <- read.table("/project/bf528/project_2/data/samples/P7_1/genes.fpkm_tracking",
                               header = T)
p7_2_fpkm_matrix <- read.table("/project/bf528/project_2/data/samples/P7_2/genes.fpkm_tracking",
                               header = T)

sarcomere_gene <- c("Pdlim5","Pygm","Myoz2","Des","Csrp3","Tcap","Cryab")
mito_gene <- c("Brp44l","Prdx3","Acat1","Echs1","Slc25a11","Phyh")
cell_gene <- c("Cdc7","E2f8","Cdk7","Cdc26","Cdc6","E2f1","Cdc27",
               "6720463M24Rik","Cdc45","Rad51","Aurkb","Cdc23")

sarco_fpkm <- c(p_0_1_fpkm_matrix[p_0_1_fpkm_matrix$gene_short_name %in% sarcomere_gene,
                                  "FPKM"],
                p_0_2_fpkm_matrix[p_0_2_fpkm_matrix$gene_short_name %in% sarcomere_gene,
                                  "FPKM"],
                ad_1_fpkm_matrix[ad_1_fpkm_matrix$gene_short_name %in% sarcomere_gene,
                                 "FPKM"],
                ad_2_fpkm_matrix[ad_2_fpkm_matrix$gene_short_name %in% sarcomere_gene,
                                 "FPKM"],
                p_4_1_fpkm_matrix[p_4_1_fpkm_matrix$gene_short_name %in% sarcomere_gene,
                                  "FPKM"],
                p_4_2_fpkm_matrix[p_4_2_fpkm_matrix$gene_short_name %in% sarcomere_gene,
                                  "FPKM"],
                p7_1_fpkm_matrix[p7_1_fpkm_matrix$gene_short_name %in% sarcomere_gene,
                                 "FPKM"],
                p7_2_fpkm_matrix[p7_2_fpkm_matrix$gene_short_name %in% sarcomere_gene,
                                 "FPKM"])
sarco_table <- data.frame("FPKM" = sarco_fpkm, 
                          "Sample" = rep(c("p0","ad","p4","p7"), 
                                         each = 14),
                          "Gene" = rep(p_0_1_fpkm_matrix[p_0_1_fpkm_matrix$gene_short_name %in% sarcomere_gene,
                                                         "gene_short_name"], 
                                       8))
sarco_table$Sample <- factor(sarco_table$Sample, levels = c("p0","p4","p7","ad"))

sarco_plot <- sarco_table %>% group_by(Sample, Gene) %>% summarise("mean" = mean(FPKM),
                                                     "Sd" = sd(FPKM)) %>%
  ggplot(aes(x = Sample,y = mean, group = Gene)) +
  geom_line(aes(color = Gene)) +
  geom_point(aes(color = Gene)) +
  labs(title="Sarcomere",
       x ="Sample", y = "FPKM") +
  theme_bw()

mito_fpkm <- c(p_0_1_fpkm_matrix[p_0_1_fpkm_matrix$gene_short_name %in% mito_gene,
                                      "FPKM"],
                    p_0_2_fpkm_matrix[p_0_2_fpkm_matrix$gene_short_name %in% mito_gene,
                                      "FPKM"],
                    ad_1_fpkm_matrix[ad_1_fpkm_matrix$gene_short_name %in% mito_gene,
                                     "FPKM"],
                    ad_2_fpkm_matrix[ad_2_fpkm_matrix$gene_short_name %in% mito_gene,
                                     "FPKM"],
                    p_4_1_fpkm_matrix[p_4_1_fpkm_matrix$gene_short_name %in% mito_gene,
                                      "FPKM"],
                    p_4_2_fpkm_matrix[p_4_2_fpkm_matrix$gene_short_name %in% mito_gene,
                                      "FPKM"],
                    p7_1_fpkm_matrix[p7_1_fpkm_matrix$gene_short_name %in% mito_gene,
                                     "FPKM"],
                    p7_2_fpkm_matrix[p7_2_fpkm_matrix$gene_short_name %in% mito_gene,
                                     "FPKM"])
mito_table <- data.frame("FPKM" = mito_fpkm, 
                         "Sample" = rep(c("p0","ad","p4","p7"), 
                                         each = 12),
                          "Gene" = rep(p_0_1_fpkm_matrix[p_0_1_fpkm_matrix$gene_short_name %in% mito_gene,
                                                         "gene_short_name"], 
                                       8))
mito_table$Sample <- factor(mito_table$Sample, levels = c("p0","p4","p7","ad"))

mito_plot <- mito_table %>% group_by(Sample, Gene) %>% summarise("mean" = mean(FPKM),
                                                     "Sd" = sd(FPKM)) %>%
  ggplot(aes(x = Sample,y = mean, group = Gene)) +
  geom_line(aes(color = Gene)) +
  geom_point(aes(color = Gene)) + 
  labs(title="Mitochondria",
       x ="Sample", y = "FPKM") +
  scale_color_discrete(name = "Gene", labels = c("Acat1","Mpc1","Echs1",
                                                 "Phyh","Prdx3","Slc25a11")) +
  theme_bw()

cell_fpkm <- c(p_0_1_fpkm_matrix[p_0_1_fpkm_matrix$gene_short_name %in% cell_gene,
                                 "FPKM"],
               p_0_2_fpkm_matrix[p_0_2_fpkm_matrix$gene_short_name %in% cell_gene,
                                 "FPKM"],
               ad_1_fpkm_matrix[ad_1_fpkm_matrix$gene_short_name %in% cell_gene,
                                "FPKM"],
               ad_2_fpkm_matrix[ad_2_fpkm_matrix$gene_short_name %in% cell_gene,
                                "FPKM"],
               p_4_1_fpkm_matrix[p_4_1_fpkm_matrix$gene_short_name %in% cell_gene,
                                 "FPKM"],
               p_4_2_fpkm_matrix[p_4_2_fpkm_matrix$gene_short_name %in% cell_gene,
                                 "FPKM"],
               p7_1_fpkm_matrix[p7_1_fpkm_matrix$gene_short_name %in% cell_gene,
                                "FPKM"],
               p7_2_fpkm_matrix[p7_2_fpkm_matrix$gene_short_name %in% cell_gene,
                                "FPKM"])
cell_table <- data.frame("FPKM" = cell_fpkm, 
                         "Sample" = rep(c("p0","ad","p4","p7"), 
                                        each = 24),
                         "Gene" = rep(p_0_1_fpkm_matrix[p_0_1_fpkm_matrix$gene_short_name %in% cell_gene,
                                                        "gene_short_name"], 
                                      8))
cell_table$Sample <- factor(cell_table$Sample, levels = c("p0","p4","p7","ad"))

new_cell_gene <- cell_gene %>% sort()
new_cell_gene[1] <- "Bora"

cell_plot <- cell_table %>% group_by(Sample, Gene) %>% summarise("mean" = mean(FPKM),
                                                    "Sd" = sd(FPKM)) %>%
  ggplot(aes(x = Sample,y = mean, group = Gene)) +
  geom_line(aes(color = Gene)) +
  geom_point(aes(color = Gene)) +
  labs(title="Cell Cycle",
       x ="Sample", y = "FPKM") +
  scale_color_discrete(name = "Gene", labels = new_cell_gene) +
  guides(color=guide_legend(ncol=2)) +
  theme_bw()

library("ggpubr")
ggarrange(sarco_plot, mito_plot, cell_plot, 
          labels = c("A", "B","C"), nrow = 1)


## 7.3
ref_table <- read.table("/project/bf528/project_2/data/fpkm_matrix.csv", header = T)
my_cuffdiff <- read.table("ryan_tmp/result/cuffdiff/gene_exp.diff", header = T)
head(my_cuffdiff)

sorted_index <- order(my_cuffdiff$q_value, decreasing = F)
top_1000_gene <- my_cuffdiff[sorted_index,"gene"] %>% unique()
top_1000_gene <- top_1000_gene[1:1000]

head(p_0_1_fpkm_matrix)
top_id <- p_0_1_fpkm_matrix[p_0_1_fpkm_matrix$gene_short_name %in% top_1000_gene,
                            "tracking_id"] %>% unique()

gene_frame <- p_0_1_fpkm_matrix[, 
                                c("tracking_id", "FPKM")] %>%
  inner_join(ref_table, by = "tracking_id")
colnames(gene_frame)[2] <- "P0_1_FPKM"
head(gene_frame)
top_1000 <- gene_frame[gene_frame$tracking_id %in% top_id,c(1,2,5,3:4,6:9)]
head(top_1000)
top_1000 <- top_1000[rowSums(top_1000[,-1]) != 0, ]

library(pheatmap)
pheatmap(as.matrix(top_1000[,-1]), scale = "row",
         show_rownames = F,
         labels_col = c("P0_1","P0_2",
                        "Ad_1","Ad_2",
                        "P4_1","P4_2",
                        "P7_1","p7_2"))


