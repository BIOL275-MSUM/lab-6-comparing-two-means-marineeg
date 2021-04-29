
# load packages -----------------------------------------------------------

library(tidyverse)


# read data ---------------------------------------------------------------

crabs <- read_csv("chap15q27FiddlerCrabFans.csv")
crabs





# QUESTION D --------------------------------------------------------------

# graph the distribution of body temperatures for each crab type

ggplot(crabs, aes(x=crabType, y = bodyTemperature)) +
  geom_point(size = 2, color = "red") +
  geom_smooth (method = lm)


# QUESTION E --------------------------------------------------------------

# ANOVA

aov_crabs <-
  aov(bodyTemperature ~ crabType, data = crabs)
aov_crabs

summary(aov_crabs)

