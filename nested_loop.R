# Processing P 113 
library(tidyverse)

lines_stripes <-  tibble(
  x = seq(20,80,5), 
  y = seq(20,80,5)
) %>% 
  expand(x,y)

lines_stripes <- lines_stripes %>% 
  mutate(
    xend = x + 3,
    yend = ifelse(x %% 10, y = y + 3, y -3)
  )

lines_stripes %>% 
  ggplot(aes(x,y , xend = xend, yend = yend)) + 
  geom_segment(size = 1.5, color = "#111111") + 
  xlim(c(0,100)) + 
  ylim(c(0,100)) + 
  coord_fixed() + 
  theme_void() + 
  theme(
    plot.background = element_rect(fill = "white", color = NA)
  )

ggsave("Graphics/lines_stripes.png", width = 6, height = 6, device = ragg::agg_png, dpi = 320)


# Shifted lines stripes ---------------------------------------------------
lines_stripes <-  tibble(
  x = seq(20,85,5), 
  y = seq(20,85,5)
) %>% 
  expand(x,y)

lines_stripes <- lines_stripes %>% 
  mutate(
    xend = x - 3,
    yend = ifelse(x <= 50, y = y - 3, y +3)
  )

lines_stripes %>% 
  ggplot(aes(x,y , xend = xend, yend = yend)) + 
  geom_segment(size = 1.5, color = "#111111") + 
  xlim(c(0,105)) + 
  ylim(c(0,105)) + 
  coord_fixed() + 
  theme_void() + 
  theme(
    plot.background = element_rect(fill = "white", color = NA)
  )

ggsave("Graphics/lines_stripes_shifted.png", width = 6, height = 6, device = ragg::agg_png, dpi = 320)


# Crossed lines -----------------------------------------------------------
tibble(
x = seq(1,100, by = 10),
y = seq(1,100, by = 10)
) %>% 
  expand(x,y) %>% 
  mutate(
    x2 = x+6,
    xend = ifelse(x  < y ,x+6, NA),
    yend = ifelse(x  < y ,y+6, NA),
    x2_end = ifelse(x  < y ,x, NA)
  ) %>% 
  pivot_longer(cols = c(x,x2), names_to = "nx", values_to = "vx") %>% 
  pivot_longer(cols = c(xend,x2_end), names_to = "nxend", values_to = "vxend") %>% 
  select(vx, y, vxend, yend) %>% 
  drop_na() %>% 
  filter(vx != vxend) %>% 
ggplot(aes(vx,y , xend = vxend, yend = yend)) + 
  geom_segment(size = 1.5, color = "#111111") + 
  coord_fixed() + 
  xlim(c(-9,101)) + 
  ylim(c(-1,107)) + 
  theme_void()+ 
  theme(
    plot.background = element_rect(fill = "white", color = NA)
  )

ggsave("Graphics/crossed_lines.png", width = 6, height = 6, device = ragg::agg_png, dpi = 320)


# Rectangles --------------------------------------------------------------
height <- 250
width <- 250

rects_df <- cross_df(.l = list(x = seq(9, width, by = 20),y = seq(9, height, by = 20), d = seq(18, 1, by = -4)))

rects_df %>% 
  ggplot(aes(xmin = x, ymin = y, xmax = x + d, ymax = y + d)) + 
  geom_rect(color = "#01FF70", fill =NA, size = .5) +
  coord_fixed()  + 
  theme_void() + 
  theme(
    plot.background = element_rect(fill = "white", color = NA)
  )

ggsave("Graphics/looped_rects.png", width = 6, height = 6, device = ragg::agg_png, dpi = 320)
