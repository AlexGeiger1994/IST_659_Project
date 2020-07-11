# Production R Files
library(RODBC)
library(dplyr)
library(ggplot2)


# connect to the sql database
myconn <- odbcConnect("dbase64")

# ready the SQL select statement
query <-'select 
            company_name, 
            rating  
         from view_member_rev_movie_prod'

# extract data from graph
df <- sqlQuery(myconn,query)

# plot data
df %>%
  group_by(company_name) %>%
  summarize(rating = mean(rating),count = n()) %>%
  ggplot(aes(x = company_name, y = rating, fill = count)) +
  geom_bar(stat = "identity") +
  coord_flip() 