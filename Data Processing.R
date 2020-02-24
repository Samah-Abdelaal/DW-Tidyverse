library(tidyverse)
library(ggplot2)
library(ggthemes)
library(scales)

race_data1 <- read_csv("Data/race_data1.csv")

str(race_data)

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


xtabs(~ rrclass2 + rrhcare3, data = race_data1)

race_data1 %>%
  ggplot(aes(x= rrhcare3,
            fill= rrclass2)) +
  geom_bar() +
  facet_wrap(~ rrclass2)+
  labs(x= "Was Experience Same, Better Than",
       fill="Race", y= "Percentage %") +
  scale_x_discrete(label = function(x)str_wrap(x, width = 5))+
  scale_y_continuous(labels = percent_format(accuracy = 1, scale = 1))+
  theme(axis.text.x = element_text(hjust = 0.5))

logis_data <- race_data1 %>%
  mutate(race_dummy= (ifelse(rrclass2=="White", 0, 1)),
         experience_dummy= (ifelse(rrhcare3=="The same as other races", 0, 1)),
         rrclass2 = as.factor(rrclass2),
         rrhcare3 =  as.factor(rrhcare3))

logis_data <- within(logis_data, rrclass2 <- relevel(rrclass2, ref = "White"))

cor(logis_data$experience_dummy, logis_data$race_dummy, method = "spearman")

model1 <- glm(formula = rrhcare3~ rrclass2, family = binomial, data = logis_data)
summary(model1)

exp(model1$coefficients)
