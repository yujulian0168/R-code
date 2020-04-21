setwd("~/Desktop/BIOCHAR/3_DNA-SIP_Metagenomics/KO-txt-file")
#filenames = list.files(pattern="*.csv")
#filenames

library(dplyr)

###### read in files 
bin1.3<-read.csv("JY2S18_bin_3_ko.txt.csv", header = T, quote = "", stringsAsFactors = FALSE, row.names = NULL)
bin1.6_1<-read.csv("JY2S18_bin_6_1_ko.txt.csv", header = T, quote = "", stringsAsFactors = FALSE, row.names = NULL)
bin1.13<-read.csv("JY2S18_bin_13_ko.txt.csv", header = T, quote = "", stringsAsFactors = FALSE, row.names = NULL)
bin1.14_1<-read.csv("JY2S18_bin_14_1_ko.txt.csv", header = T, quote = "", stringsAsFactors = FALSE, row.names = NULL)
bin1.17<-read.csv("JY2S18_bin_17_ko.txt.csv", header = T, quote = "", stringsAsFactors = FALSE, row.names = NULL)
bin1.18<-read.csv("JY2S18_bin_18_ko.txt.csv", header = T, quote = "", stringsAsFactors = FALSE, row.names = NULL)
bin1.21<-read.csv("JY2S18_bin_21_ko.txt.csv", header = T, quote = "", stringsAsFactors = FALSE, row.names = NULL)
bin1.22<-read.csv("JY2S18_bin_22_ko.txt.csv", header = T, quote = "", stringsAsFactors = FALSE, row.names = NULL)
bin1.23<-read.csv("JY2S18_bin_23_ko.txt.csv", header = T, quote = "", stringsAsFactors = FALSE, row.names = NULL)
bin1.31_1<-read.csv("JY2S18_bin_31_1_ko.txt.csv", header = T, quote = "", stringsAsFactors = FALSE, row.names = NULL)
bin1.32<-read.csv("JY2S18_bin_32_ko.txt.csv", header = T, quote = "", stringsAsFactors = FALSE, row.names = NULL)
bin1.33<-read.csv("JY2S18_bin_33_ko.txt.csv", header = T, quote = "", stringsAsFactors = FALSE, row.names = NULL)
bin1.35<-read.csv("JY2S18_bin_35_ko.txt.csv", header = T, quote = "", stringsAsFactors = FALSE, row.names = NULL)
bin1.36<-read.csv("JY2S18_bin_36_ko.txt.csv", header = T, quote = "", stringsAsFactors = FALSE, row.names = NULL)
bin1.37<-read.csv("JY2S18_bin_37_ko.txt.csv", header = T, quote = "", stringsAsFactors = FALSE, row.names = NULL)
bin2.2<-read.csv("JY11S19_bin_2_ko.txt.csv", header = T, quote = "", stringsAsFactors = FALSE, row.names = NULL)
bin2.3<-read.csv("JY11S19_bin_3_ko.txt.csv", header = T, quote = "", stringsAsFactors = FALSE, row.names = NULL)
bin2.7<-read.csv("JY11S19_bin_7_ko.txt.csv", header = T, quote = "", stringsAsFactors = FALSE, row.names = NULL)
bin2.15<-read.csv("JY11S19_bin_15_ko.txt.csv", header = T, quote = "", stringsAsFactors = FALSE, row.names = NULL)
bin2.16<-read.csv("JY11S19_bin_16_ko.txt.csv", header = T, quote = "", stringsAsFactors = FALSE, row.names = NULL)
bin2.17<-read.csv("JY11S19_bin_17_ko.txt.csv", header = T, quote = "", stringsAsFactors = FALSE, row.names = NULL)
bin2.21<-read.csv("JY11S19_bin_21_ko.txt.csv", header = T, quote = "", stringsAsFactors = FALSE, row.names = NULL)
bin2.23_2<-read.csv("JY11S19_bin_23_2_ko.txt.csv", header = T, quote = "", stringsAsFactors = FALSE, row.names = NULL)
bin2.23_3<-read.csv("JY11S19_bin_23_3_ko.txt.csv", header = T, quote = "", stringsAsFactors = FALSE, row.names = NULL)
bin2.24<-read.csv("JY11S19_bin_24_ko.txt.csv", header = T, quote = "", stringsAsFactors = FALSE, row.names = NULL)
bin2.31<-read.csv("JY11S19_bin_31_ko.txt.csv", header = T, quote = "", stringsAsFactors = FALSE, row.names = NULL)
bin2.36<-read.csv("JY11S19_bin_36_ko.txt.csv", header = T, quote = "", stringsAsFactors = FALSE, row.names = NULL)
bin3.6<-read.csv("JY20S20_bin_6_ko.txt.csv", header = T, quote = "", stringsAsFactors = FALSE, row.names = NULL)
bin3.8<-read.csv("JY20S20_bin_8_ko.txt.csv", header = T, quote = "", stringsAsFactors = FALSE, row.names = NULL)
bin3.9<-read.csv("JY20S20_bin_9_ko.txt.csv", header = T, quote = "", stringsAsFactors = FALSE, row.names = NULL)
bin3.15<-read.csv("JY20S20_bin_15_ko.txt.csv", header = T, quote = "", stringsAsFactors = FALSE, row.names = NULL)
bin3.16<-read.csv("JY20S20_bin_16_ko.txt.csv", header = T, quote = "", stringsAsFactors = FALSE, row.names = NULL)
bin3.19<-read.csv("JY20S20_bin_19_ko.txt.csv", header = T, quote = "", stringsAsFactors = FALSE, row.names = NULL)
bin3.21<-read.csv("JY20S20_bin_21_ko.txt.csv", header = T, quote = "", stringsAsFactors = FALSE, row.names = NULL)
bin3.22_1<-read.csv("JY20S20_bin_22_1_ko.txt.csv", header = T, quote = "", stringsAsFactors = FALSE, row.names = NULL)
bin3.25<-read.csv("JY20S20_bin_25_ko.txt.csv", header = T, quote = "", stringsAsFactors = FALSE, row.names = NULL)
bin3.28_1<-read.csv("JY20S20_bin_28_1_ko.txt.csv", header = T, quote = "", stringsAsFactors = FALSE, row.names = NULL)
bin3.29<-read.csv("JY20S20_bin_29_ko.txt.csv", header = T, quote = "", stringsAsFactors = FALSE, row.names = NULL)
bin3.37<-read.csv("JY20S20_bin_37_ko.txt.csv", header = T, quote = "", stringsAsFactors = FALSE, row.names = NULL)
bin3.38<-read.csv("JY20S20_bin_38_ko.txt.csv", header = T, quote = "", stringsAsFactors = FALSE, row.names = NULL)
bin4.3<-read.csv("JY38S21_bin_3_ko.txt.csv", header = T, quote = "", stringsAsFactors = FALSE, row.names = NULL)
bin4.6_1<-read.csv("JY38S21_bin_6_1_ko.txt.csv", header = T, quote = "", stringsAsFactors = FALSE, row.names = NULL)
bin4.9_1_1<-read.csv("JY38S21_bin_9_1_1_ko.txt.csv", header = T, quote = "", stringsAsFactors = FALSE, row.names = NULL)
bin4.12_3<-read.csv("JY38S21_bin_12_3_ko.txt.csv", header = T, quote = "", stringsAsFactors = FALSE, row.names = NULL)
bin4.17_1<-read.csv("JY38S21_bin_17_1_ko.txt.csv", header = T, quote = "", stringsAsFactors = FALSE, row.names = NULL)
bin4.18_1<-read.csv("JY38S21_bin_18_1_ko.txt.csv", header = T, quote = "", stringsAsFactors = FALSE, row.names = NULL)
bin4.20<-read.csv("JY38S21_bin_20_ko.txt.csv", header = T, quote = "", stringsAsFactors = FALSE, row.names = NULL)
bin4.30_1_1<-read.csv("JY38S21_bin_30_1_1_ko.txt.csv", header = T, quote = "", stringsAsFactors = FALSE, row.names = NULL)
bin4.31<-read.csv("JY38S21_bin_31_ko.txt.csv", header = T, quote = "", stringsAsFactors = FALSE, row.names = NULL)
bin5.1<-read.csv("JY47S22_bin_1_ko.txt.csv", header = T, quote = "", stringsAsFactors = FALSE, row.names = NULL)
bin5.5<-read.csv("JY47S22_bin_5_ko.txt.csv", header = T, quote = "", stringsAsFactors = FALSE, row.names = NULL)
bin5.13<-read.csv("JY47S22_bin_13_ko.txt.csv", header = T, quote = "", stringsAsFactors = FALSE, row.names = NULL)
bin5.19<-read.csv("JY47S22_bin_19_ko.txt.csv", header = T, quote = "", stringsAsFactors = FALSE, row.names = NULL)
bin5.20<-read.csv("JY47S22_bin_20_ko.txt.csv", header = T, quote = "", stringsAsFactors = FALSE, row.names = NULL)
bin5.27<-read.csv("JY47S22_bin_27_ko.txt.csv", header = T, quote = "", stringsAsFactors = FALSE, row.names = NULL)
bin5.30<-read.csv("JY47S22_bin_30_ko.txt.csv", header = T, quote = "", stringsAsFactors = FALSE, row.names = NULL)
bin5.34<-read.csv("JY47S22_bin_34_ko.txt.csv", header = T, quote = "", stringsAsFactors = FALSE, row.names = NULL)
bin6.1_1<-read.csv("JY56S23_bin_1_1_ko.txt.csv", header = T, quote = "", stringsAsFactors = FALSE, row.names = NULL)
bin6.2<-read.csv("JY56S23_bin_2_ko.txt.csv", header = T, quote = "", stringsAsFactors = FALSE, row.names = NULL)
bin6.3<-read.csv("JY56S23_bin_3_ko.txt.csv", header = T, quote = "", stringsAsFactors = FALSE, row.names = NULL)
bin6.6<-read.csv("JY56S23_bin_6_ko.txt.csv", header = T, quote = "", stringsAsFactors = FALSE, row.names = NULL)
bin6.9<-read.csv("JY56S23_bin_9_ko.txt.csv", header = T, quote = "", stringsAsFactors = FALSE, row.names = NULL)
bin6.17<-read.csv("JY56S23_bin_17_ko.txt.csv", header = T, quote = "", stringsAsFactors = FALSE, row.names = NULL)
bin6.18<-read.csv("JY56S23_bin_18_ko.txt.csv", header = T, quote = "", stringsAsFactors = FALSE, row.names = NULL)
bin6.19<-read.csv("JY56S23_bin_19_ko.txt.csv", header = T, quote = "", stringsAsFactors = FALSE, row.names = NULL)
bin7.11<-read.csv("JY65S24_bin_11_ko.txt.csv", header = T, quote = "", stringsAsFactors = FALSE, row.names = NULL)
bin7.12<-read.csv("JY65S24_bin_12_ko.txt.csv", header = T, quote = "", stringsAsFactors = FALSE, row.names = NULL)
bin7.13<-read.csv("JY65S24_bin_13_ko.txt.csv", header = T, quote = "", stringsAsFactors = FALSE, row.names = NULL)
bin7.14<-read.csv("JY65S24_bin_14_ko.txt.csv", header = T, quote = "", stringsAsFactors = FALSE, row.names = NULL)
bin7.19_2<-read.csv("JY65S24_bin_19_2_ko.txt.csv", header = T, quote = "", stringsAsFactors = FALSE, row.names = NULL)
bin7.20<-read.csv("JY65S24_bin_20_ko.txt.csv", header = T, quote = "", stringsAsFactors = FALSE, row.names = NULL)
bin7.21<-read.csv("JY65S24_bin_21_ko.txt.csv", header = T, quote = "", stringsAsFactors = FALSE, row.names = NULL)
bin8.4<-read.csv("JY74S25_bin_4_ko.txt.csv", header = T, quote = "", stringsAsFactors = FALSE, row.names = NULL)
bin8.6<-read.csv("JY74S25_bin_6_ko.txt.csv", header = T, quote = "", stringsAsFactors = FALSE, row.names = NULL)
bin8.9_1_1<-read.csv("JY74S25_bin_9_1_1_ko.txt.csv", header = T, quote = "", stringsAsFactors = FALSE, row.names = NULL)
bin8.14<-read.csv("JY74S25_bin_14_ko.txt.csv", header = T, quote = "", stringsAsFactors = FALSE, row.names = NULL)
bin8.16<-read.csv("JY74S25_bin_16_ko.txt.csv", header = T, quote = "", stringsAsFactors = FALSE, row.names = NULL)
bin8.17_1_1<-read.csv("JY74S25_bin_17_1_1_ko.txt.csv", header = T, quote = "", stringsAsFactors = FALSE, row.names = NULL)
bin8.18<-read.csv("JY74S25_bin_18_ko.txt.csv", header = T, quote = "", stringsAsFactors = FALSE, row.names = NULL)
bin8.36<-read.csv("JY74S25_bin_36_ko.txt.csv", header = T, quote = "", stringsAsFactors = FALSE, row.names = NULL)
bin8.40<-read.csv("JY74S25_bin_40_ko.txt.csv", header = T, quote = "", stringsAsFactors = FALSE, row.names = NULL)
bin8.41_1_1<-read.csv("JY74S25_bin_41_1_1_ko.txt.csv", header = T, quote = "", stringsAsFactors = FALSE, row.names = NULL)
bin8.42<-read.csv("JY74S25_bin_42_ko.txt.csv", header = T, quote = "", stringsAsFactors = FALSE, row.names = NULL)
bin8.45<-read.csv("JY74S25_bin_45_ko.txt.csv", header = T, quote = "", stringsAsFactors = FALSE, row.names = NULL)

