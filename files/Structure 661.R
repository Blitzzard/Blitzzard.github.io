library(dplyr)
TEST_661 <- filter(xl_NewDenC,`Structure-ID` == 661)

TEST_661 <- TEST_661 %>%
  select(-c(`Structure-ID`))

dim(TEST_661)

head(TEST_661)

library(corrplot)
library(doMC)
correlation_661 <- cor(TEST_661)

is_na <- is.na(correlation_661)

column_names <- rownames(correlation_661)

indices_Prune <- which(is_na)
na_columns <- column_names[indices_Prune]

head(na_columns, 19)

nu_TEST_661 <- TEST_661 %>%
  select(-c(`Col6a1-290`, `Extl3-411`, `Lig1-637`, `Nrtn-741`, `Prdx1-836`, `Prkcz-841`, `Sst-1001`, `Vamp2-1092`, `Ywhag-1124`, `Tmem2-1409`, `Plxnb1-1561`, `Adrm1-2019`, `Crat-2119`, `Fbln1-2205`, `Ndufs1-2421`, `Traf7-2527`, `Pim2-32583`, `Limk2-61002`, `Bcap29-104826`))

nu_correlation_661 <- cor(nu_TEST_661)

library(caret)

highlyCorrelated90 <- findCorrelation(nu_correlation_661, cutoff = .90, names = TRUE)

head(highlyCorrelated90)

tail(highlyCorrelated90)

correlated_pairs90 <- which(abs(nu_correlation_661) > 0.9, arr.ind = TRUE)

totalAT90 <- length(correlated_pairs90) - 4325
totalAT90

head(correlated_pairs90)

tail(correlated_pairs90)

highlyCorrelated80 <- findCorrelation(nu_correlation_661, cutoff = .80, names = TRUE)

head(highlyCorrelated80)

tail(highlyCorrelated80)

correlated_pairs80 <- which(abs(nu_correlation_661) > 0.8, arr.ind = TRUE)

totalAT80 <- length(correlated_pairs80) - 4325
totalAT80

head(correlated_pairs80)

tail(correlated_pairs80)

highlyCorrelated70 <- findCorrelation(nu_correlation_661, cutoff = 0.70, names = TRUE)

head(highlyCorrelated70)

tail(highlyCorrelated70)

correlated_pairs70 <- which(abs(nu_correlation_661) > 0.7, arr.ind = TRUE)

totalAT70 <- length(correlated_pairs70) - 4325
totalAT70

head(correlated_pairs70)

tail(correlated_pairs70)
