##packages
install.packages("palmerpenguins")
library(tidyverse)
library(palmerpenguins)
library(here)
library(beyonce)
library(ggthemes)
###coding line for body mass and sex of each adelie species
glimpse(penguins)
summary(penguins)


quantify_data <- ggplot(data=penguins,
                        mapping= aes(x= sex,   
                                     y= body_mass_g,
                                     fill = sex))+
  geom_boxplot()+
  labs(x= "sex", #x title
       y= "Body Mass (g)", ##y title
       title= "Quantify the Body Mass of Penguins")+ ## title
facet_grid(~species)+ ##create different graphs for species
  scale_fill_manual(values = beyonce_palette(7))+  #beyonce color
  theme_stata() +
  theme(axis.title = element_text(size = 15), panel.background = element_rect(fill = "gray"))

ggsave(here("week_3","output","sex.png"),
       width = 7, height = 5)
