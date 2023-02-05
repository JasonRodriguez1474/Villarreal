###this is my first script. i am learning how to import data
###created by: David Villarreal
###2023-02-02
############################################

##load libraries##################
library(tidyverse)

###read in data###
weightdata <- read_csv(here("week_2","data","weightdata.csv"))

tail(weightdata)#shows last 6 rows
view(weightdata) #opens new window

