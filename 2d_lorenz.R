# Load packages
library(dplyr)
library(ggplot2)
library(nonlinearTseries)
library(ggdark)

# Generate data sets
lor <- data.frame(lorenz(time = seq(0, 10000, by = 0.01)))
lor_alt <- data.frame(lorenz(sigma = 9, beta = 2/3, rho = 20, start = c(-10, -5, 50), time = seq(0, 10000, by = 0.01)))

# Traditional Lorenz
ggplot(lor, aes(x, y))+
  geom_point(color = "white", shape = 46, size = 0, alpha = 0.01)+
  dark_theme_void()

# Save image
ggsave(here::here("images/basic_lorenz.png"), dpi = 300)

# Color version
ggplot(lor, aes(x, y, color = x))+
  geom_point(shape = 46, size = 0, alpha = 0.05)+
  dark_theme_void()+
  guides(color = "none")+
  scale_color_gradient(low = "yellow", high = "red")

# Save image
ggsave(here::here("images/lorenz_colorized.png"), dpi = 300)

# Lorenz with different parameter values
ggplot(lor_alt, aes(x, y, color = sin(x)+cos(y)))+
  geom_point(shape = 46, size = 0, alpha = 0.025)+
  theme_void()+
  guides(color = "none")+
  scale_color_viridis_c(option = "turbo")

# Save image
ggsave(here::here("images/lorenz_alt.png"), dpi = 300)
