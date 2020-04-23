rm(list = ls(all.names = TRUE))
library(phyloseq)
install.packages("~/Desktop/BIOCHAR/3_DNA-SIP_Metagenomics/RDPutils_1.2.3.tar.gz",  type="source", repos=NULL)
library(RDPutils)
library(vegan)

class.expt <- hier2phyloseq("~/Desktop/BIOCHAR/3_DNA-SIP_Metagenomics/classifier-all/hierarchy.txt")
class.expt

sam.data <- read.csv(file="~/Desktop/BIOCHAR/3_DNA-SIP_Metagenomics/classifier-all/soil-data-nmds.csv", row.names=1, header=TRUE)
sample_data(class.expt) <- sam.data
class.expt

rank_names(class.expt)
get_taxa_unique(class.expt, taxonomic.rank="domain")
bact <- subset_taxa(class.expt, domain=="Bacteria")
bact

get_taxa_unique(bact, taxonomic.rank="domain")

sample_variables(bact)
unique(sample_data(bact)[,"treatment"])
# First agglomerate sequences by phyla
bact.p <- tax_glom(bact, taxrank="phylum")
bact.o <- tax_glom(bact, taxrank="order")

tax_table(bact.p)
tax_table(bact.o)
OTU1 = as(otu_table(bact.p),"matrix")
OTU2 = as(otu_table(bact.o),"matrix")
# transpose if necessary
if(taxa_are_rows(physeq1)){OTU1 <- t(OTU1)}
# Coerce to data.frame
OTUdf = as.data.frame(OTU1)

# transpose if necessary
if(taxa_are_rows(physeq1)){OTU2 <- t(OTU2)}
# Coerce to data.frame
OTU2df = as.data.frame(OTU2)

write.table( OTUdf, file = "~/Desktop/BIOCHAR/3_DNA-SIP_Metagenomics/classifier-all/bact.p.txt" ,sep = '\t')
write.table( OTU2df, file = "~/Desktop/BIOCHAR/3_DNA-SIP_Metagenomics/classifier-all/bact.o.txt" ,sep = '\t')
plot_bar(bact.p, x="treatment", fill="phylum")
plot_bar(bact.o, x="treatment", fill="order")
#Values (number of sequences) are stacked in order in each bar, with the greatest at the bottom, and replicates are depicted individually. Thus for a given phylum the replicates may not be contiguous.
mdf<-psmelt(bact.p)
library(ggplot2)
plot.p1<-ggplot(mdf, aes(fill=phylum, y=Abundance, x=treatment)) + 
  geom_bar(position="fill", stat="identity")+
  labs(x="Treatment", y="Relative Abundance", fill = "Phylum") +
  scale_x_discrete(labels=c( "Biochar",  "Control")) +
  scale_y_continuous(labels = scales::percent) +
  theme(legend.position = "none")+
  scale_fill_manual(values = c("#9E480E","#70AD47","#FFC000","#636363","#5B9BD5",
                               "#264478","#ED7D31","#A5A5A5","#4472C4","#255E91","#997300"))

# New facet label names for supp variable
supp.labs <- c("Biochar", "Control")
names(supp.labs) <- c("biochar", "control")

# Create the plot
plot.p2<-ggplot(mdf, aes(fill=phylum, y=Abundance, x=phylum)) + 
  geom_bar(stat="identity")+
  theme_gray()+
  labs(x="Phylum", y=" Abundance") +
  theme(axis.text.x = element_text(angle=-90)) +
  scale_fill_manual(values = c("#9E480E","#70AD47","#FFC000","#636363","#5B9BD5",
                               "#264478","#ED7D31","#A5A5A5","#4472C4","#255E91","#997300"))+
  facet_grid(~treatment,labeller = labeller(treatment = supp.labs))
  

library(cowplot)
plot_grid(plot.p1,plot.p2, 
          ncol = 2, align = "vh", axis = "tblr", labels = 'AUTO')

plot_bar(bact.p, x="phylum", fill="phylum", facet_grid=~treatment) 
plot_bar(bact.o, x="order", fill="order", facet_grid=~treatment) 

p4 <- plot_richness(bact,measures=c("Observed", "Shannon"))
p4 + theme(axis.text.x = element_text(size=4))

#Inspect sample sizes. From the above bar plots it is evident that there are fewer sequences in some samples.

sample_sums(bact)
#out.barrnap.JY56S23.16S out.barrnap.JY65S24.16S out.barrnap.JY74S25.16S 
#35                      45                      43 
#out.barrnap.JY11S19.16S out.barrnap.JY20S20.16S out.barrnap.JY38S21.16S 
#48                      58                      61 
#out.barrnap.JY47S22.16S  out.barrnap.JY2S18.16S 
#44                      54 

## now make and ordination
### run adonis
ord1<-ordinate(bact, method="NMDS", distance="bray")
ord2<-ordinate(bact, method="PCoA", distance="bray")
#calculating bray curtis distance matrix
bact_bray <- phyloseq::distance(bact, method = "bray")
#making a data frame from the sample_data
sampledf <- data.frame(sample_data(bact))
#running adonis test
adonis(bact_bray  ~ treatment, data = sampledf)
#Df SumsOfSqs MeanSqs F.Model      R2 Pr(>F)
#treatment  1   0.16515 0.16515 0.93762 0.13515  0.552
#Residuals  6   1.05682 0.17614         0.86485       
#Total      7   1.22197                 1.00000 

anosim.group<-get_variable(bact, "treatment")
anosim(bact_bray, anosim.group)

#ANOSIM statistic R: -0.08333 
#Significance: 0.662 

p1 <- plot_ordination(bact, ord1, color="treatment") +
  geom_point(size=4) 
p1

p2 <- plot_ordination(bact, ord2, color = 'treatment') +
  geom_point(size=4,) +
  labs(
    x = "PCo1 (30.2%)",
    y = "PCo2 (18,8%)"
  ) #+
  #scale_shape_manual(values = c(17,19))
  
#md.meta<-cbind(mdf$Sample,mdf[,6:13])
#md.meta<-aggregate(md.meta[, 2:9], list(md.meta$`mdf$Sample`), mean)
#rownames(md.meta) <- md.meta[,1]
#meta.df <- md.meta[,2:9]
#scale.meta.md <- scale(meta.df)

#ef <- envfit(ord2$vectors, scale.meta.df, permutations = 999)
#plot(ef, col = c("black"), cex = .8)


## From tutorial page
veganotu <- function(physeq) {
  OTU <- otu_table(physeq)
  if (taxa_are_rows(OTU)) {
    OTU <- t(OTU)
  }
  OTU <- as(OTU, "matrix")
  return(OTU)
}
vegansam <- function(physeq) {
  sam <- sample_data(physeq)
  i <- sapply(sam, is.numeric)
  j <- sapply(sam, is.character)
  k <- sapply(sam, is.factor)
  sam <- as.matrix(sam)
  sam <- as.data.frame(sam)
  sam[i] <- lapply(sam[i], as.numeric)
  sam[j] <- lapply(sam[j], as.character)
  sam[k] <- lapply(sam[k], as.factor)
  return(sam)
}

library(vegan)

otu <- veganotu(bact)
otu.h <- decostand(otu, "hellinger")


otu.h.d <- vegdist(otu.h, "euclidean")
plot(hclust(otu.h.d, method="average"))

pca <- rda(otu.h)
plot(pca, display="sites", scaling=1, type="text")
sam.data <- vegansam(bact)

ordiellipse(pca, groups=sam.data$treatment, display="sites", scaling=1, kind="sd")
ordispider(pca, groups=sam.data$treatment, display="sites", scaling=1)



