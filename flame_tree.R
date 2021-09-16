# Load packages
library(dplyr)
library(flametree)
library(ggplot2)

# Example Flametree
flametree_grow(
  seed = 87,
  time = 6,
  scale = c(0.6, 0.8, 1.2),
  angle = c(-30, -15, 45, 60),
  split = 4,
  trees = 1,
  shift_x = spark_random(),
  shift_y = spark_random(),
) %>%
  flametree_plot(
    palette = c("pink", "firebrick", "purple", "cyan", "orange2")
  ) +
  coord_polar()

# Save image
ggsave(filename = here::here("images/flametree_polar_example.png"))
