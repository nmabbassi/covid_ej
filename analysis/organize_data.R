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
library(tidyverse)
library(dplyr)
library(ggrepel)

#load covid data
covid_data <- read_excel("input/Health_Atlas_Data.xlsx",
                      na="NA") 

#clean covid data
new_covid <- covid_data %>%
             select(`geoid`, `covid_cases`, `covid_deaths`, 
                     `covid_cases_percap`, `covid_deaths_percap`)
  
  covid_data %>%
         rename(`census` = `geoid`,
                )

