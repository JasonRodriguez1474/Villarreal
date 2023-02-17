### week 4 Homework ####
### Created by: David Villarreal #############
### Updated on: 2022-02-15 ####################
#### Load Libraries ######
library(palmerpenguins) # load data 
library(tidyverse) # load package 
library(here) # load package 
library(beyonce) # load palette 
library(ggthemes) #load package


glimpse(penguins) # data 

#### Mean ####

penguins %>% # group penguin data 
  drop_na(species,island,sex) %>% # remove NA from these groups 
  group_by(species,island, sex) %>% # group categories together 
  summarise(body_mass_g = mean(body_mass_g, na.rm = TRUE)) # calculate mean body mass 

#### Variance ####

Variance_Data <- penguins %>% # group penguin data 
  drop_na(species,island,sex) %>% # remove NA from these groups 
  group_by(species,island, sex) %>% # group categories together 
  summarise(body_mass_g = var(body_mass_g, na.rm = TRUE)) # calculate variance of body mass 


#### Part 2 ####

Female_Data <- penguins %>% # use penguin dataframe
  filter(sex == "female") %>% #select females
  mutate(log_mass = log(body_mass_g)) %>% # calculate log 
  select(species, island, sex, log_mass) # select categories 

ggplot(data =Female_Data, # make a graph 
       mapping=aes(x=species, # x axis 
                   y=log_mass,# y axis 
                   color = species,
                   fill=species)) + # boxes are filled based on sex 
  geom_point()+ # type of graph 
  labs(x="species", # title of x axis 
       y="body_mass_g", # title of y axis 
       title= "Penguin Female Data Only") + # title of graph 
  facet_wrap(~island)

ggsave(here("Week_4","Output","Penguin_hw.png"), # saved 
       width=7, height=5)
