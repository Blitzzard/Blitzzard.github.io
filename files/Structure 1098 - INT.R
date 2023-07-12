library(dplyr)
TEST_1098 <- filter(xl_NewIntC,`Structure-ID` == 1098)

TEST_1098 <- TEST_1098 %>%
  select(-c(`Structure-ID`))

dim(TEST_1098)

head(TEST_1098)

library(corrplot)
library(doMC)
correlation_1098 <- cor(TEST_1098)

is_na <- is.na(correlation_1098)

column_names <- rownames(correlation_1098)

indices_Prune <- which(is_na)
na_columns <- column_names[indices_Prune]

head(na_columns, 137)

nu_TEST_1098 <- TEST_1098 %>%
  select(-c(`Setd5-37`, `Cnih3-39`, `Adcy9-83`, `Arx-118`, `Avp-131`, `Camk2g-189`, `Cd1d1-219`, `Chrm4-261`, `Col6a1-290`, `Crh-292`, `Cxcl12-308`, `Dbh-326`, `Dlx3-350`, `Erdr1-378`, `Enc1-390`, `Entpd1-393`, `Fabp3-418`, `Grm1-537`, `Hars-554`, `Icmt-585`, `Kcnj6-609`, `L1cam-620`, `Lix1-643`, `Lpl-649`, `Neurod6-698`, `Nr3c1-727`, `Nrgn-736`, `Ntrk2-746`, `Ogt-758`, `Pcsk1n-777`, `Pkia-805`, `Prkcz-841`, `Slc6a3-978`, `Snca-986`, `Sst-1001`, `Syt7-1035`, `Th-1056`, `Uchl1-1088`, `Ywhag-1124`, `Ywhah-1127`, `Ywhaq-1130`, `Ywhaz-1133`, `Ikzf1-1144`, `Atp5o-1158`, `Cbfb-1168`, `Nr1d2-1245`, `ORF63-1247`, `Atm-1329`, `Cbs-1335`, `Elf2-1349`, `Esrra-1351`, `Lhx5-1369`, `Mx1-1385`, `Pex14-1397`, `Shh-1418`, `Gtf2h4-1458`, `Cpt1a-1478`, `Foxd3-1496`, `Lmx1b-1508`, `Mtf2-1510`, `Ndel1-1514`, `Suv39h2-1538`, `Wdr18-1551`, `Rwdd2b-1587`, `Homer1-1748`, `Tsen34-1944`, `Pttg1ip-1956`, `Snhg7-1968`, `6330407J23Rik-1988`, `Pde4dip-1994`, `Rfx7-1998`, `Ankrd33-2006`, `Adrm1-2019`, `Ankrd10-2027`, `Apbb1-2033`, `Agap3-2089`, `Cpt1c-2117`, `Crat-2119`, `Donson-2157`, `Erf-2195`, `Fbln1-2205`, `Gabarap-2245`, `Gnai2-2263`, `Gtf2i-2277`, `Irx1-2325`, `158303`, `Kpna4-2359`, `Leprotl1-2373`, `Lhx4-2377`, `Mapk13-2397`, `Mapre1-2401`, `Ndufs1-2421`, `Nfkbie-2425`, `Park2-2462`, `Pcsk1-2470`, `Pnrc1-2501`, `Ptn-2507`, `Traf7-2527`, `Leprel4-2547`, `Aurka-2643`, `Traf2-2691`, `Usp21-2711`, `Ltn1-2747`, `Mapk3-32576`, `Pim2-32583`, `Ube2i-45666`, `Dbndd2-45668`, `Arxes1-45841`, `Limk2-61002`, `Bcap29-104826`, `Vldlr-121089`, `Ptprcap-121091`, `Tnfrsf25-121096`, `Ssr2-121097`, `Gabpb1-121098`, `Pgf-121099`, `F2rl1-199391`, `Mef2a-199392`, `Tnfrsf11a-199393`, `Tpm3-275873`, `Atp6v0b-293682`, `Slco3a1-293691`, `Aqp3-293692`, `Zfand3-293694`, `Actr1a-321206`, `Pdcl-324213`, `Fbxw2-355882`, `Usp11-355883`, `Vps35-355884`, `Pls3-355886`, `Ncaph2-355887`, `Cct2-356082`, `Ptbp1-356857`, `Hectd1-357092`, `Trp53-67855414`, `Dbnl-74819497`, `Cd6-112205643`))

nu_correlation_1098 <- cor(nu_TEST_1098)

library(caret)

highlyCorrelated90 <- findCorrelation(nu_correlation_1098, cutoff = .90, names = TRUE)

head(highlyCorrelated90)

tail(highlyCorrelated90)

correlated_pairs90 <- which(abs(nu_correlation_1098) > 0.9, arr.ind = TRUE)

totalAT90 <- length(correlated_pairs90) - 4207
totalAT90

head(correlated_pairs90)

tail(correlated_pairs90)

highlyCorrelated80 <- findCorrelation(nu_correlation_1098, cutoff = .80, names = TRUE)

head(highlyCorrelated80)

tail(highlyCorrelated80)

correlated_pairs80 <- which(abs(nu_correlation_1098) > 0.8, arr.ind = TRUE)

totalAT80 <- length(correlated_pairs80) - 4207
totalAT80

head(correlated_pairs80)

tail(correlated_pairs80)

highlyCorrelated70 <- findCorrelation(nu_correlation_1098, cutoff = 0.70, names = TRUE)

head(highlyCorrelated70)

tail(highlyCorrelated70)

correlated_pairs70 <- which(abs(nu_correlation_1098) > 0.7, arr.ind = TRUE)

totalAT70 <- length(correlated_pairs70) - 4207
totalAT70

head(correlated_pairs70)

tail(correlated_pairs70)
