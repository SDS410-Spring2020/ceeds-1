library(ggplot2)
library(dplyr)
library(macleish)

# goal: add a months column

orchard_2015
whately_2015

# differences in variables between both data sets
names(orchard_2015)
names(whately_2015)

# tried to use dplyr, didn't work
# whately_2015 %>%
#   mutate(month = format(as.Date(whately_2015$when), "%m"))
# head(whately_2015)

# adds on month column to whately_2015
whately_2015$date <- format(as.Date(whately_2015$when), "%m")

# adds on month column to orchard_2015
orchard_2015$date <- format(as.Date(orchard_2015$when), "%m")

# find way to rewrite this using lubridate and/or dplyr?

# generate summary table of whately_2015
# table includes date and tot_rainfall 
sum_whately <- whately_2015 %>%
  group_by(date) %>%
  summarise(tot_rainfall = sum(rainfall)) 

# names of the months variable
month <- c("January", "February", "March", "April", 
           "May", "June", "July", "August", "September", 
           "October", "November", "December")

# add on months column to dataset
whately <- cbind(sum_whately, month)


# establish x and y variables
# either theme_minimal() or theme_classic()
# changes & adds y and title label
# reorder the months in x variable
p <- ggplot(whately, aes(month, tot_rainfall, group = 1)) +
  theme_minimal() +
  labs(y = "total rainfall (mm)",
       title = "2015 Total Rainfall by Month") +
  scale_x_discrete(limits = whately$month) 

# make a bar chart
p + geom_bar(stat = "identity", fill = "#a6cee3")
  
# make a line chart
p + geom_line(color = "#a6cee3") +
  geom_point(color = "#a6cee3")

# figure out how to make these reactive?

