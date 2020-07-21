rm(list = ls(all.names = TRUE))
setwd("~/Desktop/FL-grazeland_project/qPCR/")

library(car)
data.n.16<- read.csv("ngenes.per.16S.csv", header = T)
attach(data.n.16)
summary(data.n.16)

out.nifH<-lm(nifH.per.16S~Management*Horizon*Date)
resid<-out.nifH$resid
qqPlot(resid)#not normal
par(mfrow=c(1,1))
plot(out) # a little squiggly

nifH.copies<-data.n.16$nifH.per.16S

summary(aov(out.nifH))
#                            Df Sum Sq  Mean Sq F value   Pr(>F)    
#  Management                1 0.0259 0.025946  12.350 0.000561 ***
#  Horizon                   1 0.0013 0.001297   0.617 0.433090    
#  Date                      3 0.0481 0.016040   7.635 7.95e-05 ***
#  Management:Horizon        1 0.0004 0.000353   0.168 0.682189    
#  Management:Date           3 0.0891 0.029699  14.137 2.72e-08 ***
#  Horizon:Date              3 0.0289 0.009640   4.588 0.004053 ** 
#  Management:Horizon:Date   3 0.0243 0.008088   3.850 0.010610 *  
#  Residuals               175 0.3676 0.002101  
require(graphics)
interaction.plot(Management,Date,nifH.copies) #interaction
interaction.plot(Horizon, Date, nifH.copies)# interaction

out.1.nifH<-lm(nifH.copies~Description.2)
ANOVA<-aov(out.1.nifH)

library(agricolae)
posthoc.nifH<-HSD.test(out.1.nifH,"Description.2",group=TRUE,console=TRUE)
tuk.nifH.labs<-posthoc.nifH$groups

#nirK
out.nirK<-lm(nirK.per.16S~Management*Horizon*Date)
resid<-out.nirK$resid
qqPlot(resid)#not normal
par(mfrow=c(1,1))
plot(out) # a little squiggly

nirK.copies<-data.n.16$nirK.per.16S

summary(aov(out.nirK))
#                            Df Sum Sq  Mean Sq F value   Pr(>F)    
# Management                1  0.022 0.02181   0.898  0.34472    
# Horizon                   1  0.006 0.00555   0.228  0.63326    
# Date                      3  0.410 0.13662   5.622  0.00106 ** 
# Management:Horizon        1  0.044 0.04371   1.799  0.18163    
# Management:Date           3  0.745 0.24826  10.216 3.11e-06 ***
# Horizon:Date              3  0.073 0.02424   0.997  0.39548    
# Management:Horizon:Date   3  0.040 0.01345   0.554  0.64644    
# Residuals               175  4.253 0.02430 
require(graphics)
interaction.plot(Management,Date,nirK.copies) #interaction

out.1.nirK<-lm(nirK.copies~Description.2)
ANOVA<-aov(out.1.nirK)

posthoc.nirK<-HSD.test(out.1.nirK,"Description.2",group=TRUE,console=TRUE)
tuk.nirK.labs<-posthoc.nirK$groups

#nirS
out.nirS<-lm(nirS.per.16S~Management*Horizon*Date)
resid<-out.nirS$resid
qqPlot(resid)#not normal
par(mfrow=c(1,1))
plot(out) # a little squiggly

nirS.copies<-data.n.16$nirS.per.16S

summary(aov(out.nirS))
#                            Df Sum Sq  Mean Sq F value   Pr(>F)    
# Management                1 0.000349 0.0003491   7.891 0.005532 ** 
# Horizon                   1 0.000281 0.0002809   6.349 0.012644 *  
# Date                      3 0.000842 0.0002808   6.346 0.000415 ***
# Management:Horizon        1 0.000313 0.0003131   7.078 0.008529 ** 
# Management:Date           3 0.000838 0.0002794   6.316 0.000431 ***
# Horizon:Date              3 0.000850 0.0002833   6.403 0.000385 ***
# Management:Horizon:Date   3 0.000796 0.0002655   6.001 0.000648 ***
# Residuals               175 0.007742 0.0000442 
require(graphics)
interaction.plot(Management,Date,nirS.copies) #interaction
interaction.plot(Management,Horizon,nirS.copies) #interaction
interaction.plot(Horizon,Date,nirS.copies) #interaction

out.1.nirS<-lm(nirS.copies~Description.2)
ANOVA<-aov(out.1.nirS)

