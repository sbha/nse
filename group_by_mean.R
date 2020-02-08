library(tidyverse)

f <- function(d, g, v){
  group_var <- enquo(g)
  mean_var <- enquo(v)
  
  d %>% 
    group_by(!! group_var) %>% 
    summarise(cars = n(),
              avg = mean(!! mean_var))
  
}


df <- rownames_to_column(mtcars) %>% as_tibble()


f(df, cyl, hp)
