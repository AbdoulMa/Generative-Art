library(tidyverse)
(plot <- seq(from = -10, to = 10, by = 0.04) %>% 
  expand.grid(x = ., y = .) %>% 
  ggplot(aes(x = (x+pi*sin(y)), y =(y + pi*sin(x)))) + 
  geom_point(alpha = .1, shape = 20, size = 0) + 
  theme_void()
)
png("Graphics/silk.png", width = 6, height = 6, units ="in", res = 320, type = "cairo")
plot
dev.off()