posthoc.nirS<-HSD.test(out.1.nirS,"Description.2",group=TRUE,console=TRUE)
tuk.nirS.labs<-posthoc.nirS$groups

#nosZ
out.nosZ<-lm(nosZ.per.16S~Management*Horizon*Date)
resid<-out.nosZ$resid
qqPlot(resid)#not normal
par(mfrow=c(1,1))
plot(out) # a little squiggly

nosZ.copies<-data.n.16$nosZ.per.16S

summary(aov(out.nosZ))
#                            Df Sum Sq  Mean Sq F value   Pr(>F)    
# Management                1  0.247 0.24740   5.583 0.01923 * 
# Horizon                   1  0.193 0.19308   4.357 0.03830 * 
# Date                      3  0.661 0.22048   4.975 0.00245 **
# Management:Horizon        1  0.203 0.20308   4.583 0.03368 * 
# Management:Date           3  0.623 0.20777   4.689 0.00356 **
# Horizon:Date              3  0.609 0.20297   4.580 0.00410 **
# Management:Horizon:Date   3  0.601 0.20042   4.523 0.00442 **
# Residuals               175  7.755 0.04431      
require(graphics)
interaction.plot(Management,Date,nosZ.copies) #interaction
interaction.plot(Management,Horizon,nosZ.copies) #interaction
interaction.plot(Horizon,Date,nosZ.copies) #interaction

out.1.nosZ<-lm(nosZ.copies~Description.2)
ANOVA<-aov(out.1.nosZ)

posthoc.nosZ<-HSD.test(out.1.nosZ,"Description.2",group=TRUE,console=TRUE)
tuk.nosZ.labs<-posthoc.nosZ$groups
#Graphing

# Summarize data for graphing
## Gives count, mean, standard deviation, standard error of the mean, and confidence interval (default 95%).
##   data: a data frame.
##   measurevar: the name of a column that contains the variable to be summariezed
##   groupvars: a vector containing names of columns that contain grouping variables
##   na.rm: a boolean that indicates whether to ignore NA's
##   conf.interval: the percent range of the confidence interval (default is 95%)
summarySE <- function(data=NULL, measurevar, groupvars=NULL, na.rm=FALSE,
                      conf.interval=.95, .drop=TRUE) {
  library(plyr)
  
  # New version of length which can handle NA's: if na.rm==T, don't count them
  length2 <- function (x, na.rm=FALSE) {
    if (na.rm) sum(!is.na(x))
    else       length(x)
  }
  
  # This does the summary. For each group's data frame, return a vector with
  # N, mean, and sd
  datac <- ddply(data, groupvars, .drop=.drop,
                 .fun = function(xx, col) {
                   c(N    = length2(xx[[col]], na.rm=na.rm),
                     mean = mean   (xx[[col]], na.rm=na.rm),
                     sd   = sd     (xx[[col]], na.rm=na.rm)
                   )
                 },
                 measurevar
  )
  
  # Rename the "mean" column    
  datac <- rename(datac, c("mean" = measurevar))
  
  datac$se <- datac$sd / sqrt(datac$N)  # Calculate standard error of the mean
  
  # Confidence interval multiplier for standard error
  # Calculate t-statistic for confidence interval: 
  # e.g., if conf.interval is .95, use .975 (above/below), and use df=N-1
  ciMult <- qt(conf.interval/2 + .5, datac$N-1)
  datac$ci <- datac$se * ciMult
  
  return(datac)
}

summ.nifH.16S <- summarySE(data.n.16, measurevar = "nifH.per.16S", groupvars = c("Management","Horizon","Date", "Description.2"))
summ.nifH.16S
write.table(summ.nifH.16S, "nifH.16S-qPCR-summ.txt", sep = '\t')

summ.nirK.16S <- summarySE(data.n.16, measurevar = "nirK.per.16S", groupvars = c("Management","Horizon","Date", "Description.2"))
summ.nirK.16S
write.table(summ.nirK.16S, "nirK.16S-qPCR-summ.txt", sep = '\t')

summ.nirS.16S <- summarySE(data.n.16, measurevar = "nirS.per.16S", groupvars = c("Management","Horizon","Date", "Description.2"))
summ.nirS.16S
write.table(summ.nirS.16S, "nirS.16S-qPCR-summ.txt", sep = '\t')

