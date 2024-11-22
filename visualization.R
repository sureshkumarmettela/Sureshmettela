library(tidyverse)
library(ggplot2)
library(readr)

pdf("visualization1.pdf")
xyz <- read.csv("chicago_air_pollution.csv")
x <- xyz$no2tmean2
y <- xyz$o3tmean2

ggplot(xyz, aes(x = no2tmean2 , y = o3tmean2) ) +geom_point() +scale_x_continuous(limits = c(0,70))+scale_y_continuous(limits = c(0,70))+ geom_smooth(method="lm" , formula = y ~ x )+labs(title = " Correlation of Nitrogen and Ozone reading in Chicago Air Pollution  ", x = "Nitrogen" , y = "Ozone Reading")

ggplot(xyz, aes(x = x)) +
  geom_histogram(aes(y =after_stat(density)),
                 breaks = seq(0, 70, by = 5), 
                 colour = "black", 
                 fill = "white") +
  stat_function(fun = dnorm, args = list(mean = mean(xyz$no2tmean2), sd = sd(xyz$no2tmean2)),colour = "red")+ggtitle( "Histogram of Nitrogen" )+labs( x = "Nitrogen" ,y = "Density")+theme(plot.title = element_text(hjust =0.5))


dev.off()