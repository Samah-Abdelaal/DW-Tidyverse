library("tidyverse")
library("readxl")

load("Data Raw/brfss2013.RData")

# educa: Education Level
# employ1: Employment Status
# income2: Income Level
# medscost: Could Not Get Medicine Due To Cost
# carercvd: Satisfied With Care Received
# rrclass2: How Do Other People Usually Classify You In This Country?
# rrcognt2: How Often Do You Think About Your Race?
# rratwrk2: How Do You Feel You Were Treated At Work Compared To People Of Other Races In Pa
# rrhcare3: When Seeking Health Care Past 12 Months, Was Experience Worse, Same, Better Than
# lsatisfy: Satisfaction With Life

brfss2013 %>%
  select(educa, employ1, income2, medscost,
         carercvd, rrclass2, rrcognt2, rratwrk2, rrhcare3, lsatisfy) %>%
  filter(complete.cases(.)) %>%
  filter(rrclass2=="White" | rrclass2=="Black or African American") %>%
  write_csv("Data/race_data.csv")

# educa: Education Level
unique(race_data$educa)

# employ1: Employment Status
unique(race_data$employ1)

# income2: Income Level
unique(race_data$income2)

# medscost: Could Not Get Medicine Due To Cost
unique(race_data$medscost)

# carercvd: Satisfied With Care Received
unique(race_data$carercvd)

# rrclass2: How Do Other People Usually Classify You In This Country?
unique(race_data$rrclass2)

# rrcognt2: How Often Do You Think About Your Race?
unique(race_data$rrcognt2)

# rratwrk2: How Do You Feel You Were Treated At Work Compared To People Of Other Races In Pa
unique(race_data$rratwrk2)

# rrhcare3: When Seeking Health Care Past 12 Months, Was Experience Worse, Same, Better Than
unique(race_data$rrhcare3)

# lsatisfy: Satisfaction With Life
unique(race_data$lsatisfy)

brfss2013 %>%
  select(rrclass2, rrhcare3) %>%
  filter(complete.cases(.)) %>%
  filter(rrclass2=="White" | rrclass2=="Black or African American") %>%
  filter(rrhcare3=="The same as other races" | rrhcare3=="Better than other races") %>%
  write_csv("Data/race_data1.csv")
