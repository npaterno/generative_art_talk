# Load packages
library(dplyr)
library(ggplot2)
library(ggdark)

# Examples using base R to generate a grid of x,y values and ggplot (along with formulas) to generate the art

seq(-5, 5, by = 0.01) %>% 
  expand.grid(x = ., y = .) %>% 
  ggplot()+
  geom_point(aes(x = 1-sin(x^2)+cos(y^2),
                 y = -cos(y*x^2)-sin(y)),
             size = 0,
             shape = 20,
             alpha = 0.05,
             color = "white")+
  dark_theme_void()

ggsave(here::here("images/basic.png"), dpi = 300)

seq(-5, 5, by = 0.01) %>% 
  expand.grid(x = ., y = .) %>% 
  ggplot()+
  geom_point(aes(x = 1-sin(x^2)+cos(y^2),
                 y = -cos(y*x^2)-sin(y)),
             size = 0,
             shape = 20,
             alpha = 0.05,
             color = "white")+
  dark_theme_void()+
  coord_polar()

ggsave(here::here("images/polar.png"), dpi = 300)
   
seq(-5, 5, by = 0.01) %>% 
  expand.grid(x = ., y = .) %>% 
  ggplot()+
  geom_point(aes(x = 1-sin(x^2)+cos(y^2),
                 y = -cos(y*x^2)-sin(y),
                 color = sin(x)),
             size = 0,
             shape = 20,
             alpha = 0.05)+
  scale_color_viridis_c(option = "turbo")+
  dark_theme_void()+
  coord_polar()+
  guides(color = "none")

ggsave(here::here("images/color.png"), dpi = 300)
