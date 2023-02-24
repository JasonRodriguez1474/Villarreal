### Today we are going to practice joins with data from Becker and Silbiger (2020) ####
### Created by: David Villarreal #############
### Updated on: 2023-02-21 ####################
#### Load Libraries ######
library(tidyverse)
library(here)
install.packages("cowsay")
library(cowsay)
### Load data ######
# Environmental data from each site
EnviroData<-read_csv(here("week_5","data", "site.characteristics.data.csv"))
#Thermal performance data
TPCData<-read_csv(here("week_5","data","Topt_data.csv"))
  
###SCRIPT
EnviroData_wide <-  EnviroData %>%
  pivot_wider(names_from= parameter.measured,
              values_from= values) %>%
  arrange(site.letter)
view(EnviroData_wide)

FullData_left<- left_join(TPCData, EnviroData) %>% ## Joining with by = join_by(site.letter) 
  relocate(where(is.numeric), .after = where(is.character)) # relocate all the numeric data after the character data
head(FullData_left)
ThinkData <- FullData_left %>%
  pivot_longer(cols= E:substrate.cover,  ## the cols you want to pivot. This says select the temp to percent SGD cols
               names_to= "variables",   ## the names of the new cols with all the column names 
               values_to= "values") %>%
  group_by(site.letter, variables)%>%
  summarise(mean_vals= mean(values, na.rm=TRUE),
            var_vals= var(values, na.rm= TRUE))


FullData_left %>%
  group_by(site.letter) %>%
  summarise_at(vars(E:substrate.cover),.funs = list(mean = mean, var = var))

view(ThinkData)

# Make 1 tibble
T1 <- tibble(Site.ID = c("A", "B", "C", "D"), 
             Temperature = c(4.20, 6.9, 15.3, 12.8))
T1
# make another tibble
T2 <-tibble(Site.ID = c("A", "B", "D", "E"), 
            pH = c(7.3, 7.8, 8.1, 7.9))
T2
left_join(T1,T2)
right_join(T1,T2)
semi_join(T1, T2)
anti_join(T1, T2)

glimpse(EnviroData)
glimpse(TPCData)
# also use View()
view(EnviroData)
view(TPCData)
say("get down on the ground",by= "endlesshorse" )
