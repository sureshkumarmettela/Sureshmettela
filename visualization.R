library(tidyverse)
library(ggplot2)
library(readr)
library(rcompanion)
pdf("visualization.pdf")
xyz <- read.csv("chicago_air_pollution.csv")
x <- xyz$tmpd
y <- xyz$o3tmean2
plot(x,y , main = "Correlation of Temprature and Ozone Readings in Chicago Air Quality", xlab = "Temprature Readings", ylab =  "Ozone Readings", col = "grey", xlim = c(0,100))
abline(lm( y ~ x, data = xyz), col = "blue")
model = lm(y ~ x,data = xyz)
plotNormalHistogram(residuals(model),col = "pink",main = "Histogram of Temprature",xlab = "Temprature readings")
dev.off()
