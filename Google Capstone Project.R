## Downloading packages for cleaning and analyzing

install.packages("tidyverse")
install.packages("lubridate")

# Loading packages 
library("tidyverse")
library("lubridate")
library("data.table")

## Importing files into R 
`01_2021` <- read.csv("C:/Users/Brenden/Desktop/Capstone/202101-divvy-tripdata.csv")
`02_2021` <- read.csv("C:/Users/Brenden/Desktop/Capstone/202102-divvy-tripdata.csv")
`03_2021` <- read.csv("C:/Users/Brenden/Desktop/Capstone/202103-divvy-tripdata.csv")
`04_2021` <- read.csv("C:/Users/Brenden/Desktop/Capstone/202104-divvy-tripdata.csv")
`05_2021` <- read.csv("C:/Users/Brenden/Desktop/Capstone/202105-divvy-tripdata.csv")
`06_2021` <- read.csv("C:/Users/Brenden/Desktop/Capstone/202106-divvy-tripdata.csv")
`07_2021` <- read.csv("C:/Users/Brenden/Desktop/Capstone/202107-divvy-tripdata.csv")
`08_2021` <- read.csv("C:/Users/Brenden/Desktop/Capstone/202108-divvy-tripdata.csv")
`09_2021` <- read.csv("C:/Users/Brenden/Desktop/Capstone/202109-divvy-tripdata.csv")
`10_2021` <- read.csv("C:/Users/Brenden/Desktop/Capstone/202110-divvy-tripdata.csv")
`11_2021` <- read.csv("C:/Users/Brenden/Desktop/Capstone/202111-divvy-tripdata.csv")
`12_2021` <- read.csv("C:/Users/Brenden/Desktop/Capstone/202112-divvy-tripdata.csv")

## Checking column names before merging into a single data frame
colnames(`01_2021`)
colnames(`02_2021`)
colnames(`03_2021`)
colnames(`04_2021`)
colnames(`05_2021`)

## Merging data into a single data frame
cyclistic_df <- rbind(`01_2021`, `02_2021`, `03_2021`, `04_2021`, `05_2021`, `06_2021`, `07_2021`, `08_2021`, `09_2021`, `10_2021`, `11_2021`, `12_2021`)

## Inspecting the merged data frame
colnames(cyclistic_df)
nrow(cyclistic_df)
str(cyclistic_df)
     
## Removing columns that are not necessary for analysis
cyclistic_df <- cyclistic_df %>%  
  select(-c(start_lat, start_lng, end_lat, end_lng))

## Creating columns for date, month, day, and year of each ride
cyclistic_df$date <- as.Date(cyclistic_df$started_at) # The default format is yyyy-mm-dd
cyclistic_df$month <- format(as.Date(cyclistic_df$date), "%m") # Creating a column for month
cyclistic_df$day <- format(as.Date(cyclistic_df$date), "%d") # Creating a column for day
cyclistic_df$year <- format(as.Date(cyclistic_df$date), "%y") # Creating a column for year
cyclistic_df$day_of_week <- format(as.Date(cyclistic_df$date), "%a") # Creating a column for day of week


# Creating a ride_length calculation in seconds
cyclistic_df$ride_length <- difftime(cyclistic_df$ended_at,cyclistic_df$started_at, units = "mins")

## Changing strings into a numeric datatype
cyclistic_df$ride_length <- as.numeric(as.character(cyclistic_df$ride_length))


## Cleaning Data
cyclistic_df_cleaned <- cyclistic_df %>% ## Removing any ride_length with values of <= 0  
  filter(!(ride_length <= 0))
cyclistic_df_cleaned <- na.omit(cyclistic_df_cleaned) ## Removing NA values 
cyclistic_df_cleaned <- distinct(cyclistic_df_cleaned) ## Removing duplicates 


cyclistic_df_cleaned <- cyclistic_df_cleaned %>% ## Removing station rows that had blanks 
  filter(
    !(is.na(start_station_name) | start_station_name == "")
  ) %>% 
  
  filter(!(is.na(end_station_name) | end_station_name == "")
  )


## Analyzing Data

nrow(cyclistic_df_cleaned) ## Checking the total number of riders after cleaning data

cyclistic_df_cleaned %>% ## Counting the number of casuals vs the number of members
  group_by(member_casual) %>% 
  count(member_casual)

cyclistic_df_cleaned %>% # Total number of ride able types
  group_by(rideable_type) %>% 
  count(rideable_type)

cyclistic_df_cleaned %>% ## Counting the number of unique bikes used and grouped by casuals/members
  group_by(member_casual,rideable_type) %>% 
  count(rideable_type)

cyclistic_df_cleaned %>% ## Checking the amount of rides each day
  count(day_of_week) 

cyclistic_df_cleaned %>%  ## Seeing which days were the most popular to casuals and members
  group_by(member_casual) %>% 
  count(day_of_week)

cyclistic_df_cleaned %>% ## Seeing which month is the most popular for riders
  count(month)

cyclistic_df_cleaned %>% ## Seeing which month is the most popular for casuals vs members
  group_by(member_casual) %>% 
  count(month) %>% 
  print(n = 24)


mean(cyclistic_df_cleaned$ride_length) ## The average ride length overall in minutes
max(cyclistic_df_cleaned$ride_length) ## Longest ride in minutes 
min(cyclistic_df_cleaned$ride_length) ## Shortest ride in minutes
summary(cyclistic_df_cleaned$ride_length) ## Summary of the above data

aggregate(cyclistic_df_cleaned$ride_length ~ cyclistic_df_cleaned$member_casual + 
            cyclistic_df_cleaned$day_of_week, FUN = mean) ## Average ride length time for casuals vs members by day of week

cyclistic_df_cleaned %>% ## Seeing the average ride_length of casuals vs members
  group_by(member_casual) %>%  
  summarise_at(vars(ride_length), 
               list(time = mean))

cyclistic_df_cleaned %>% ## Seeing the average ride_length of different ride able types
  group_by(rideable_type, member_casual) %>%  
  summarise_at(vars(ride_length), 
               list(time = mean))

cyclistic_df_cleaned %>% ## 
  group_by(day_of_week) %>% 
  summarise_at(vars(ride_length), list(time = mean))

cyclistic_df_cleaned %>% ## Looking at which month riders spent the most time on
  group_by(month, member_casual) %>% 
  summarise_at(vars(ride_length), list(time = mean)) %>%
  print(n = 24)

cyclistic_df_cleaned %>% 
  group_by(month) %>% 
  summarise_at(vars(ride_length), list(time = mean)) 

cyclistic_df_cleaned %>% ## Looks at the number of rides per day and the average ride length for casuals vs members
  mutate(weekday = wday(started_at, label = TRUE)) %>% 
group_by(member_casual, weekday) %>% 
  summarise(number_of_rides = n()
  ,average_duration = mean(ride_length)) %>% 
  arrange(member_casual, weekday)








