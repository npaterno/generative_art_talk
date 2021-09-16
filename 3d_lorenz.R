library(ggplot2)
library(viridis)
library(dplyr)
library(nonlinearTseries)
library(ggdark)
library(rayshader)

options("cores"=2)

lor <- data.frame(lorenz(time = seq(0, 10000, by = 0.01)))

gglorenz = ggplot(lor, aes(x, y))+
  stat_density_2d(aes(fill = x), geom = "polygon", n = 200, bins = 50,contour = TRUE)+
  scale_fill_viridis_c(option = "A")

plot_gg(gglorenz,multicore = TRUE,width=5,height = lor$z, scale=250,windowsize=c(1400,866),zoom = 0.55, phi = 30)
render_snapshot()
# }
#Change the camera angle and take a snapshot:
render_camera(zoom=0.5,theta=-30,phi=30)
render_snapshot(clear = TRUE)

ggdiamonds = ggplot(diamonds, aes(x, depth)) +
  stat_density_2d(aes(fill = stat(nlevel)), geom = "polygon", n = 200, bins = 50,contour = TRUE) +
  facet_wrap(clarity~.) +
  scale_fill_viridis_c(option = "A")
# \dontrun{
plot_gg(ggdiamonds,multicore = TRUE,width=5,height=5,scale=250,windowsize=c(1400,866),
        zoom = 0.55, phi = 30)