dat <- read.csv('data/database_mRNA_ONC.csv')
dat$race2 <- 0
dat$race2[dat$race == 'AA'] <- 1

fit <- lm(dat$P62 ~ dat$group + dat$sex + dat$race2 + dat$smoke)
print(paste('gene, HC vs FEP:', summary(fit)$coefficients[2,4]))
