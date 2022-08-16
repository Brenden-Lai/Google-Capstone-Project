# GOOGLE-CAPSTONE-PROJECT

I worked on the Google Data Analytics Capstone Project and decided to choose the first case study that they provided which focused on a fictional bicycle company called Cyclistic. I will explain the process in Ask - Prepare - Process - Analyze - Share - Act. 


The file above contains the code for my Google Capstone Project which goes into depth of what I did, done in RStudio. 

Here is the link to my Visualization that I did in a Tableau Dashboard [here](https://public.tableau.com/app/profile/brenden.lai/viz/CyclisticCapstoneViz/Dashboard1) 


SCENARIO

  You are a junior data analyst working in the marketing analyst team at Cyclistic, a bike-share company in Chicago. The director
of marketing believes the company’s future success depends on maximizing the number of annual memberships. Therefore,
your team wants to understand how casual riders and annual members use Cyclistic bikes differently. From these insights,
your team will design a new marketing strategy to convert casual riders into annual members. But first, Cyclistic executives
must approve your recommendations, so they must be backed up with compelling data insights and professional data
visualizations.

ABOUT THE COMPANY

  In 2016, Cyclistic launched a successful bike-share offering. Since then, the program has grown to a fleet of 5,824 bicycles that
are geotracked and locked into a network of 692 stations across Chicago. The bikes can be unlocked from one station and
returned to any other station in the system anytime.

  Until now, Cyclistic’s marketing strategy relied on building general awareness and appealing to broad consumer segments.
One approach that helped make these things possible was the flexibility of its pricing plans: single-ride passes, full-day passes,
and annual memberships. Customers who purchase single-ride or full-day passes are referred to as casual riders. Customers
who purchase annual memberships are Cyclistic members.

  Cyclistic’s finance analysts have concluded that annual members are much more profitable than casual riders. Although the
pricing flexibility helps Cyclistic attract more customers, Moreno believes that maximizing the number of annual members will
be key to future growth. Rather than creating a marketing campaign that targets all-new customers, Moreno believes there is a
very good chance to convert casual riders into members. She notes that casual riders are already aware of the Cyclistic
program and have chosen Cyclistic for their mobility needs.

  Moreno has set a clear goal: Design marketing strategies aimed at converting casual riders into annual members. In order to
do that, however, the marketing analyst team needs to better understand how annual members and casual riders differ, why
casual riders would buy a membership, and how digital media could affect their marketing tactics. Moreno and her team are
interested in analyzing the Cyclistic historical bike trip data to identify trends.

-- ASK

I needed to know how casual riders and annual members differ to answer our business task.

Our business task: To convert our current casuals into members.

-- PREPARE

For this project, I was provided a bicycle dataset under Divvy that was made avaliable by Motivate International Inc. under this license [here](https://ride.divvybikes.com/data-license-agreement). Because this dataset was provided and collected by the company, it is a reliable source that is ready to use for cleaning and analyzing. 

-- PROCESS

1. To begin the cleaning process, I first had to choose which program to use. I decided to use R, as it was a programming language that could handle the sheer amount of data that was provided and because I wanted to showcase some of the R skills that I received from the Google Data Analytics program. 

2. Next, I imported the dataset into RStudio Desktop using read.csv.

3. I then checked the column names to make sure that they were all the same in order to merge them into one file.

4. Merge into a single file.

5. Inspected the merged file to ensure that there were no problems.

6. Removed columns that weren't necessary for analysis.

7. Created new columns for date, month, day, and year of each ride

8. Created a ride_length column in minutes which took the difference between the ended_at column and the started_at column.

9. Changed the ride_length's datatype from a string to a numeric.

10. Now I was ready to start some cleaning. I began by removing any rows in the ride_length column that had values of <= 0.

11. I then checked for NA values and duplicates.

12. Lastly, I removed any rows that had a blank specifically in the station rows.

-- ANALYZE

To summarize, I checked for the number of rows that I had to work with to clarify how many riders we had in total. With this knowledge, I grouped the members and casuals to see how many of each we currently had to see the number of casuals we want to convert. Next, I looked at the different bike choices that members and casuals preferred and found out that the most popular options were in order: classic bikes, electric bikes, then docked bikes. Docked bikes being the only option that was used only by casuals except for a singular member. I also wanted to know which day of the week and month was the most popular for our riders in order to offer recommendations to our stakeholders. I found out that casuals preferred riding during the weekends (Saturday and Sunday) while members preferred (Tuesday and Wednesday). As for the months, both casuals and members preferred the summertime (June - September) and didn't prefer the wintertime (December - March). Lastly, I compared the ride length between casuals and members by day and month. I found out that casuals spent significantly more minutes on average than members, both for each day of the week and the month. 

-- SHARE

Created visualizations in Tableau to further demonstrate my skills. Visualizations for this project included bar graphs, circle views, and a text table. The visualization can be found on my public Tableau profile [here](https://public.tableau.com/app/profile/brenden.lai). 


-- ACT

Recommedations for stakeholders:

1. Aim to target and promote the cyclistic membership during the summertime by offering discounts.
2. Potential reward system exclusive to members that incentivizes users to use the bikes longer and more often.
3. Pushing a lifestyle narrative during peak day of weeks and months.

Overall, receiving more feedback from casuals and members will help offer more insight into how we could potentially convert more casuals into members. For example, knowing why our current members decided to become members in the first place and why casuals aren't becoming members even though they enjoy the bikes even more than members.  












































