setwd("~/GitHub/R4DS/TidyTuesdays/Week28")

library(tidyverse)

vote <- read.csv("voter_turnout.csv")
vote <- tbl_df(vote)

vote <- vote %>% 
     mutate(percentage = votes/eligible_voters) %>% 
     mutate(percentage = round(percentage, 2))

table(vote$state)

vote2 <- na.omit(vote)

vote2 <- vote2 %>% 
          group_by(state) %>% 
          filter(n() > 8) 

table(vote2$state)


ggplot(vote2, aes(percentage, fill= year)) +
          geom_histogram() +
          facet_wrap(~ state)
vote3 <- reshape2::melt(vote2)

vote2 <- vote2 %>% filter(year== 2014)

ggplot(vote2, aes(x = percentage, y = year)) +
     geom_density_ridges() +
     scale_fill_viridis_c(option = "D") +
     theme_ridges() +
     theme(plot.caption = element_text(colour = "grey50")) +
     labs(x = "Births per day",
          y = "",
          title = "Births per Weekday",
          subtitle = "Measured in the US | 2000-2014",
          fill = "Births \n per day",
          caption = "Data: ssa.gov | Source: Fivethirtyeight | Plot by @othomn")