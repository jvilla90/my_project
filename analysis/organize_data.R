#' ---
#' title: "organize_data.R"
#' author: ""
#' ---

# This script will read in raw data from the input directory, clean it up to produce 
# the analytical dataset, and then write the analytical data to the output directory. 

#source in any useful functions
source("useful_functions.R")

library(haven)

load("analysis/input/34363-0001-Data.rda")

sjs <- read_sav("SJSData.sav")

write_sav(sjs, "SJSData.sav")


