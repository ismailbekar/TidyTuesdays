setwd("~/GitHub/R4DS/TidyTuesdays/Week28")

library(tidyverse)
library(ggridges)

vote <- read.csv("voter_turnout.csv")
vote <- tbl_df(vote)

vote <- vote %>%
     mutate(percentage = (votes/eligible_voters)*100) %>%
     mutate(percentage = round(percentage, 2)) %>% 
     mutate(type= case_when(year %in% c(1980, 1984, 1988, 1992, 1996, 2000, 2004, 2008, 2012) ~ "presidental",
                            year %in% c(1982, 1986, 1990, 1994, 1998, 2002, 2006, 2010, 2014) ~ "midterm" )) %>% 
     select(id, year, type, state, eligible_voters, votes, percentage)

summary(vote$state)
vote2 <- na.omit(vote)

vote2 <- vote2 %>% 
     group_by(state) %>% 
     filter(n() > 9)

summary(vote2$state)

vote_means <- vote2 %>% 
     group_by(state) %>% 
     summarise(avg= round(mean(percentage), 2)) %>% 
     arrange(avg)

vote2 <- left_join(vote2, vote_means, by="state") %>% 
     arrange(avg)

ggplot(vote2, aes(x = percentage, y = reorder(state, avg),  fill = type)) +
     geom_density_ridges(scale = 2, size = 0.15, rel_min_height = 0.001, alpha = .8, 
                         jittered_points = TRUE, point_shape = "|", point_size = 2) +
     scale_x_continuous(limits = c(25, 85)) +
     labs(x = "Vote turnout (%)",
          y = "State",
          fill= "Election Type",
          title = "US Voter Turnout (1980-2014)",
          subtitle = "Midterm vs. Presidental",
          caption = "States that have data lower than half of the elections are removed
                          Data Source: data.world | Plot by @fire_ecologist" ) +
     theme_light()