## LOAD PACKAGES ####
library(lme4)
library(lmerTest)

## READ IN AND ORGANIZE DATA ####
source('scripts/NRness_01_cleaning.R')
data_stats = data_clean

# xtabs(~context+fac_2, data_stats)

## DESCRIPTIVE STATISTICS ####

# summary(cd1$rating, mean, sd)
# summary(cd2$rating, mean, sd)
# summary(cd3$rating, mean, sd)
# summary(cd4$rating, mean, sd)

## THESE ARE MY MODELS USED FOR PUBLICATION ####
# maximal random effect structure that converges (even with lmerTest loaded):
mymodel_01_1 = lmer(NormScore ~ fac_1 * fac_2 + 
                    (1+fac_1*fac_2|participant) + 
                    (1+fac_1*fac_2|context), 
                  data=data_stats)
summary(mymodel_01_1)
anova(mymodel_01_1)

# same as mymodel_01 but WITHOUT the interaction:
mymodel_01_2 = lmer(NormScore ~ fac_1 + fac_2 + 
                    (1+fac_1*fac_2|participant) + 
                    (1+fac_1*fac_2|context), 
                  data=data_stats)
summary(mymodel_01_2)
anova(mymodel_01_1, mymodel_01_2)


