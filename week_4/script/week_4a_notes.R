library(palmerpenguins)
library(tidyverse)
library(here)
###load data
glimpse(penguins)

filter(.data = penguins,)
filter(.data = penguins,
       sex== "female",  ##== reads as "is exactly equal to"
       year== 2008|2009,
       body_mass_g> 5000,
       island!= "Dream",
       species== "Adelie" & "Gentoo")

view(data)
data1 <- penguins %>% ###data set 1 with mean of body mass by species, sex and island
  group_by(island, sex, species) %>%
  summarise(mean_body_mass_g = mean(body_mass_g, na.rm = TRUE))%>%
  drop_na(sex, island, species)
view(data1)

data2 <- penguins %>% #### data set 2 of variance by species, sex, and island
  group_by(island, sex, species) %>%
  summarise(var_body_mass_g = var(body_mass_g, na.rm = TRUE))%>%
  drop_na(sex, island, species)
view(data2)


###second part
female_data <- penguins %>% ##naming data
  filter(sex== "female" )  %>% ##filter out males and NA
  mutate(log_mass= log(body_mass_g)) %>% ##get log mass
  select(species, sex, island, log_mass) ##slect columns
  
#graph
ggplot(data=female_data,
       mapping= aes(x= species,   
                      y= log_mass,
                      fill = sex))+
    geom_boxplot()+
    labs(x= "females",
         y= "log mass", 
         title= "mass of penguins")+
  facet_wrap(~species)


  

