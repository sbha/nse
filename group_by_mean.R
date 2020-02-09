library(tidyverse)

group_by_mean <- function(d, v, ...){
  mean_var <- enquo(v)
  group_var <- enquos(...)
  
  
  d %>% 
    group_by(!!! group_var) %>% 
    summarise(count = n(),
              mean = mean(!! mean_var))
  
}


df <- rownames_to_column(mtcars) %>% as_tibble()

group_by_mean(df, mpg, cyl, hp, gear)