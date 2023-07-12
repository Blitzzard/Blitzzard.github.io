library(dplyr)
TEST_143 <- filter(xl_NewDenC,`Structure-ID` == 143)

TEST_143 <- TEST_143 %>%
  select(-c(`Structure-ID`))

dim(TEST_143)

head(TEST_143)

library(corrplot)
library(doMC)
correlation_143 <- cor(TEST_143)

is_na <- is.na(correlation_143)

column_names <- rownames(correlation_143)

indices_Prune <- which(is_na)
na_columns <- column_names[indices_Prune]

head(na_columns, 75)

nu_TEST_143 <- TEST_143 %>%
  select(-c(`Cnih3-39`, `Adcy9-83`, `Ap2b1-96`, `Pofut2-147`, `Rbbp6-170`, `Col6a1-290`, `Dbh-326`, `Erdr1-378`, `Enc1-390`, `Epha7-402`, `Extl3-411`, `Gata2-485`, `Hars-554`, `Hlf-565`, `Jam2-602`, `L1cam-620`, `Lhx1-633`, `Lig1-637`, `Marcksl1-670`, `Odz3-752`, `Odz4-754`, `Pcsk1n-777`, `Pkia-805`, `Plxnc1-820`, `Prkcz-841`, `Rbm4-888`, `Sema4a-942`, `Sst-1001`, `Vamp2-1092`, `Vipr2-1104`, `Ywhag-1124`, `Ctsl-1187`, `Cyr61-1191`, `Nr1d2-1245`, `Morc3-1311`, `4932438H23Rik-1321`, `Pex14-1397`, `Tmem2-1409`, `Etv3-1494`, `Pla2g12a-1518`, `Ube2g2-1547`, `Wdr18-1551`, `Plxnb1-1561`, `Casp9-1681`, `Trip4-1924`, `Snhg7-1968`, `6330407J23Rik-1988`, `Rfx7-1998`, `Ankrd33-2006`, `Adrm1-2019`, `Crat-2119`, `Csrp1-2129`, `Elk1-2185`, `Fbln1-2205`, `Hax1-2303`, `Irx1-2325`, `Ndufs1-2421`, `Nfkbie-2425`, `Park2-2462`, `Traf7-2527`, `Sla-2569`, `Aurka-2643`, `Mapk3-32576`, `Pim2-32583`, `Arxes1-45841`, `Limk2-61002`, `Bcap29-104826`, `Mlx-227539`, `Syn1-227540`, `Hhip-71358556`, `Itga7-73520991`, `Dbnl-74819497`, `Ggt7-75145998`, `Thbs4-77874596`, `Pcp2-79490073`))

nu_correlation_143 <- cor(nu_TEST_143)

library(caret)

highlyCorrelated90 <- findCorrelation(nu_correlation_143, cutoff = .90, names = TRUE)

head(highlyCorrelated90)

tail(highlyCorrelated90)

correlated_pairs90 <- which(abs(nu_correlation_143) > 0.9, arr.ind = TRUE)

totalAT90 <- length(correlated_pairs90) - 4269
totalAT90

head(correlated_pairs90)

tail(correlated_pairs90)

highlyCorrelated80 <- findCorrelation(nu_correlation_143, cutoff = .80, names = TRUE)

head(highlyCorrelated80)

tail(highlyCorrelated80)

correlated_pairs80 <- which(abs(nu_correlation_143) > 0.8, arr.ind = TRUE)

totalAT80 <- length(correlated_pairs80) - 4269
totalAT80

head(correlated_pairs80)

tail(correlated_pairs80)

highlyCorrelated70 <- findCorrelation(nu_correlation_143, cutoff = 0.70, names = TRUE)

head(highlyCorrelated70)

tail(highlyCorrelated70)

correlated_pairs70 <- which(abs(nu_correlation_143) > 0.7, arr.ind = TRUE)

totalAT70 <- length(correlated_pairs70) - 4269
totalAT70

head(correlated_pairs70)

tail(correlated_pairs70)
