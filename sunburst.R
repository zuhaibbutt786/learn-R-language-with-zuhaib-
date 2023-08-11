# libraries
library(tidyverse)
library(treemap)
library(sunburstR)

# Load dataset from github
data <- read.table("https://raw.githubusercontent.com/zuhaibbutt786/Example_dataset/11_SevCatOneNumNestedOneObsPerGroup.csv", header=T, sep=";")
data[ which(data$value==-1),"value"] <- 1
colnames(data) <- c("Continent", "Region", "Country", "Pop")

# Reformat data for the sunburstR package
data <- data %>%
  filter(Continent != "") %>%
  mutate(path = paste(Continent, Region, Country, sep="-")) %>%
  dplyr::select(path, Pop)

# Plot
p <- sunburst(data, legend=FALSE)
