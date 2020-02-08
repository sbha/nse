library(tidyverse)

group_by_mean <- function(d, g, v){
  group_var <- enquo(g)
  mean_var <- enquo(v)
  
  d %>% 
    group_by(!! group_var) %>% 
    summarise(count = n(),
              mean = mean(!! mean_var))
  
}


df <- rownames_to_column(mtcars) %>% as_tibble()

group_by_mean(df, cyl, hp)


