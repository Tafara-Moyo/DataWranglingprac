
rails<- read.csv("~/Downloads/Rail_Equipment_Accident_Incident_Data (1).csv")
str(rails)


 ## creating a summary of total acceidnts by state 
library(ggplot2)
library(dplyr)

# Group and summarize the data by state
accidents_summary <- rails %>%
  group_by(State.Name) %>%
  summarize(TotalAccidents = n())

# Sort the data frame in descending order based on TotalAccidents
accidents_summary <- accidents_summary %>%

                    arrange(desc(TotalAccidents))

print(accidents_summary)

#Creating and plotting the top 6 states with accidents

 top_six <- head(accidents_summary)


ggplot(top_six, aes(x = State.Name, y = TotalAccidents)) +
  geom_bar(stat = "identity", fill = "grey") +
  labs(title = "Top 6 States with the Most Accidents between 1975 and 2022",
       x = "State",
       y = "Total Accidents") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 30, hjust = 1))

