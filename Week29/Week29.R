setwd("~/GitHub/R4DS/TidyTuesdays/Week29")
library(tidyverse)

college <- as.tibble(read.csv("CollegeMajor.csv"))

ggplot(college, aes(ShareWomen, Median, group= Major_category)) +
     geom_point()

ggplot(college, aes(reorder(Major_category, Unemployment_rate, FUN= mean), 
                    Unemployment_rate, 
                    fill= Major_category)) +
     geom_boxplot() +
     labs( fill= "Category") +
     coord_flip()

ggplot(college, aes(reorder(Major_category, Unemployment_rate, FUN= median), 
                    Unemployment_rate, color= Major_category)) +
     geom_boxplot() +
     coord_flip() +
     theme_light()