# ## Replace na with bin names
# bin1.3$X[is.na(bin1.3$X)] <- "bin1.3"
# bin1.6_1$X[is.na(bin1.6_1$X)] <- "bin1.6_1"
# bin1.13$X[is.na(bin1.13$X)] <- "bin1.13"
# bin1.14_1$X[is.na(bin1.14_1$X)] <- "bin1.14_1"
# bin1.17$X[is.na(bin1.17$X)] <- "bin1.17"
# bin1.18$X[is.na(bin1.18$X)] <- "bin1.18"
# bin1.21$X[is.na(bin1.21$X)] <- "bin1.21"
# bin1.22$X[is.na(bin1.22$X)] <- "bin1.22"
# bin1.23$X[is.na(bin1.23$X)] <- "bin1.23"
# bin1.31_1$X[is.na(bin1.31_1$X)] <- "bin1.31_1"
# bin1.32$X[is.na(bin1.32$X)] <- "bin1.32"
# bin1.33$X[is.na(bin1.33$X)] <- "bin1.33"
# bin1.35$X[is.na(bin1.35$X)] <- "bin1.35"
# bin1.36$X[is.na(bin1.36$X)] <- "bin1.36"
# bin1.37$X[is.na(bin1.37$X)] <- "bin1.37"
# bin2.2$X[is.na(bin2.2$X)] <- "bin2.2"
# bin2.3$X[is.na(bin2.3$X)] <- "bin2.3"
# bin2.7$X[is.na(bin2.7$X)] <- "bin2.7"
# bin2.15$X[is.na(bin2.15$X)] <- "bin2.15"
# bin2.16$X[is.na(bin2.16$X)] <- "bin2.16"
# bin2.17$X[is.na(bin2.17$X)] <- "bin2.17"
# bin2.21$X[is.na(bin2.21$X)] <- "bin2.21"
# bin2.23_2$X[is.na(bin2.23_2$X)] <- "bin2.23_2"
# bin2.23_3$X[is.na(bin2.23_3$X)] <- "bin2.23_3"
# bin2.24$X[is.na(bin2.24$X)] <- "bin2.24"
# bin2.31$X[is.na(bin2.31$X)] <- "bin2.31"
# bin2.36$X[is.na(bin2.36$X)] <- "bin2.36"
# bin3.6$X[is.na(bin3.6$X)] <- "bin3.6"
# bin3.8$X[is.na(bin3.8$X)] <- "bin3.8"
# bin3.9$X[is.na(bin3.9$X)] <- "bin3.9"
# bin3.15$X[is.na(bin3.15$X)] <- "bin3.15"
# bin3.16$X[is.na(bin3.16$X)] <- "bin3.16"
# bin3.19$X[is.na(bin3.19$X)] <- "bin3.19"
# bin3.21$X[is.na(bin3.21$X)] <- "bin3.21"
# bin3.22_1$X[is.na(bin3.22_1$X)] <- "bin3.22_1"
# bin3.25$X[is.na(bin3.25$X)] <- "bin3.25"
# bin3.28_1$X[is.na(bin3.28_1$X)] <- "bin3.28_1"
# bin3.29$X[is.na(bin3.29$X)] <- "bin3.29"
# bin3.37$X[is.na(bin3.37$X)] <- "bin3.37"
# bin3.38$X[is.na(bin3.38$X)] <- "bin3.38"
# bin4.3$X[is.na(bin4.3$X)] <- "bin4.3"
# bin4.6_1$X[is.na(bin4.6_1$X)] <- "bin4.6_1"
# bin4.9_1_1$X[is.na(bin4.9_1_1$X)] <- "bin4.9_1_1"
# bin4.12_3$X[is.na(bin4.12_3$X)] <- "bin4.12_3"
# bin4.17_1$X[is.na(bin4.17_1$X)] <- "bin4.17_1"
# bin4.18_1$X[is.na(bin4.18_1$X)] <- "bin4.18_1"
# bin4.20$X[is.na(bin4.20$X)] <- "bin4.20"
# bin4.30_1_1$X[is.na(bin4.30_1_1$X)] <- "bin4.30_1_1"
# bin4.31$X[is.na(bin4.31$X)] <- "bin4.31"
# bin5.1$X[is.na(bin5.1$X)] <- "bin5.1"
# bin5.5$X[is.na(bin5.5$X)] <- "bin5.5"
# bin5.13$X[is.na(bin5.13$X)] <- "bin5.13"
# bin5.19$X[is.na(bin5.19$X)] <- "bin5.19"
# bin5.20$X[is.na(bin5.20$X)] <- "bin5.20"
# bin5.27$X[is.na(bin5.27$X)] <- "bin5.27"
# bin5.30$X[is.na(bin5.30$X)] <- "bin5.30"
# bin5.34$X[is.na(bin5.34$X)] <- "bin5.34"
# bin6.1_1$X[is.na(bin6.1_1$X)] <- "bin6.1_1"
# bin6.2$X[is.na(bin6.2$X)] <- "bin6.2"
# bin6.3$X[is.na(bin6.3$X)] <- "bin6.3"
# bin6.6$X[is.na(bin6.6$X)] <- "bin6.6"
# bin6.9$X[is.na(bin6.9$X)] <- "bin6.9"
# bin6.17$X[is.na(bin6.17$X)] <- "bin6.17"
# bin6.18$X[is.na(bin6.18$X)] <- "bin6.18"
# bin6.19$X[is.na(bin6.19$X)] <- "bin6.19"
# bin7.11$X[is.na(bin7.11$X)] <- "bin7.11"
# bin7.12$X[is.na(bin7.12$X)] <- "bin7.12"
# bin7.13$X[is.na(bin7.13$X)] <- "bin7.13"
# bin7.14$X[is.na(bin7.14$X)] <- "bin7.14"
# bin7.19_2$X[is.na(bin7.19_2$X)] <- "bin7.19_2"
# bin7.20$X[is.na(bin7.20$X)] <- "bin7.20"
# bin7.21$X[is.na(bin7.21$X)] <- "bin7.21"
# bin8.4$X[is.na(bin8.4$X)] <- "bin8.4"
# bin8.6$X[is.na(bin8.6$X)] <- "bin8.6"
# bin8.9_1_1$X[is.na(bin8.9_1_1$X)] <- "bin8.9_1_1"
# bin8.14$X[is.na(bin8.14$X)] <- "bin8.14"
# bin8.16$X[is.na(bin8.16$X)] <- "bin8.16"
# bin8.17_1_1$X[is.na(bin8.17_1_1$X)] <- "bin8.17_1_1"
# bin8.18$X[is.na(bin8.18$X)] <- "bin8.18"
# bin8.36$X[is.na(bin8.36$X)] <- "bin8.36"
# bin8.40$X[is.na(bin8.40$X)] <- "bin8.40"
# bin8.41_1_1$X[is.na(bin8.41_1_1$X)] <- "bin8.41_1_1"
# bin8.42$X[is.na(bin8.42$X)] <- "bin8.42"
# bin8.45$X[is.na(bin8.45$X)] <- "bin8.45"

