install.packages("tidyverse") 
library(tidyverse)

city <- read.csv("C:/Users/Shivalee Duara/Downloads/city.csv")
hospital <- read.csv("C:/Users/Shivalee Duara/Downloads/hospital.csv")
glimpse(city)
glimpse(hospital)
city %>% distinct(city, .keep_all = TRUE)
colSums(is.na(city))
hospital <- hospital %>%
  separate(hospital,
           into = c("city","hospital_name"),
           sep = " (?=[^ ]+$)")
head(hospital)
hospital_city <- hospital %>%
  group_by(city) %>%
  summarise(across(starts_with("cases"),sum))
final_data <- city %>%
  left_join(hospital_city, by = "city")
glimpse(final_data)
