## useful_functions.R

#Put any functions that might be used across multiple scripts here so that they can be properly sourced in.

install.packages("tidyverse")
install.packages("readxl")
install.packages("ca")
install.packages("forecast")
install.packages("MLmetrics")

#excel read, graphs
library(ggplot2)
library(readxl)

#below used for forecasting counterfactual
library(forecast)
library(MLmetrics)