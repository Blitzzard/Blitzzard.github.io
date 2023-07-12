library(dplyr)
TEST_852 <- filter(xl_NewDenC,`Structure-ID` == 852)

TEST_852 <- TEST_852 %>%
  select(-c(`Structure-ID`))

dim(TEST_852)

head(TEST_852)

library(corrplot)
library(doMC)
correlation_852 <- cor(TEST_852)

is_na <- is.na(correlation_852)

column_names <- rownames(correlation_852)

indices_Prune <- which(is_na)
na_columns <- column_names[indices_Prune]

head(na_columns, 22)

nu_TEST_852 <- TEST_852 %>%
  select(-c(`Adcy9-83`, `Col6a1-290`, `Erdr1-378`, `Enc1-390`, `L1cam-620`, `Pcsk1n-777`, `Prkcz-841`, `Sst-1001`, `Vamp2-1092`, `Ywhag-1124`, `Pex14-1397`, `Trip4-1924`, `Ankrd33-2006`, `Adrm1-2019`, `Crat-2119`, `Fbln1-2205`, `Ndufs1-2421`, `Traf7-2527`, `Mapk3-32576`, `Pim2-32583`, `Limk2-61002`, `Bcap29-104826`))

nu_correlation_852 <- cor(nu_TEST_852)

library(caret)

highlyCorrelated90 <- findCorrelation(nu_correlation_852, cutoff = .90, names = TRUE)

head(highlyCorrelated90)

tail(highlyCorrelated90)

correlated_pairs90 <- which(abs(nu_correlation_852) > 0.9, arr.ind = TRUE)

totalAT90 <- length(correlated_pairs90) - 4322
totalAT90

head(correlated_pairs90)

tail(correlated_pairs90)

highlyCorrelated80 <- findCorrelation(nu_correlation_852, cutoff = .80, names = TRUE)

head(highlyCorrelated80)

tail(highlyCorrelated80)

correlated_pairs80 <- which(abs(nu_correlation_852) > 0.8, arr.ind = TRUE)

totalAT80 <- length(correlated_pairs80) - 4322
totalAT80

head(correlated_pairs80)

tail(correlated_pairs80)

highlyCorrelated70 <- findCorrelation(nu_correlation_852, cutoff = 0.70, names = TRUE)

head(highlyCorrelated70)

tail(highlyCorrelated70)

correlated_pairs70 <- which(abs(nu_correlation_852) > 0.7, arr.ind = TRUE)

totalAT70 <- length(correlated_pairs70) - 4322
totalAT70

head(correlated_pairs70)

tail(correlated_pairs70)
