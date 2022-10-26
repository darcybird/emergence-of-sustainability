library(tidyverse)

d <- readr::read_csv(
  here::here("Sust_model_results_messy.csv")
) %>% 
  dplyr::rename(run = `[run number]`)


results <- d %>% 
  pivot_wider(id_cols = 
                c(run), 
              names_from = c(variable), values_from = c(value)) 



d_results <- d100 %>% 
  dplyr::select( - variable, - value) %>% 
  dplyr::filter(!is.na(metabolism)) %>% 
  dplyr::left_join(results, by = "run")


readr::write_csv(d_results, 
                 file = "Sust_model_results_clean.csv")

