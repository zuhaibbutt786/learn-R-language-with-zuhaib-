library(tidyverse)
library(hrbrthemes)
library(viridis)
# Load dataset from github
data <- read.table("1_OneNum.csv",header=TRUE)
# Make the histogram
data %>%
filter( price<300 ) %>%
ggplot( aes(x=price)) +
stat_bin(breaks=seq(0,300,10), fill="#69b3a2", color="#e9ecef", alpha=0.9) +
ggtitle("Night price distribution of Airbnb appartements") +
theme_ipsum()
