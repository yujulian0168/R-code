
rm(list = ls(all.names = TRUE))

#aai <-read.delim("/Users/michaelpavia/Dropbox (ASU)/02_ASU/05_Meta-omics/04_Bathy/aai_scores.upper_triangle_v5.txt", row.names = 1, header = TRUE)
aai<-read.delim("~/Desktop/BIOCHAR/3_DNA-SIP_Metagenomics/aai-MAGs-matrix.txt", row.names = 1, header = TRUE)
aai_plot <- as.matrix(aai)
my_palette <- colorRampPalette(c("white", "blue","red", "yellow"))(n = 399)

# (optional) defines the color breaks manually for a "skewed" color transition
col_breaks = c(seq(0,44,length=100), # for red # order
               seq(45,65,length=100), # for yellow # same family
               seq(66,94,length=100), # same genus
               seq(95,100,length=100)) # for green # same species
library(gplots)
heatmap.2(aai_plot, keysize=1.0, key.xlab="AAI", key.title = "",col=my_palette,breaks=col_breaks, trace="none", cexRow = 0.4, cexCol = 0.4)

library(viridis)
library(pheatmap)
anno<-read.delim("~/Desktop/BIOCHAR/3_DNA-SIP_Metagenomics/aai-anno.txt", header = TRUE,row.names = 1)

pheatmap(aai,cluster_cols=T,cluster_rows=T,show_rownames= FALSE,
         annotation_row = anno, annotation_col = anno)



