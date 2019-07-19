## LOAD PACKAGES ####
library(dplyr)
library(purrr)

## READ IN DATA ####
data_ip = read.table("data/stacked_data_for_R.csv", fileEncoding = "UTF-8",
                  skipNul = TRUE, header = TRUE, sep = "\t", stringsAsFactors = FALSE)

## CLEAN DATA ####
# Select relevant columns:
data_select = data_ip %>%
  select(participant, condition, fac_1, fac_2, rating, item, context)

# turn colums into factors and create column with dummy values
data_clean = data_select %>%
  mutate(NormScore = 500) %>% ## catch errors
  mutate(participant = factor(data_select$participant)) %>%
  mutate(condition = factor(data_select$condition)) %>%
  mutate(item = factor(data_select$item)) %>%
  mutate(context = factor(data_select$context))

# apply z-tranform on ratings
for(subj in levels(data_clean$participant)){
  subj.mean = mean(data_clean[data_clean$participant == subj,]$rating)
  subj.sd = sd(data_clean[data_clean$participant == subj,]$rating)
  data_clean[data_clean$participant == subj,]$NormScore = (data_clean[data_clean$participant == subj,]$rating - subj.mean)/subj.sd
}

# which(is.na(data_clean$NormScore))

cd1 = data_clean %>%
  filter(condition == "cd1_ass_+n") %>%
  select(participant, condition, fac_1, fac_2, rating, item, context, NormScore)

cd2 = data_clean %>%
  filter(condition == "cd2_ass_-n") %>%
  select(participant, condition, fac_1, fac_2, rating, item, context, NormScore)

cd3 = data_clean %>%
  filter(condition == "cd3_com_+n") %>%
  select(participant, condition, fac_1, fac_2, rating, item, context, NormScore)

cd4 = data_clean %>%
  filter(condition == "cd4_com_-n") %>%
  select(participant, condition, fac_1, fac_2, rating, item, context, NormScore)


# cd1_mean = mean(cd1[["rating"]])
# cd2_mean = mean(cd2[["rating"]])
# cd3_mean = mean(cd3[["rating"]])
# cd4_mean = mean(cd4[["rating"]])
# 
# cd1_sd = sd(cd1[["rating"]])
# cd2_sd = sd(cd2[["rating"]])
# cd3_sd = sd(cd3[["rating"]])
# cd4_sd = sd(cd4[["rating"]])

# head(data_clean)
# tail(data_clean)
# xtabs(~rating, data_clean)
# xtabs(~condition, data_clean)

