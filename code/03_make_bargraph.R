here::i_am("code/02_bargraph_data.R")

data <- readRDS(
  file = here::here("output/bargraph_data.rds")
)

library(ggplot2)

# Create a bar plot

bargraph <-
  ggplot(data, aes(x = Category, y = Prevalence, fill = Category)) +
  geom_bar(stat = "identity", width = 1) +
  geom_text(aes(label = round(Prevalence)), vjust = -0.5, size = 3, color = "black")+
  labs(title = "Prevalence of Cardiovascular Disease by Sex: California, 2000",
       x = "Sex",
       y = "Prevalence (Cases per 100,000)") +
  scale_fill_manual(values = c("Male" = "#377eB8", "Female" = "#E7DDFF", "Overall" = "#D8E4BC")) +
  theme_classic()+
  scale_x_discrete(expand = expand_scale(add = 0))+
  scale_y_continuous(breaks = seq(0, 600, by = 50), expand = c(0,0))+
  expand_limits(y = c(0, 500))+
  theme(plot.title = element_text(margin = margin(b = 20)))

ggsave(
  here::here("output/bargraph.png"),
  plot = bargraph,
  device = "png",
  width = 6,
  height = 8
)
