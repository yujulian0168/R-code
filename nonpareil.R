setwd("/Users/julian/Desktop/BIOCHAR/MetaG-bact/nonpareil")
#install.packages("Nonpareil")
library(Nonpareil)
#For individual curve
Nonpareil.curve('output.npo')
np<-Nonpareil.curve('output.npo')
np$diversity

all.files = c("output1_NBC1.npo","output2_NBC1.npo","output3_NBC1.npo","output4_NBC1.npo",
              "output1_NBC2.npo","output2_NBC2.npo","output3_NBC2.npo","output4_NBC2.npo",
              "output1_NBC3.npo","output2_NBC3.npo","output3_NBC3.npo","output4_NBC3.npo",
              "output1_BC1.npo","output2_BC1.npo","output3_BC1.npo","output4_BC1.npo",
              "output1_BC2.npo","output2_BC2.npo","output3_BC2.npo","output4_BC2.npo",
              "output1_BC3.npo","output2_BC3.npo","output3_BC3.npo","output4_BC3.npo")
Nonpareil.curve.batch(all.files)
nps<-Nonpareil.set(all.files)
print(nps)
# Extract Nd diversity index
summary(nps)[,"diversity"]
# Extract sequencing effort for nearly complete coverage (in Gbp)
summary(nps)[,"LRstar"]/1e9
# Show current coverage (as %)
summary(nps)[,"C"]*100
# Predict coverage for a sequencing effort of 10Gbp
sapply(nps$np.curves, predict, 10e9)

plot(nps.1, main = "Nonpareil Curves", legend.opts = FALSE, xlim=c(1e+6, 1e+15))
Nonpareil.legend(nps,x = 'bottomright',cex = 0.7)

nps.1<-Nonpareil.set(all.files, plot.opts = list(plot.observed =F, model.lwd = 1.2, legend.opts = FALSE,xlim=c(1e+6, 1e+15)))
Nonpareil.legend(nps.1,x = 'bottomright',cex = 0.8)

##
plot(nps.1, ylab = 'Estimated average converage (%)', xlab = 'Sequencing effort (bp)', main = '',plot.observed =F,
     plot.diversity = F, xlim=c(1e+6, 1e+15),model.lwd = 1.2,legend.opts = FALSE)
###
nps.2<-Nonpareil.set('output1_BC1.npo', plot.opts = list(plot.observed =T, model.lwd = 0.7,curve.lwd = 2, legend.opts = FALSE,xlim=c(1e+6, 1e+15)))

#Estimating coverage (as %)
cover<-summary(nps)[,"C"]*100
factor<-c('biochar','biochar','biochar','biochar','biochar','biochar','biochar','biochar','biochar','biochar','biochar','biochar','control','control','control','control','control','control','control','control','control','control','control','control')
 
as.factor(factor)
#[1] biochar biochar biochar biochar biochar biochar biochar biochar biochar biochar biochar biochar control
#[14] control control control control control control control control control control control
#Levels: biochar control
C<-data.frame(cover,factor)

aggregate(C[,1], list(C$factor), mean)
#Group.1        x
#1 biochar 28.00813
#2 control 15.04283

#Diversity
div<-summary(nps)[,"diversity"]
D<-data.frame(div,factor)
aggregate(D[,1], list(C$factor), mean)
#Group.1        x
#1 biochar 23.28814
#2 control 23.21706
