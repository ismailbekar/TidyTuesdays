setwd("~/GitHub/R4DS/TidyTuesdays/Week29")
library(tidyverse)
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