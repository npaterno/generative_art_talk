# Load packages
library(ggplot2)
library(dplyr)

# Generate data frame with random values for color
color_data <- sample(1:18, 1600, replace = TRUE)
df <- data.frame(expand.grid(0:39, 0:39))
plot_data <- df %>% 
  mutate(color_data = as.integer(color_data))

# Generate colors
clrs = grDevices::colors()[grep('gr(a|e)y', grDevices::colors(), invert = T)]
plot_clrs = sample(clrs, 18)


# Generate Plot
ggplot(plot_data) +
  geom_rect(aes(xmin = Var1, xmax = Var1+1, ymin = Var2, ymax = Var2+1), fill = plot_clrs[color_data])+
  theme_void()

ggsave(here::here("images/kelly_r.png"), dpi = 300, width = 7.41, height = 7.41)