## Group by KEGG.category, gene,KO

Bin1.3 <- bin1.3 %>% group_by(KEGG.family,KEGG.category, gene,KO) %>%   summarize(n())
Bin1.6_1 <- bin1.6_1 %>% group_by(KEGG.family,KEGG.category, gene,KO) %>%   summarize(n())
Bin1.13 <- bin1.13 %>% group_by(KEGG.family,KEGG.category, gene,KO) %>%   summarize(n())
Bin1.14_1 <- bin1.14_1 %>% group_by(KEGG.family,KEGG.category, gene,KO) %>%   summarize(n())
Bin1.17 <- bin1.17 %>% group_by(KEGG.family,KEGG.category, gene,KO) %>%   summarize(n())
Bin1.18 <- bin1.18 %>% group_by(KEGG.family,KEGG.category, gene,KO) %>%   summarize(n())
Bin1.21 <- bin1.21 %>% group_by(KEGG.family,KEGG.category, gene,KO) %>%   summarize(n())
Bin1.22 <- bin1.22 %>% group_by(KEGG.family,KEGG.category, gene,KO) %>%   summarize(n())
Bin1.23 <- bin1.23 %>% group_by(KEGG.family,KEGG.category, gene,KO) %>%   summarize(n())
Bin1.31_1 <- bin1.31_1 %>% group_by(KEGG.family,KEGG.category, gene,KO) %>%   summarize(n())
Bin1.32 <- bin1.32 %>% group_by(KEGG.family,KEGG.category, gene,KO) %>%   summarize(n())
Bin1.33 <- bin1.33 %>% group_by(KEGG.family,KEGG.category, gene,KO) %>%   summarize(n())
Bin1.35 <- bin1.35 %>% group_by(KEGG.family,KEGG.category, gene,KO) %>%   summarize(n())
Bin1.36 <- bin1.36 %>% group_by(KEGG.family,KEGG.category, gene,KO) %>%   summarize(n())
Bin1.37 <- bin1.37 %>% group_by(KEGG.family,KEGG.category, gene,KO) %>%   summarize(n())
Bin2.2 <- bin2.2 %>% group_by(KEGG.family,KEGG.category, gene,KO) %>%   summarize(n())
Bin2.3 <- bin2.3 %>% group_by(KEGG.family,KEGG.category, gene,KO) %>%   summarize(n())
Bin2.7 <- bin2.7 %>% group_by(KEGG.family,KEGG.category, gene,KO) %>%   summarize(n())
Bin2.15 <- bin2.15 %>% group_by(KEGG.family,KEGG.category, gene,KO) %>%   summarize(n())
Bin2.16 <- bin2.16 %>% group_by(KEGG.family,KEGG.category, gene,KO) %>%   summarize(n())
Bin2.17 <- bin2.17 %>% group_by(KEGG.family,KEGG.category, gene,KO) %>%   summarize(n())
Bin2.21 <- bin2.21 %>% group_by(KEGG.family,KEGG.category, gene,KO) %>%   summarize(n())
Bin2.23_2 <- bin2.23_2 %>% group_by(KEGG.family,KEGG.category, gene,KO) %>%   summarize(n())
Bin2.23_3 <- bin2.23_3 %>% group_by(KEGG.family,KEGG.category, gene,KO) %>%   summarize(n())
Bin2.24 <- bin2.24 %>% group_by(KEGG.family,KEGG.category, gene,KO) %>%   summarize(n())
Bin2.31 <- bin2.31 %>% group_by(KEGG.family,KEGG.category, gene,KO) %>%   summarize(n())
Bin2.36 <- bin2.36 %>% group_by(KEGG.family,KEGG.category, gene,KO) %>%   summarize(n())
Bin3.6 <- bin3.6 %>% group_by(KEGG.family,KEGG.category, gene,KO) %>%   summarize(n())
Bin3.8 <- bin3.8 %>% group_by(KEGG.family,KEGG.category, gene,KO) %>%   summarize(n())
Bin3.9 <- bin3.9 %>% group_by(KEGG.family,KEGG.category, gene,KO) %>%   summarize(n())
Bin3.15 <- bin3.15 %>% group_by(KEGG.family,KEGG.category, gene,KO) %>%   summarize(n())
Bin3.16 <- bin3.16 %>% group_by(KEGG.family,KEGG.category, gene,KO) %>%   summarize(n())
Bin3.19 <- bin3.19 %>% group_by(KEGG.family,KEGG.category, gene,KO) %>%   summarize(n())
Bin3.21 <- bin3.21 %>% group_by(KEGG.family,KEGG.category, gene,KO) %>%   summarize(n())
Bin3.22_1 <- bin3.22_1 %>% group_by(KEGG.family,KEGG.category, gene,KO) %>%   summarize(n())
Bin3.25 <- bin3.25 %>% group_by(KEGG.family,KEGG.category, gene,KO) %>%   summarize(n())
Bin3.28_1 <- bin3.28_1 %>% group_by(KEGG.family,KEGG.category, gene,KO) %>%   summarize(n())
Bin3.29 <- bin3.29 %>% group_by(KEGG.family,KEGG.category, gene,KO) %>%   summarize(n())
Bin3.37 <- bin3.37 %>% group_by(KEGG.family,KEGG.category, gene,KO) %>%   summarize(n())
Bin3.38 <- bin3.38 %>% group_by(KEGG.family,KEGG.category, gene,KO) %>%   summarize(n())
Bin4.3 <- bin4.3 %>% group_by(KEGG.family,KEGG.category, gene,KO) %>%   summarize(n())
Bin4.6_1 <- bin4.6_1 %>% group_by(KEGG.family,KEGG.category, gene,KO) %>%   summarize(n())
Bin4.9_1_1 <- bin4.9_1_1 %>% group_by(KEGG.family,KEGG.category, gene,KO) %>%   summarize(n())
Bin4.12_3 <- bin4.12_3 %>% group_by(KEGG.family,KEGG.category, gene,KO) %>%   summarize(n())
Bin4.17_1 <- bin4.17_1 %>% group_by(KEGG.family,KEGG.category, gene,KO) %>%   summarize(n())
Bin4.18_1 <- bin4.18_1 %>% group_by(KEGG.family,KEGG.category, gene,KO) %>%   summarize(n())
Bin4.20 <- bin4.20 %>% group_by(KEGG.family,KEGG.category, gene,KO) %>%   summarize(n())
Bin4.30_1_1 <- bin4.30_1_1 %>% group_by(KEGG.family,KEGG.category, gene,KO) %>%   summarize(n())
Bin4.31 <- bin4.31 %>% group_by(KEGG.family,KEGG.category, gene,KO) %>%   summarize(n())
Bin5.1 <- bin5.1 %>% group_by(KEGG.family,KEGG.category, gene,KO) %>%   summarize(n())
Bin5.5 <- bin5.5 %>% group_by(KEGG.family,KEGG.category, gene,KO) %>%   summarize(n())
Bin5.13 <- bin5.13 %>% group_by(KEGG.family,KEGG.category, gene,KO) %>%   summarize(n())
Bin5.19 <- bin5.19 %>% group_by(KEGG.family,KEGG.category, gene,KO) %>%   summarize(n())
Bin5.20 <- bin5.20 %>% group_by(KEGG.family,KEGG.category, gene,KO) %>%   summarize(n())
Bin5.27 <- bin5.27 %>% group_by(KEGG.family,KEGG.category, gene,KO) %>%   summarize(n())
Bin5.30 <- bin5.30 %>% group_by(KEGG.family,KEGG.category, gene,KO) %>%   summarize(n())
Bin5.34 <- bin5.34 %>% group_by(KEGG.family,KEGG.category, gene,KO) %>%   summarize(n())
Bin6.1_1 <- bin6.1_1 %>% group_by(KEGG.family,KEGG.category, gene,KO) %>%   summarize(n())
Bin6.2 <- bin6.2 %>% group_by(KEGG.family,KEGG.category, gene,KO) %>%   summarize(n())
Bin6.3 <- bin6.3 %>% group_by(KEGG.family,KEGG.category, gene,KO) %>%   summarize(n())
Bin6.6 <- bin6.6 %>% group_by(KEGG.family,KEGG.category, gene,KO) %>%   summarize(n())
Bin6.9 <- bin6.9 %>% group_by(KEGG.family,KEGG.category, gene,KO) %>%   summarize(n())
Bin6.17 <- bin6.17 %>% group_by(KEGG.family,KEGG.category, gene,KO) %>%   summarize(n())
Bin6.18 <- bin6.18 %>% group_by(KEGG.family,KEGG.category, gene,KO) %>%   summarize(n())
Bin6.19 <- bin6.19 %>% group_by(KEGG.family,KEGG.category, gene,KO) %>%   summarize(n())
Bin7.11 <- bin7.11 %>% group_by(KEGG.family,KEGG.category, gene,KO) %>%   summarize(n())
Bin7.12 <- bin7.12 %>% group_by(KEGG.family,KEGG.category, gene,KO) %>%   summarize(n())
Bin7.13 <- bin7.13 %>% group_by(KEGG.family,KEGG.category, gene,KO) %>%   summarize(n())
Bin7.14 <- bin7.14 %>% group_by(KEGG.family,KEGG.category, gene,KO) %>%   summarize(n())
Bin7.19_2 <- bin7.19_2 %>% group_by(KEGG.family,KEGG.category, gene,KO) %>%   summarize(n())
Bin7.20 <- bin7.20 %>% group_by(KEGG.family,KEGG.category, gene,KO) %>%   summarize(n())
Bin7.21 <- bin7.21 %>% group_by(KEGG.family,KEGG.category, gene,KO) %>%   summarize(n())
Bin8.4 <- bin8.4 %>% group_by(KEGG.family,KEGG.category, gene,KO) %>%   summarize(n())
Bin8.6 <- bin8.6 %>% group_by(KEGG.family,KEGG.category, gene,KO) %>%   summarize(n())
Bin8.9_1_1 <- bin8.9_1_1 %>% group_by(KEGG.family,KEGG.category, gene,KO) %>%   summarize(n())
Bin8.14 <- bin8.14 %>% group_by(KEGG.family,KEGG.category, gene,KO) %>%   summarize(n())
Bin8.16 <- bin8.16 %>% group_by(KEGG.family,KEGG.category, gene,KO) %>%   summarize(n())
Bin8.17_1_1 <- bin8.17_1_1 %>% group_by(KEGG.family,KEGG.category, gene,KO) %>%   summarize(n())
Bin8.18 <- bin8.18 %>% group_by(KEGG.family,KEGG.category, gene,KO) %>%   summarize(n())
Bin8.36 <- bin8.36 %>% group_by(KEGG.family,KEGG.category, gene,KO) %>%   summarize(n())
Bin8.40 <- bin8.40 %>% group_by(KEGG.family,KEGG.category, gene,KO) %>%   summarize(n())
Bin8.41_1_1 <- bin8.41_1_1 %>% group_by(KEGG.family,KEGG.category, gene,KO) %>%   summarize(n())
Bin8.42 <- bin8.42 %>% group_by(KEGG.family,KEGG.category, gene,KO) %>%   summarize(n())
Bin8.45 <- bin8.45 %>% group_by(KEGG.family,KEGG.category, gene,KO) %>%   summarize(n())

