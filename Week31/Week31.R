setwd("~/GitHub/R4DS/TidyTuesdays/Week31")
library(tidyverse)

data <- read.csv("r-downloads.csv")
data1 <- read.csv("r_downloads_year.csv")

ggplot(data1, aes(os, fill= )) +
     geom_bar() +
     coord_flip()
