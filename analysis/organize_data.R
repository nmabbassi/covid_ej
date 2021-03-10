#' ---
#' title: "organize_data.R"
#' author: "nmabbassi"
#' ---

# This script will read in raw data from the input directory, clean it up to produce 
# the analytical dataset, and then write the analytical data to the output directory. 

#source in any useful functions
source("check_packages.R")
source("useful_functions.R")

#useful functions (fix later)
library(ggplot2)
library(readxl)

#load data
covid_data <- read_excel("~/Desktop/covid_ej/Health_Atlas_Data.xlsx",
                      na="NA") 

#clean covid data
