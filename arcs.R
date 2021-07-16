# https://mran.revolutionanalytics.com/snapshot/2019-02-07/web/packages/ggforce/vignettes/Visual_Guide.html
# Page 61 Processing
library(tidyverse)
library(ggforce)

circles <- tibble(
  start = c(30,59),
  end = c(302,230)
)

circles <- circles %>% 
  rowid_to_column()

circles %>% 
  mutate(across(.cols = c(start:end), ~ (.x * 2 * pi) /360))

circles %>% 
  ggplot() + 
  geom_arc0(aes(x0 = 0, y0 = 0, r = 1, start = start, end = end)) + 
  facet_wrap(vars(rowid)) + 
  coord_equal()

  mutate(
    start = (start * 2*pi) /360, 
    end = (start * 2*pi) /360, 
    
  )