## Rename count column with bin name

Bin1.3 <- Bin1.3 %>% rename(Bin1.3 = `n()`)
Bin1.6_1 <- Bin1.6_1 %>% rename(Bin1.6_1 = `n()`)
Bin1.13 <- Bin1.13 %>% rename(Bin1.13 = `n()`)
Bin1.14_1 <- Bin1.14_1 %>% rename(Bin1.14_1 = `n()`)
Bin1.17 <- Bin1.17 %>% rename(Bin1.17 = `n()`)
Bin1.18 <- Bin1.18 %>% rename(Bin1.18 = `n()`)
Bin1.21 <- Bin1.21 %>% rename(Bin1.21 = `n()`)
Bin1.22 <- Bin1.22 %>% rename(Bin1.22 = `n()`)
Bin1.23 <- Bin1.23 %>% rename(Bin1.23 = `n()`)
Bin1.31_1 <- Bin1.31_1 %>% rename(Bin1.31_1 = `n()`)
Bin1.32 <- Bin1.32 %>% rename(Bin1.32 = `n()`)
Bin1.33 <- Bin1.33 %>% rename(Bin1.33 = `n()`)
Bin1.35 <- Bin1.35 %>% rename(Bin1.35 = `n()`)
Bin1.36 <- Bin1.36 %>% rename(Bin1.36 = `n()`)
Bin1.37 <- Bin1.37 %>% rename(Bin1.37 = `n()`)
Bin2.2 <- Bin2.2 %>% rename(Bin2.2 = `n()`)
Bin2.3 <- Bin2.3 %>% rename(Bin2.3 = `n()`)
Bin2.7 <- Bin2.7 %>% rename(Bin2.7 = `n()`)
Bin2.15 <- Bin2.15 %>% rename(Bin2.15 = `n()`)
Bin2.16 <- Bin2.16 %>% rename(Bin2.16 = `n()`)
Bin2.17 <- Bin2.17 %>% rename(Bin2.17 = `n()`)
Bin2.21 <- Bin2.21 %>% rename(Bin2.21 = `n()`)
Bin2.23_2 <- Bin2.23_2 %>% rename(Bin2.23_2 = `n()`)
Bin2.23_3 <- Bin2.23_3 %>% rename(Bin2.23_3 = `n()`)
Bin2.24 <- Bin2.24 %>% rename(Bin2.24 = `n()`)
Bin2.31 <- Bin2.31 %>% rename(Bin2.31 = `n()`)
Bin2.36 <- Bin2.36 %>% rename(Bin2.36 = `n()`)
Bin3.6 <- Bin3.6 %>% rename(Bin3.6 = `n()`)
Bin3.8 <- Bin3.8 %>% rename(Bin3.8 = `n()`)
Bin3.9 <- Bin3.9 %>% rename(Bin3.9 = `n()`)
Bin3.15 <- Bin3.15 %>% rename(Bin3.15 = `n()`)
Bin3.16 <- Bin3.16 %>% rename(Bin3.16 = `n()`)
Bin3.19 <- Bin3.19 %>% rename(Bin3.19 = `n()`)
Bin3.21 <- Bin3.21 %>% rename(Bin3.21 = `n()`)
Bin3.22_1 <- Bin3.22_1 %>% rename(Bin3.22_1 = `n()`)
Bin3.25 <- Bin3.25 %>% rename(Bin3.25 = `n()`)
Bin3.28_1 <- Bin3.28_1 %>% rename(Bin3.28_1 = `n()`)
Bin3.29 <- Bin3.29 %>% rename(Bin3.29 = `n()`)
Bin3.37 <- Bin3.37 %>% rename(Bin3.37 = `n()`)
Bin3.38 <- Bin3.38 %>% rename(Bin3.38 = `n()`)
Bin4.3 <- Bin4.3 %>% rename(Bin4.3 = `n()`)
Bin4.6_1 <- Bin4.6_1 %>% rename(Bin4.6_1 = `n()`)
Bin4.9_1_1 <- Bin4.9_1_1 %>% rename(Bin4.9_1_1 = `n()`)
Bin4.12_3 <- Bin4.12_3 %>% rename(Bin4.12_3 = `n()`)
Bin4.17_1 <- Bin4.17_1 %>% rename(Bin4.17_1 = `n()`)
Bin4.18_1 <- Bin4.18_1 %>% rename(Bin4.18_1 = `n()`)
Bin4.20 <- Bin4.20 %>% rename(Bin4.20 = `n()`)
Bin4.30_1_1 <- Bin4.30_1_1 %>% rename(Bin4.30_1_1 = `n()`)
Bin4.31 <- Bin4.31 %>% rename(Bin4.31 = `n()`)
Bin5.1 <- Bin5.1 %>% rename(Bin5.1 = `n()`)
Bin5.5 <- Bin5.5 %>% rename(Bin5.5 = `n()`)
Bin5.13 <- Bin5.13 %>% rename(Bin5.13 = `n()`)
Bin5.19 <- Bin5.19 %>% rename(Bin5.19 = `n()`)
Bin5.20 <- Bin5.20 %>% rename(Bin5.20 = `n()`)
Bin5.27 <- Bin5.27 %>% rename(Bin5.27 = `n()`)
Bin5.30 <- Bin5.30 %>% rename(Bin5.30 = `n()`)
Bin5.34 <- Bin5.34 %>% rename(Bin5.34 = `n()`)
Bin6.1_1 <- Bin6.1_1 %>% rename(Bin6.1_1 = `n()`)
Bin6.2 <- Bin6.2 %>% rename(Bin6.2 = `n()`)
Bin6.3 <- Bin6.3 %>% rename(Bin6.3 = `n()`)
Bin6.6 <- Bin6.6 %>% rename(Bin6.6 = `n()`)
Bin6.9 <- Bin6.9 %>% rename(Bin6.9 = `n()`)
Bin6.17 <- Bin6.17 %>% rename(Bin6.17 = `n()`)
Bin6.18 <- Bin6.18 %>% rename(Bin6.18 = `n()`)
Bin6.19 <- Bin6.19 %>% rename(Bin6.19 = `n()`)
Bin7.11 <- Bin7.11 %>% rename(Bin7.11 = `n()`)
Bin7.12 <- Bin7.12 %>% rename(Bin7.12 = `n()`)
Bin7.13 <- Bin7.13 %>% rename(Bin7.13 = `n()`)
Bin7.14 <- Bin7.14 %>% rename(Bin7.14 = `n()`)
Bin7.19_2 <- Bin7.19_2 %>% rename(Bin7.19_2 = `n()`)
Bin7.20 <- Bin7.20 %>% rename(Bin7.20 = `n()`)
Bin7.21 <- Bin7.21 %>% rename(Bin7.21 = `n()`)
Bin8.4 <- Bin8.4 %>% rename(Bin8.4 = `n()`)
Bin8.6 <- Bin8.6 %>% rename(Bin8.6 = `n()`)
Bin8.9_1_1 <- Bin8.9_1_1 %>% rename(Bin8.9_1_1 = `n()`)
Bin8.14 <- Bin8.14 %>% rename(Bin8.14 = `n()`)
Bin8.16 <- Bin8.16 %>% rename(Bin8.16 = `n()`)
Bin8.17_1_1 <- Bin8.17_1_1 %>% rename(Bin8.17_1_1 = `n()`)
Bin8.18 <- Bin8.18 %>% rename(Bin8.18 = `n()`)
Bin8.36 <- Bin8.36 %>% rename(Bin8.36 = `n()`)
Bin8.40 <- Bin8.40 %>% rename(Bin8.40 = `n()`)
Bin8.41_1_1 <- Bin8.41_1_1 %>% rename(Bin8.41_1_1 = `n()`)
Bin8.42 <- Bin8.42 %>% rename(Bin8.42 = `n()`)
Bin8.45 <- Bin8.45 %>% rename(Bin8.45 = `n()`)


