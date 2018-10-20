setwd("~/GitHub/R4DS/TidyTuesdays/Week29")
library(tidyverse)
<<<<<<< HEAD
library(ggplot2)

college <- as.tibble(read.csv("CollegeMajor.csv"))

college <- college %>% 
     filter(Major_category != "Interdisciplinary")
     
ggplot(college, aes(reorder(Major_category, Unemployment_rate, FUN= mean), 
                    Unemployment_rate, 
                    fill= Major_category)) +
     geom_boxplot() +
     labs(title = "Unemployment rate by major categories",
           subtitle= "Colors are not ordered",
           x = "Major Category",
           y = "Unemployment",
          fill= "Category") +
     coord_flip()

ggplot(college, aes(reorder(Major_category, Unemployment_rate, FUN= mean), 
                    Unemployment_rate, 
                    fill= reorder(Major_category, Unemployment_rate))) +
     geom_boxplot() +
     labs(title = "Unemployment rate by major categories",
          subtitle= "Colors are ordered",
          x = "Major Category",
          y = "Unemployment",
          fill= "Category") +
     coord_flip()

ggplot(college, aes(reorder(Major_category, Unemployment_rate, FUN= median), 
                    Unemployment_rate, color= Major_category)) +
     geom_boxplot() +
     coord_flip() +
     theme_light()

ggplot(college, aes(ShareWomen, Median, group= Major_category)) +
     geom_point()
=======
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

>>>>>>> 5ef339825857c178364d23ce8acc7f666f5b3696
