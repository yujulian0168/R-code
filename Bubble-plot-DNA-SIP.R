rm(list = ls(all.names = TRUE))

setwd("~/Downloads/")
library(reshape2)
library(dplyr)
library(ggplot2)
# Plot of presenceabsence of genes in metagenomes

## read in data
gene.data.bc<-read.csv("~/Desktop/BIOCHAR/3_DNA-SIP_Metagenomics/KO-gene-bc-plot4.csv", header = T)
gene.data.bc<-gene.data.bc[,-4] # remove KO terms - not used so remove
gene.data.c<-read.csv("~/Desktop/BIOCHAR/3_DNA-SIP_Metagenomics/KO-gene-c-plot2.csv", header = T)
gene.data.c<-gene.data.c[,-4] # remove KO terms - not used so remove

# melt and convert to p/a
gene.data.bc<-melt(gene.data.bc, id=c("Metabolism","KEGG.category","Gene")) # melt data
gene.data.bc<-gene.data.bc %>% mutate_if(is.numeric, ~1*(. !=0)) # convert all non-zero numeric values to 1

gene.data.c<-melt(gene.data.c, id=c("Metabolism","KEGG.category","Gene")) # melt data
gene.data.c<-gene.data.c %>% mutate_if(is.numeric, ~1*(. !=0)) # convert all non-zero numeric values to 1

# define gene names as factors
gene.data.bc$Gene<-factor(gene.data.bc$Gene, levels = c("catA","catB","catC","pcaD","pcaL","ligB","pcaG","pcaH","endoglucanase","6-phospho-beta-glucosidase","alpha-glucosidase","alpha-mannosidase","beta-glucuronidase","cebE","frcB","xylF","araF","nirK","nirS","norB","nosZ","narG","chitinase","nagA","nagB"))
gene.data.c$Gene<-factor(gene.data.c$Gene, levels = c("catA","catB","catC","pcaD","pcaL","ligB","pcaG","pcaH","endoglucanase","6-phospho-beta-glucosidase","alpha-glucosidase","alpha-mannosidase","beta-glucuronidase","cebE","frcB","xylF","araF","nirK","nirS","norB","nosZ","narG","chitinase","nagA","nagB"))

# read in bin completeness data
comp.data<-read.csv("~/Desktop/BIOCHAR/3_DNA-SIP_Metagenomics/completeness-mags-R.csv", header = T)
comp.data<-read.csv("~/Desktop/BIOCHAR/3_DNA-SIP_Metagenomics/completeness-mags-R2.csv", header = T)

attach(comp.data)
bc.comp<-comp.data[1:49,]
c.comp<-comp.data[50:84,]
# order factors
bc.comp$taxa.bin <- factor(bc.comp$taxa.bin,levels = c("Acidobacteria-1.33","Actino-Actinomycetales-1.13","Actino-Actinomycetales-1.22","Actino-Actinomycetales-3.28_1","Actino-Actinomycetales-8.40","Actino-Mycobacteriales-1.6_1","Actino-Mycobacteriales-3.22_1","Actino-Mycobacteriales-3.25","Actino-Mycobacteriales-3.29","Actino-Mycobacteriales-3.37","Actino-Mycobacteriales-4.17_1","Actino-Mycobacteriales-8.36",
                                               "Actino-Propionibacteriales-1.31_1","Actino-Propionibacteriales-3.8","Actino-Streptomycetales-1.32","Actino-Streptomycetales-4.6_1","Actino-Streptomycetales-1.17","Actino-Streptomycetales-1.21","Actino-Streptomycetales-1.35","Actino-Streptomycetales-3.16","Actino-Streptomycetales-3.19","Actino-Streptomycetales-4.20","Actino-Streptomycetales-8.18","Actino-Streptomycetales-8.45","Actino-Streptosporangiales-1.23","Actino-Streptosporangiales-4.18_1","Actino-Streptosporangiales-8.41_1_1","Actino-Thermoleophilia-1.3",
                                               "Alphaproteobacteria-1.14_1","Alphaproteobacteria-1.37","Alphaproteobacteria-3.9","Alphaproteobacteria-4.9_1_1","Alphaproteobacteria-4.12_3","Betaproteobacteria-3.15","Deltaproteobacteria-8.14","Deltaproteobacteria-8.16","Deltaproteobacteria-8.9_1_1","Gammaproteobacteria-1.18","Gammaproteobacteria-3.6","Gammaproteobacteria-4.30_1_1","Gammaproteobacteria-8.4","Gammaproteobacteria-8.17_1_1",
                                               "Gemmatimonadetes-1.36","Gemmatimonadetes-3.21","Gemmatimonadetes-3.38","Gemmatimonadetes-4.3","Gemmatimonadetes-4.31","Gemmatimonadetes-8.6","Gemmatimonadetes-8.42"))

c.comp$taxa.bin <- factor(c.comp$taxa.bin,levels = c("Acidobacteria-6.3","Actino-Actinomycetales-2.16","Actino-Actinomycetales-5.13","Actino-Actinomycetales-5.34","Actino-Actinomycetales-6.17","Actino-Actinomycetales-6.19","Actino-Actinomycetales-7.20",
"Actino-Mycobacteriales-2.2","Actino-Mycobacteriales-2.3","Actino-Mycobacteriales-2.21","Actino-Mycobacteriales-2.24","Actino-Mycobacteriales-2.36","Actino-Mycobacteriales-5.27","Actino-Mycobacteriales-7.14",
"Actino-Propionibacteriales-5.1","Actino-Streptomycetales-6.9","Actino-Streptomycetales-2.15","Actino-Streptomycetales-2.31","Actino-Streptomycetales-5.20","Actino-Streptomycetales-6.1_1","Actino-Streptomycetales-7.11","Actino-Streptomycetales-7.19_2",
"Actino-Streptosporangiales-2.23_2","Actino-Streptosporangiales-2.23_3","Actino-Streptosporangiales-5.30","Actino-Streptosporangiales-7.12","Actino-Thermoleophilia-2.17","Alphaproteobacteria-2.7","Alphaproteobacteria-6.18","Betaproteobacteria-7.21",
"Gemmatimonadetes-5.5","Gemmatimonadetes-5.19","Gemmatimonadetes-6.2","Gemmatimonadetes-6.6","Gemmatimonadetes-7.13"))

