rm(list = ls(all.names = TRUE))
library('DESeq2')
library( "GenomicFeatures" )
setwd("/Users/julian/Desktop/BIOCHAR/3_DNA-SIP_Metagenomics/KO-txt-file/MetaG_files")

raw.count<-read.csv("metag.KO.counts.csv", header = T) # import data
rownames(raw.count) <-raw.count[,4] # remove extra columns ( level 1-3 KO classification)
data <- raw.count[,-1:-4]
attach(data)
# small test data set
small<-read.csv("ko-limited.csv", header = T)
attach(small)
rownames(small) <-small[,1]
small <- small[,-1]
raw.kegg.cat<-read.csv("/Users/julian/Desktop/BIOCHAR/3_DNA-SIP_Metagenomics/KEGG-cat-deseq.csv", header = T,row.names = 1)

# Order column names
col.order = data.frame(row.names = c('Plot2', 'Plot5','Plot6','Plot7','Plot1', 'Plot3', 'Plot4','Plot8'),treatment = rep(c("control","biochar"),each = 4), group= c('c1', 'c2', 'c3','c4','b1', 'b2', 'b3','b4'))

metadata <- read.csv('deseq-sampledata.csv', header = T)
#make factors for treatment column.
col.order$treatment = factor(x = col.order$treatment,levels = c('control','biochar'))
col.order$group = factor(x=col.order$group,levels = c( 'C1', 'C2', 'C3','C4','BC1', 'BC2', 'BC3','BC4'))


#construct DESeq object from input matrix (countdata)
dds.ko = DESeqDataSetFromMatrix(countData = data, colData = col.order, design = ~treatment)
dds<-DESeq(dds.ko)

dds.small = DESeqDataSetFromMatrix(countData = small, colData = col.order, design = ~treatment)

dds<-DESeq(dds.small)

# transformations 
rld<-rlogTransformation(dds, blind=FALSE)
rld.s<-rlogTransformation(dds.small, blind=FALSE)

#check data for heteroscedacisity
dds_sizeF<-estimateSizeFactors(dds)
dds_sizeF<-estimateSizeFactors(dds.small)

#order.dds_sf<-estimateSizeFactors(order.dds1)
cdsFull = estimateSizeFactors(dds)
cdsFull = estimateSizeFactors(dds.small)

# check size factor
sizeFactors(dds_sizeF) #KO
#Plot1     Plot3     Plot4     Plot8     Plot2     Plot5     Plot6     Plot7 
#0.9993681 1.3380110 1.3171437 1.2059557 1.1584458 1.1138232 0.6758073 0.5831080 
#Writing out a normalized table

# normalize and write data to table
normalized.func.data=counts(dds_sizeF, normalized = T)
head(normalized.func.data)
write.csv(as.data.frame(normalized.func.data),
          file="normlized-deseq-KO-data.csv")

write.csv(as.data.frame(normalized.func.data),
          file="normlized-deseq-KO-data.csv")

# estimate dispersions and plot ordination
dds_disp = estimateDispersions(dds_sizeF)
plotDispEsts(dds_disp)

sampleDist<-dist(t(assay(rld)))
dist.mat<-as.matrix(sampleDist)
plot(log2(counts(dds_sizeF,normalize = T)[,1:8]+1), pch = 16, cex = 0.3 )
dds.full = varianceStabilizingTransformation(cdsFull, blind = T)
print(plotPCA(dds.full, intgroup= ("treatment")))

sampleDist.cat<-dist(t(assay(rld.cat)))
dist.mat.cat<-as.matrix(sampleDist.cat)
plot(log2(counts(dds_sizeF,normalize = T)[,1:8]+1), pch = 16, cex = 0.3 )
dds.full = varianceStabilizingTransformation(cdsFull, blind = T)
print(plotPCA(dds.full, intgroup= ("treatment")))

# calculate DESeq results and order by p-adj
res.cat <- results(dds.cat)
head(res.cat)
res.cat <- res.cat[order(res.cat$padj),]
summary(res.cat)


res <- results(dds)
head(res)
res <- res[order(res$padj),]
summary(res)

plotMA(dds,ylim=c(-1.5,1.5),main="DESeq2")
write.csv(as.data.frame(res),
          file="KO_DESeq2-results1.csv")


#To pull the LFC against the grand mean for generating the heatmaps
library("genefilter")
TopVarGenes<-order(rowVars(assay(rld)), decreasing = TRUE)
mat<- assay(rld)[TopVarGenes,]
mat <- mat - rowMeans(mat)

write.csv(as.data.frame(mat),
          file="KO_DESeq2-log2FC_against_grandMean.csv")

TopVarGenes.cat<-order(rowVars(assay(rld.cat)), decreasing = TRUE)
mat.cat<- assay(rld.cat)[TopVarGenes.cat,]
mat.cat <- mat.cat - rowMeans(mat.cat)

write.csv(as.data.frame(mat.cat),
          file="KO-cat_DESeq2-log2FC_against_grandMean.csv")

### DESeq Heatmaps
library(gplots)
library("RColorBrewer")
my_palette <- colorRampPalette(c("red","white","blue"))(n = 299)
KO.heat<-read.csv("KO_DESeq2-log2FC_against_grandMean.csv", header = T, row.names = 1)
KOs<-as.matrix(KO.heat)

heatmap.2(KOs, col = my_palette, Rowv = T, Colv = T, scale = 'none',
          density.info = 'none', dendrogram = "column", trace = "none")


KO.cat.heat<-read.csv("KO-cat_DESeq2-log2FC_against_grandMean.csv", header = T, row.names = 1)
KO.Cat<-as.matrix(KO.cat.heat)

heatmap.2(KO.Cat, col = my_palette, Rowv = F, Colv = F, scale = 'none',
          density.info = 'none', dendrogram = "column", trace = "none", cexCol= 0.75,cexRow=0.3,
          margin = c(3,12))


