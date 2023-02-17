### Today we are going to practice tidy with biogeochemistry data from Hawaii ####
### Created by: David Villarreal #############
### Updated on: 2023-02-16 ####################
#### Load Libraries ######
library(tidyverse)
library(here)
### Load data ######
ChemData<-read_csv(here("week_4","data", "chemicaldata_maunalua.csv"))
View(ChemData)
glimpse(ChemData)

##filter NA
ChemData_clean <- ChemData %>%
  filter(complete.cases(.))
view(ChemData_clean)

ChemData_clean <- ChemData%>%
  drop