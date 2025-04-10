dat <- read.csv('data/database_LB.csv')

dat$gender2 <- 0
dat$gender2[which(dat$gender == 'Male')] <- 1
dat$race3 <- 0
dat$race3[which(dat$race == 'AA')] <- 1
dat$smoke2 <- 0
dat$smoke2[which(dat$smoke == 'Y')] <- 1

###
fit1 <- lm(dat$P62adj ~ dat$group+dat$gender2+dat$race3+dat$smoke2)
print(paste('P62 HC vs patient:', summary(fit1)$coefficients[2,4]))

hc <- subset(dat, group=='control')
fit1 <- lm(hc$age ~ hc$P62adj+hc$gender2+hc$race3+hc$smoke2)
print(paste('age and P62 in HC:', summary(fit1)$coefficients[2,4]))

hc <- subset(dat, group!='control')
fit1 <- lm(hc$age ~ hc$P62adj+hc$gender2+hc$race3+hc$smoke2)
print(paste('age and P62 in patient:', summary(fit1)$coefficients[2,4]))
