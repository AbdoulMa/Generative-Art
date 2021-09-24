library(tidyverse)

c <- 4 
 
squares_df <- tibble(
  xmin = 1:4, 
  ymin = 4:1,
  fill = c("#ffffff","#cccccc","#999999","#666666")
) %>% 
  mutate(
    xmax = xmin + c, 
    ymax = ymin + c
  )

squares_df %>% 
  ggplot(aes(xmin = xmin, xmax = xmax, ymin= ymin, ymax = ymax)) + 
  geom_rect(aes(fill = fill), color ="black") + 
  xlim(c(-2,11)) +
  ylim(c(-2,11)) +
  coord_fixed() + 
  theme_void() +
  scale_fill_identity(guide = "none") + 
  theme(
    plot.margin  = margin(30),
    plot.background = element_rect(fill = "#e6e6e6", color = NA)
  )

ggsave("Graphics/gray_squares.png", width = 6, height = 6, device = ragg::agg_png, dpi = 320)
