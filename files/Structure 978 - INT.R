library(dplyr)
TEST_978 <- filter(xl_NewIntC,`Structure-ID` == 978)

TEST_978 <- TEST_978 %>%
  select(-c(`Structure-ID`))

dim(TEST_978)

head(TEST_978)

library(corrplot)
library(doMC)
correlation_978 <- cor(TEST_978)

is_na <- is.na(correlation_978)

column_names <- rownames(correlation_978)

indices_Prune <- which(is_na)
na_columns <- column_names[indices_Prune]

head(na_columns, 28)

nu_TEST_978 <- TEST_978 %>%
  select(-c(`Adcy9-83`, `Col6a1-290`, `Dbh-326`, `Erdr1-378`, `Enc1-390`, `Extl3-411`, `Hars-554`, `L1cam-620`, `Lig1-637`, `Pcsk1n-777`, `Prkcz-841`, `Sst-1001`, `Ywhag-1124`, `Pex14-1397`, `Tmem2-1409`, `Plxnb1-1561`, `Snhg7-1968`, `Ankrd33-2006`, `Adrm1-2019`, `Crat-2119`, `Fbln1-2205`, `Ndufs1-2421`, `Nfkbie-2425`, `Traf7-2527`, `Mapk3-32576`, `Pim2-32583`, `Limk2-61002`, `Bcap29-104826`))

nu_correlation_978 <- cor(nu_TEST_978)

library(caret)

highlyCorrelated90 <- findCorrelation(nu_correlation_978, cutoff = .90, names = TRUE)

head(highlyCorrelated90)

tail(highlyCorrelated90)

correlated_pairs90 <- which(abs(nu_correlation_978) > 0.9, arr.ind = TRUE)

totalAT90 <- length(correlated_pairs90) - 4321
totalAT90

head(correlated_pairs90)

tail(correlated_pairs90)

highlyCorrelated80 <- findCorrelation(nu_correlation_978, cutoff = .80, names = TRUE)

head(highlyCorrelated80)

tail(highlyCorrelated80)

correlated_pairs80 <- which(abs(nu_correlation_978) > 0.8, arr.ind = TRUE)

totalAT80 <- length(correlated_pairs80) - 4321
totalAT80

head(correlated_pairs80)

tail(correlated_pairs80)

highlyCorrelated70 <- findCorrelation(nu_correlation_978, cutoff = 0.70, names = TRUE)

head(highlyCorrelated70)

tail(highlyCorrelated70)

correlated_pairs70 <- which(abs(nu_correlation_978) > 0.7, arr.ind = TRUE)

totalAT70 <- length(correlated_pairs70) - 4321
totalAT70

head(correlated_pairs70)

tail(correlated_pairs70)
