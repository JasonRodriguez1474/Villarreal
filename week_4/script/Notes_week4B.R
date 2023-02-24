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
  drop_na()%>%  ##filters out everything that is not a complete row
  separate (col= Tide_time,  ##choose the tide time col
            into= c("Tide", "Time"),  ##separate it into two columns Tide and time
            sep= "_",   ##separate by _
            remove= FALSE) %>%  ##Keep the original tide_time column
  unite(col= "Site_Zone",
       c(Site,Zone),
       sep =".",
       remove = FALSE)
head(ChemData_clean)

ChemData_long <- ChemData_clean %>%
  pivot_longer(cols= Season:Temp_in,  ## the cols you want to pivot. This says select the temp to percent SGD cols
               names_to= "variables",   ## the names of the new cols with all the column names 
               values_to= "values") %>% ##names of the new column with all the values
  group_by(variables, Site, Time) %>% 
  summarise(mean_vals = mean(values, na.rm = TRUE)) %>%
  pivot_wider(names_from = variables, 
              values_from = mean_vals) %>% # notice it is now mean_vals as the col name
  write_csv(here("week_4","output","summary.csv"))  # export as a csv to the right folder
view(ChemData_long)

ChemData_long %>%
  group_by(variables, Site) %>% # group by everything we want
  summarise(Param_means = mean(values, na.rm = TRUE), # get mean
            Param_vars = var(values, na.rm = TRUE)) # get variance

ChemData_long %>%
  ggplot(aes(x = Site, y = values))+ 
  geom_boxplot()+ 
  facet_wrap(~variables, scales = "free")

###pivot wider
ChemData_wide <- ChemData_long%>%
  pivot_wider(names_from= variables,
              values_from= values)
view(ChemData_wide)

write_csv(here("week_4","output","summary.csv"))  # export as a csv to the right folder
