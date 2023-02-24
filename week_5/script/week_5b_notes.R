install.packages("lubridate")
library(here)
library(tidyverse)
library(lubridate)


now()
now(tzone= "EST")

today()  ##tells the date
leap_year()
ymd("2021-02-24")
datetimes <- c("02/24/2021 22:22:20",
               "02/25/2021 11:21:10",
               "02/26/2021 8:01:52")
datetimes <- mdy_hms(datetimes)
month(datetimes)
month(datetimes, label= TRUE)
month(datetimes, label= TRUE, abbr = TRUE)
day(daytimes)
wday(datetimes, label= TRUE, label= TRUE, abbr = FALSE)
hour(datetimes)
minute(datetimes)
seconds(datetimes)
datetimes +hours(4) ##adding or subtracting time its hours if checking time its hour


##readin the data
Conda <- read_csv(here("week_5", "data", "CondaData.csv"))%>%
  mutate