summ.nosZ.16S <- summarySE(data.n.16, measurevar = "nosZ.per.16S", groupvars = c("Management","Horizon","Date", "Description.2"))
summ.nosZ.16S
write.table(summ.nosZ.16S, "nosZ.16S-qPCR-summ.txt", sep = '\t')
#
final.nifH <- merge(summ.nifH.16S, tuk.nifH.labs, by.x = "nifH.per.16S", by.y = "nifH.copies")

final.nirK <- merge(summ.nirK.16S, tuk.nirK.labs, by.x = "nirK.per.16S", by.y = "nirK.copies")

final.nirS <- merge(summ.nirS.16S, tuk.nirS.labs, by.x = "nirS.per.16S", by.y = "nirS.copies")

final.nosZ <- merge(summ.nosZ.16S, tuk.nosZ.labs, by.x = "nosZ.per.16S", by.y = "nosZ.copies")


library(ggplot2)

# nifH Plot with Tukey's 
nifH.plot<-ggplot(final.nifH, aes(x = Treatment, y = nifH.per.16S, fill = Horizon)) +
  geom_bar(stat = "identity", position = "dodge") +
  facet_grid(~Date) + 
  scale_fill_manual(values = c("#00AFBB", "#FC4E07")) +
  geom_errorbar(aes(ymin = nifH.per.16S - se, ymax = nifH.per.16S + se), position = position_dodge(0.9), width = 0.2) +
  ylab("nifH/16S rRNA Copies per gram Soil") +
  xlab("Management") + 
  geom_text(data = final, size = 3, aes(x = Treatment, y = nifH.per.16S , label = groups),position = position_dodge(0.9), vjust=-4) 

# nirK Plot with tukey's
nirK.plot<-ggplot(final.nirK, aes(x = Management, y = nirK.per.16S, fill = Horizon)) +
  geom_bar(stat = "identity", position = "dodge") +
  facet_grid(~Date) + 
  scale_fill_manual(values = c("#00AFBB", "#FC4E07")) +
  geom_errorbar(aes(ymin = nirK.per.16S - se, ymax = nirK.per.16S + se), position = position_dodge(0.9), width = 0.2) +
  ylab("nirK/16S rRNA Copies per gram Soil") +
  xlab("Management") + 
  geom_text(data = final.nirK, size = 3, aes(x = Management, y = nirK.per.16S , label = groups),position = position_dodge(0.9), vjust=-4) 

# nirS Plot with tukey's
nirS.plot<-ggplot(final.nirS, aes(x = Management, y = nirS.per.16S, fill = Horizon)) +
  geom_bar(stat = "identity", position = "dodge") +
  facet_grid(~Date) + 
  scale_fill_manual(values = c("#00AFBB", "#FC4E07")) +
  geom_errorbar(aes(ymin = nirS.per.16S - se, ymax = nirS.per.16S + se), position = position_dodge(0.9), width = 0.2) +
  ylab("nirS/16S rRNA Copies per gram Soil") +
  xlab("Management") + 
  geom_text(data = final.nirS, size = 3, aes(x = Management, y = nirS.per.16S , label = groups),position = position_dodge(0.9), vjust=-4) 

# nosZ Plot with tukey's
nosZ.plot<-ggplot(final.nosZ, aes(x = Management, y = nosZ.per.16S, fill = Horizon)) +
  geom_bar(stat = "identity", position = "dodge") +
  facet_grid(~Date) + 
  scale_fill_manual(values = c("#00AFBB", "#FC4E07")) +
  geom_errorbar(aes(ymin = nosZ.per.16S - se, ymax = nosZ.per.16S + se), position = position_dodge(0.9), width = 0.2) +
  ylab("nosZ/16S rRNA Copies per gram Soil") +
  xlab("Management") + 
  geom_text(data = final.nosZ, size = 3, aes(x = Management, y = nosZ.per.16S , label = groups),position = position_dodge(0.9), vjust=-4) 

# combine plots
library(cowplot)
legend <- get_legend(nosZ.plot)
plot.a<- nifH.plot + theme(legend.position = 'none')
plot.b<- nirK.plot + theme(legend.position = 'none')
plot.c<- nirS.plot + theme(legend.position = 'none')
plot.d<- nosZ.plot + theme(legend.position = 'none')

plots<-plot_grid(plot.a, plot.b, plot.c, plot.d, ncol = 2, nrow = 2, align = 'v',axis = "l")

plot_grid(plots, legend, nrow = 1 ,rel_widths = c(3,.2))
