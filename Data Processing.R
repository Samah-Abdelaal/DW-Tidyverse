income_data <- read_csv("Data/income_data.csv")

income_data %>%
  filter(complete.cases(.))
