library(tidyverse)
library(ragg)
size <- 1250
coords <- tibble(
  width = runif(size, min = 0.01, 0.035),
  height = runif(size, min = 0.01, 0.025),
  x = runif(size),
  y = runif(size),
  alpha = runif(size)
)


coords %>% 
  ggplot() + 
  geom_rect(aes(xmin = x, ymin = y, xmax = x + width,ymax = y + height, alpha = alpha), color ="white" ,fill ="black", size = 0.25) + 
  coord_equal(expand = F, clip = "off") + 
  scale_alpha(range = c(0.25, 0.95), guide = "none") + 
  theme_minimal() + 
  theme(
    plot.background = element_rect(fill = "black", color = NA),
    panel.grid = element_blank(),
    axis.text = element_blank())


ggsave(here::here("Graphics","random_rect.png"), width = 6, height = 6, unit = "in", device = agg_png())
dev.off()
