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
  
    new_covid <- new_covid %>%
                 rename(`census_tract` = `geoid`,
                        `cv_cases`= `covid_cases`,
                        `cv_deaths` = `covid_deaths`,
                        `cv_cases_pc` = `covid_cases_percap`, 
                        `cv_deaths_pc` = `covid_deaths_percap`)

                 
#load CalEnviroScreen data
ces_data <- read_excel("input/ces3results.xlsx", 
                       na="NA")

  #clean CES data
    new_ces <- ces_data %>%
               select(`Census Tract`, `Total Population`, `California County`, `CES 3.0 Score`, 
                      `Pollution Burden`, `Pollution Burden Score`, 
                      `Housing Burden`, `Pop. Char.`, `Pop. Char. Score`)
    new_ces <- new_ces %>% 
              rename(`census_tract` = `Census Tract`,
                      `county` = `California County`,
                      `total_pop` = `Total Population`, 
                      `ces_score` = `CES 3.0 Score`, 
                      `pol_burden` = `Pollution Burden`, 
                      `pol_burden_score` = `Pollution Burden Score`,
                      `housing_burden` = `Housing Burden`, 
                      `pop_char` = `Pop. Char.`, 
                      `pop_char_score` = `Pop. Char. Score`)
                
#merge data
merge_data <- merge(new_ces, new_covid, by="census_tract", all.x=TRUE, all.y=FALSE)
 
 #check urself before you wreck urself
   colnames(merge_data)

#save full merge data in output directory
save(merge_data, file="output/merge_data.RData")



