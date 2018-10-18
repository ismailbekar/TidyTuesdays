setwd("~/GitHub/R4DS/TidyTuesdays/Week29")
library(tidyverse)
library(RColorBrewer)
college <- as.tibble(read.csv("CollegeMajor.csv"))

college <- college %>% 
          filter(Major_category != "Interdisciplinary")

colourCount = length(unique(college$Major_category))
getPalette = colorRampPalette(brewer.pal(9, "Set1"))
college <- droplevels(college)

ggplot(college, aes(reorder(Major_category, Unemployment_rate, FUN= mean), Unemployment_rate, 
                    fill=getPalette(colourCount))
       )+
     geom_boxplot() +
     labs( title = "Unemployment Rates by Major Categories",
           subtitle= "Colors are not ordered",
           x= "Major Category",
           y = "Unemployment rate",
           fill= "Major Category") +
     coord_flip()


aa + scale_fill_brewer(palette = getPalette)


#fill reorder
ggplot(college, aes(reorder(Major_category, Unemployment_rate, FUN= mean), 
                    Unemployment_rate, 
                    fill= reorder(Major_category, Unemployment_rate))) +
          geom_boxplot() +
          labs( title = "Unemployment Rates by Major Categories",
                subtitle = "Colors are ordered",
                x= "Major Category",
                y = "Unemployment rate",
                fill= "Major Category") +
          coord_flip()

