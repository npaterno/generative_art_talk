library(Rcpp)
library(ggplot2)
library(dplyr)

opt = theme(legend.position  = "none",
            panel.background = element_rect(fill="#87212e"),
            axis.ticks       = element_blank(),
            panel.grid       = element_blank(),
            axis.title       = element_blank(),
            axis.text        = element_blank())

cppFunction('DataFrame createTrajectory(int n, double x0, double y0, 
            double b, double c, double d, double f) {
            // create the columns
            NumericVector x(n);
            NumericVector y(n);
            x[0]=x0;
            y[0]=y0;
            for(int i = 1; i < n; ++i) {
            x[i] = x[i-1]-pow(x[i-1],3)/3-y[i-1]*b;
            y[i] = (x[i-1]+c+d*y[i-1])/f;
            }
            // return a new data frame
            return DataFrame::create(_["x"]= x, _["y"]= y);
            }
            ')

b = 0.5 
c = 0.8 
d = 0.7
f = 12.5
  
df=createTrajectory(10000000, 0.4, 0.6, b, c, d, f)

ggplot(df, aes(x, y)) + geom_point(color="white", shape=46, alpha=1) + opt