## Merge all tables
tbl.list<-list(Bin1.3, Bin1.6_1, Bin1.13, Bin1.14_1, Bin1.17, Bin1.18, Bin1.21, Bin1.22, Bin1.23, Bin1.31_1, 
     Bin1.32, Bin1.33, Bin1.35, Bin1.36, Bin1.37, Bin2.2, Bin2.3, Bin2.7, Bin2.15, Bin2.16, Bin2.17, 
     Bin2.21, Bin2.23_2, Bin2.23_3, Bin2.24, Bin2.31, Bin2.36, Bin3.6, Bin3.8, Bin3.9, Bin3.15, Bin3.16, 
     Bin3.19, Bin3.21, Bin3.22_1, Bin3.25, Bin3.28_1, Bin3.29, Bin3.37, Bin3.38, Bin4.3, Bin4.6_1, Bin4.9_1_1, 
     Bin4.12_3, Bin4.17_1, Bin4.18_1, Bin4.20, Bin4.30_1_1, Bin4.31, Bin5.1, Bin5.5, Bin5.13, Bin5.19, 
     Bin5.20, Bin5.27, Bin5.30, Bin5.34, Bin6.1_1, Bin6.2, Bin6.3, Bin6.6, Bin6.9, Bin6.17, Bin6.18, Bin6.19, 
     Bin7.11, Bin7.12, Bin7.13, Bin7.14, Bin7.19_2, Bin7.20, Bin7.21, Bin8.4, Bin8.6, Bin8.9_1_1, Bin8.14, 
     Bin8.16, Bin8.17_1_1, Bin8.18, Bin8.36, Bin8.40, Bin8.41_1_1, Bin8.42, Bin8.45)

