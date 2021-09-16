library(dplyr)
library(ggplot2)
library(Rcpp)

opt = theme(legend.position  = "none",
            panel.background = element_rect(fill="#cc9933"),
            axis.ticks       = element_blank(),
            panel.grid       = element_blank(),
            axis.title       = element_blank(),
            axis.text        = element_blank())

cppFunction('DataFrame createTrajectory(int n, double x0, double y0, 
            double a, double b, double c, double d) {
            // create the columns
            NumericVector x(n);
            NumericVector y(n);
            x[0]=x0;
            y[0]=y0;
            for(int i = 1; i < n; ++i) {
            x[i] = sin(a*y[i-1])+c*cos(a*x[i-1]);
            y[i] = sin(b*x[i-1])+d*cos(b*y[i-1]);
            }
            // return a new data frame
            return DataFrame::create(_["x"]= x, _["y"]= y);
            }
            ')

a=1.24458046630025
b=-1.25191834103316 
c=1.81590817030519 
d=-1.90866735205054

df=createTrajectory(10000000, 0, 0, a, b, c, d)

ggplot(df, aes(x, y)) + geom_point(color="white", shape=46, alpha=.01) + opt

ggsave(here::here("images/clifford.png"), dpi = 300)
