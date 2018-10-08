setwd("~/GitHub/R4DS/TidyTuesdays/Week28")

library(tidyverse)

vote <- read.csv("voter_turnout.csv")
vote <- tbl_df(vote)

summary(vote2$state)

vote2 <- na.omit(vote)

vote2 <- vote2 %>% 
          group_by(state) %>% 
          filter(n() > 8)

summary(vote2$state)


ggplot(vote2, aes(votes, eligible_voters, group= year)) +
          geom_curve() +
          facet_wrap(~ state)

