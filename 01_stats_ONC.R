dat <- read.csv('data/database_ONCs.csv')
dat <- subset(dat, P62adj < 4)

dat$gender2 <- 0
dat$gender2[which(dat$gender == 'Male')] <- 1
dat$race3 <- 0
dat$race3[which(dat$race2 == 'AA')] <- 1
dat$smoke2 <- 0
dat$smoke2[which(dat$smoking == 'Y')] <- 1

###
fit1 <- lm(dat$P62adj ~ dat$group+dat$gender2+dat$race3+dat$smoke2)
print(paste('P62 HC vs patient:', summary(fit1)$coefficients[2,4]))

hc <- subset(dat, group=='Control')
fit1 <- lm(hc$age ~ hc$P62adj+hc$gender2+hc$race3+hc$smoke2)
print(paste('age and P62 in HC:', summary(fit1)$coefficients[2,4]))

hc <- subset(dat, group!='Control')
fit1 <- lm(hc$age ~ hc$P62adj+hc$gender2+hc$race3+hc$smoke2)
print(paste('age and P62 in patient:', summary(fit1)$coefficients[2,4]))

print('passage number')
dat <- dat[which(!is.na(dat$passage)), ]
fit1 <- lm(dat$P62adj ~ dat$group+dat$gender2+dat$race3+dat$smoke2)
print(paste('no passage:', summary(fit1)$coefficients[2,4]))
fit1 <- lm(dat$P62adj ~ dat$group+dat$passage+dat$gender2+dat$race3+dat$smoke2)
print(paste('passage:', summary(fit1)$coefficients[2,4]))