merged.data.frame = Reduce(function(...) merge(..., all=T), tbl.list) 

merged.data.frame[is.na(merged.data.frame)] <- 0

write.csv(merged.data.frame, "KOfam.Bin.counts.csv")

####
setwd("~/Desktop/BIOCHAR/3_DNA-SIP_Metagenomics/KO-txt-file/MetaG_files")
plot1<-read.csv("JY2S18_metag_KO.txt.csv", header = T, quote = "", stringsAsFactors = FALSE, row.names = NULL)
plot2<-read.csv("JY11S19_metag_KO.txt.csv", header = T, quote = "", stringsAsFactors = FALSE, row.names = NULL)
plot3<-read.csv("JY20S20_metag_KO.txt.csv", header = T, quote = "", stringsAsFactors = FALSE, row.names = NULL)
plot4<-read.csv("JY38S21_metag_KO.txt.csv", header = T, quote = "", stringsAsFactors = FALSE, row.names = NULL)
plot5<-read.csv("JY47S22_metag_KO.txt.csv", header = T, quote = "", stringsAsFactors = FALSE, row.names = NULL)
plot6<-read.csv("JY56S23_metag_KO.txt.csv", header = T, quote = "", stringsAsFactors = FALSE, row.names = NULL)
plot7<-read.csv("JY65S24_metag_KO.txt.csv", header = T, quote = "", stringsAsFactors = FALSE, row.names = NULL)
plot8<-read.csv("JY74S25_metag_KO.txt.csv", header = T, quote = "", stringsAsFactors = FALSE, row.names = NULL)

