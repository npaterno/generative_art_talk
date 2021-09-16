library(jasmines)
library(dplyr)
library(ggplot2)

use_seed(1) %>%
  scene_discs(
    rings = 3, points = 6000, size = 4
  ) %>%
  mutate(ind = 1:n()) %>%
  unfold_warp(
    iterations = 2,
    scale = .6, 
    output = "layer" 
  ) %>%
  unfold_tempest(
    iterations = 25,
    scale = .01
  ) %>%
  style_ribbon(
    palette = "viridis",
    colour = "layer",
    alpha = c(.15,.05),
    background = "oldlace"
  )

# Save image
ggsave(here::here("images/jasmines.png"), dpi = 300)
