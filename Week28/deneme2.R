Catalan_elections %>%
          mutate(YearFct = fct_rev(as.factor(Year))) %>%
          ggplot(aes(y = YearFct)) +
          geom_density_ridges(
                    aes(x = Percent, fill = paste(YearFct, Option)), 
                    alpha = .8, color = "white", from = 0, to = 100
          ) +
          labs(
                    x = "Vote (%)",
                    y = "Election Year",
                    title = "Indy vs Unionist vote in Catalan elections",
                    subtitle = "Analysis unit: municipalities (n = 949)",
                    caption = "Marc Belzunces (@marcbeldata) | Source: Idescat"
          ) +
          scale_y_discrete(expand = c(0.01, 0)) +
          scale_x_continuous(expand = c(0.01, 0)) +
          scale_fill_cyclical(
                    breaks = c("1980 Indy", "1980 Unionist"),
                    labels = c(`1980 Indy` = "Indy", `1980 Unionist` = "Unionist"),
                    values = c("#ff0000", "#0000ff", "#ff8080", "#8080ff"),
                    name = "Option", guide = "legend"
          ) +
          theme_ridges(grid = FALSE)