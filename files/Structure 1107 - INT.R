library(dplyr)
TEST_1107 <- filter(xl_NewIntC,`Structure-ID` == 1107)

TEST_1107 <- TEST_1107 %>%
  select(-c(`Structure-ID`))

dim(TEST_1107)

head(TEST_1107)

library(corrplot)
library(doMC)
correlation_1107 <- cor(TEST_1107)

is_na <- is.na(correlation_1107)

column_names <- rownames(correlation_1107)

indices_Prune <- which(is_na)
na_columns <- column_names[indices_Prune]

head(na_columns, 78)

nu_TEST_1107 <- TEST_1107 %>%
  select(-c(`Setd5-37`, `Adcy9-83`, `Camk2g-189`, `Col6a1-290`, `Dbh-326`, `Dlx3-350`, `Erdr1-378`, `Enc1-390`, `Grm1-537`, `Hars-554`, `L1cam-620`, `Lix1-643`, `Neurod6-698`, `Ogt-758`, `Pcsk1n-777`, `Pkia-805`, `Prkcz-841`, `Sst-1001`, `Ywhag-1124`, `Nr1d2-1245`, `Atm-1329`, `Esrra-1351`, `Pex14-1397`, `Shh-1418`, `Cpt1a-1478`, `Foxd3-1496`, `Suv39h2-1538`, `Wdr18-1551`, `Homer1-1748`, `Tsen34-1944`, `Pttg1ip-1956`, `Snhg7-1968`, `6330407J23Rik-1988`, `Rfx7-1998`, `Ankrd33-2006`, `Adrm1-2019`, `Ankrd10-2027`, `Apbb1-2033`, `Agap3-2089`, `Cpt1c-2117`, `Crat-2119`, `Donson-2157`, `Erf-2195`, `Fbln1-2205`, `Gabarap-2245`, `Irx1-2325`, `158303`, `Kpna4-2359`, `Lhx4-2377`, `Mapk13-2397`, `Ndufs1-2421`, `Nfkbie-2425`, `Park2-2462`, `Ptn-2507`, `Traf7-2527`, `Aurka-2643`, `Traf2-2691`, `Mapk3-32576`, `Pim2-32583`, `Ube2i-45666`, `Dbndd2-45668`, `Arxes1-45841`, `Limk2-61002`, `Bcap29-104826`, `Vldlr-121089`, `Tnfrsf25-121096`, `Gabpb1-121098`, `F2rl1-199391`, `Mef2a-199392`, `Tpm3-275873`, `Atp6v0b-293682`, `Slco3a1-293691`, `Aqp3-293692`, `Zfand3-293694`, `Actr1a-321206`, `Pdcl-324213`, `Ptbp1-356857`, `Cd6-112205643`))

nu_correlation_1107 <- cor(nu_TEST_1107)

library(caret)

highlyCorrelated90 <- findCorrelation(nu_correlation_1107, cutoff = .90, names = TRUE)

head(highlyCorrelated90)

tail(highlyCorrelated90)

correlated_pairs90 <- which(abs(nu_correlation_1107) > 0.9, arr.ind = TRUE)

totalAT90 <- length(correlated_pairs90) - 4271
totalAT90

head(correlated_pairs90)

tail(correlated_pairs90)

highlyCorrelated80 <- findCorrelation(nu_correlation_1107, cutoff = .80, names = TRUE)

head(highlyCorrelated80)

tail(highlyCorrelated80)

correlated_pairs80 <- which(abs(nu_correlation_1107) > 0.8, arr.ind = TRUE)

totalAT80 <- length(correlated_pairs80) - 4271
totalAT80

head(correlated_pairs80)

tail(correlated_pairs80)

highlyCorrelated70 <- findCorrelation(nu_correlation_1107, cutoff = 0.70, names = TRUE)

head(highlyCorrelated70)

tail(highlyCorrelated70)

correlated_pairs70 <- which(abs(nu_correlation_1107) > 0.7, arr.ind = TRUE)

totalAT70 <- length(correlated_pairs70) - 4271
totalAT70

head(correlated_pairs70)

tail(correlated_pairs70)
