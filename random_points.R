library(tidyverse)


num_points <- 900
tibble(
angle = runif(num_points, 0, 2*pi),
scalar = runif(num_points, 10, 40), 
x = 50 + (cos(angle) * scalar),
y = 50 + (sin(angle) * scalar)
) %>% 
  ggplot(aes(x,y)) + 
  geom_point() +
  coord_fixed() + 
  theme_void()


tibble(
  x = seq(10,90, by = 4),
  y = seq(10,90, by = 4)
) %>% 
  expand(x,y) %>% 
  mutate(x = x + (runif(1, -2,2)),
         y = y +  (runif(1, -2,2))) %>% 
  ggplot(aes(x,y)) + 
  geom_point() +
  coord_fixed() + 
  theme_void()

rand()

runif(1, -2,2, seed = 1234)
