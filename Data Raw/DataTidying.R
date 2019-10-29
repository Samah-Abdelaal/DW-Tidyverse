library("tidyverse")
library("readxl")

load("Data Raw/brfss2013.RData")

brfss2013 %>%
  select(income2, lsatisfy) %>%
  sample_n(5000) %>%
  write_csv("Data/income_data.csv")