Plot1 <- plot1 %>% group_by(KEGG.family,KEGG.category, gene,KO) %>%   summarize(n())
Plot2 <- plot2 %>% group_by(KEGG.family,KEGG.category, gene,KO) %>%   summarize(n())
Plot3 <- plot3 %>% group_by(KEGG.family,KEGG.category, gene,KO) %>%   summarize(n())
Plot4 <- plot4 %>% group_by(KEGG.family,KEGG.category, gene,KO) %>%   summarize(n())
Plot5 <- plot5 %>% group_by(KEGG.family,KEGG.category, gene,KO) %>%   summarize(n())
Plot6 <- plot6 %>% group_by(KEGG.family,KEGG.category, gene,KO) %>%   summarize(n())
Plot7 <- plot7 %>% group_by(KEGG.family,KEGG.category, gene,KO) %>%   summarize(n())
Plot8 <- plot8 %>% group_by(KEGG.family,KEGG.category, gene,KO) %>%   summarize(n())

Plot1 <- Plot1 %>% rename(Plot1 = `n()`)
Plot2 <- Plot2 %>% rename(Plot2 = `n()`)
Plot3 <- Plot3 %>% rename(Plot3 = `n()`)
Plot4 <- Plot4 %>% rename(Plot4 = `n()`)
Plot5 <- Plot5 %>% rename(Plot5 = `n()`)
Plot6 <- Plot6 %>% rename(Plot6 = `n()`)
Plot7 <- Plot7 %>% rename(Plot7 = `n()`)
Plot8 <- Plot8 %>% rename(Plot8 = `n()`)

metag.tbl.list<-list(Plot1,Plot3,Plot4,Plot8,Plot2,Plot5,Plot6,Plot7)

metag.merged.data.frame = Reduce(function(...) merge(..., all=T), metag.tbl.list) 

metag.merged.data.frame[is.na(metag.merged.data.frame)] <- 0

write.csv(metag.merged.data.frame, "metag.KOfam.counts.csv")
