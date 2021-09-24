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