a<-ggplot(bc.comp, aes(x=taxa.bin, y=completeness)) + # basic ggplot  order x by value of y
  geom_bar(stat = "identity") + # bar plot
  geom_col(fill = "#86868699") + # choose color of bars
  labs(x=NULL, y="Bin Completeness (%)") +
  coord_cartesian(ylim  = c(50,100)) + # set axis limits
  ggtitle("Biochar")+
  theme(plot.title = element_text(hjust = 0.5))+
  theme(axis.ticks.x=element_blank(),
      axis.text.x=element_text(size=10,angle=-90,hjust=.1), # flip first x-axis labels 90 degress 
       plot.margin = margin(0, 0, 0, 0, "cm")) # axis.text.y=element_blank())  

b<-ggplot(c.comp, aes(x=taxa.bin, y=completeness)) +     # basic ggplot 
  geom_bar(stat = "identity") + # bar plot
  geom_col(fill = "#86868699") + # choose color of bars
  xlab("")+ # remove X label names
  ylab("Bin Completeness (%)") +
  ggtitle("Control")+
  theme(plot.title = element_text(hjust = 0.5))+
  coord_cartesian(ylim  = c(50,100)) + # adjust y-axis scale
 theme(axis.ticks.x=element_blank(),
        axis.text.x=element_text(size=10,angle=-90,hjust=.1),# flip first x-axis labels 90 degress 
        plot.margin = margin(0, 0, 0, 0, "cm")) # axis.text.y=element_blank())  


gene.b<-ggplot() + 
  geom_point(data=gene.data.bc,aes(x=variable,y=Gene,shape=as.factor(value),color=Metabolism),size = 3) + 
  theme_classic() + 
  xlab("")+
  ylab("") +
  theme(axis.ticks.x=element_blank(),
        axis.ticks.y=element_blank(),
        legend.text=element_text(size=10),
        #legend.position="none",
        axis.text.x=element_text(size=9,angle=-90,hjust=.1),
        axis.text.y=element_text(size=8)) +
  scale_shape_manual(values=c(32, 19)) +
  theme(strip.text.x=element_text(size=5)) +
  theme(legend.box="horizontal",
        panel.background=element_rect(fill=NA,color="black")) +
  guides(shape = FALSE) # don't show legend for shape

gene.c<-ggplot() + 
  geom_point(data=gene.data.c,aes(x=variable,y=Gene,shape=as.factor(value),color=Metabolism),size = 3) + 
  theme_classic() + 
  xlab("")+
  ylab(NULL) +
  theme(axis.ticks.x=element_blank(),
        axis.ticks.y=element_blank(),
        legend.text=element_text(size=10),
        legend.position="none",
        axis.text.x=element_text(size=10,angle=-90,hjust=.1),
        axis.text.y=element_text(size=8)) +
  scale_shape_manual(values=c(32, 19)) +
  theme(strip.text.x=element_text(size=5)) +
  #theme(legend.position="none")
  theme(legend.box="vertical",
        panel.background=element_rect(fill=NA,color="black")) +
    guides(shape = FALSE)


## Combine plots in panels
library(cowplot)

plot_grid(gene.b+ theme(plot.margin = unit(c(0, 0, 0, 0), "cm")),
          gene.c+ theme(plot.margin = unit(c(0, 0, 0, 0), "cm")),
          a+ theme(plot.margin = unit(c(0, 0, 0, 0), "cm")),
          b+ theme(plot.margin = unit(c(0, 0, 0, 0), "cm")),
          ncol = 2, align = "v", axis = "tblr", rel_widths = c(1.9, 1.7))

# Remove some duplicate axes
a= a + theme(axis.title.x=element_blank(),
                                axis.text.x=element_blank())

b = b + theme(axis.title.x=element_blank(),
             axis.text.x=element_blank())
                                

# Modify margin c(top, right, bottom, left) to reduce the distance between plots
#and align G1 density with the scatterplot
a= a + theme(plot.margin = unit(c(0.5, 0, 0, 0.7), "cm"))
gene.b = gene.b + theme(plot.margin = unit(c(0, 0, 0.5, 0.5), "cm"))

b = b + theme(plot.margin = unit(c(0.5, 0, 0, 0.7), "cm"))
gene.b = gene.b + theme(plot.margin = unit(c(0, 0, 0.5, 0.5), "cm"))
# Combine all plots together and crush graph density with rel_heights
first_col = plot_grid(a, gene.b, ncol = 1, align = "v",rel_heights = c(1, 3), rel_widths = c(3,1))
second_col = plot_grid(b, gene.c, ncol = 1, align = "v",rel_heights = c(1, 3), rel_widths = c(3,1))

plot_grid(first_col, second_col,
          ncol =2 ,  axis = "b",rel_widths = c(1.1, 1), rel_heights = c(1, 2),labels = "AUTO")

