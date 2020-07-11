# import libaries
library(RODBC)
library(dplyr)
library(ggplot2)

# setup statement
statement <-' select * from view_member_movie_genre'

# extract table 1
df <- sqlQuery(myconn,statement)

# add factored gender column
df$gender <- factor(df$MyDescription)


# create bar chart of ratings associated with genre and count
df %>%
  group_by(genre_name) %>%
  summarize(rating = mean(rating),count = n()) %>%
  arrange(rating) %>%
  ggplot(aes(x = genre_name, y = rating, fill = count)) +
  geom_bar(stat = "identity") +
  labs(x = "Genre",y='Rating')+
  ggtitle('Ratings by  Genre') +
  coord_flip() 


# create bar chart for ratings associated to the movie
df %>%
  group_by(movie_title) %>%
  summarize(rating = mean(rating),count = n()) %>%
  arrange(rating) %>%
  ggplot(aes(x = movie_title, y = rating, fill = count)) +
  geom_bar(stat = "identity") +
  labs(x = "Movie",y='Ratings')+
  ggtitle('Ratings by  Movie') +
  coord_flip() 

# obtain ratings by genre and gender
df %>%
  group_by(movie_title,gender,colour = gender) %>%
  summarize(rating = mean(rating),count = n()) %>%
  ggplot(aes(x = movie_title, y = rating, fill = gender)) +
  geom_bar(stat = "identity",position = 'dodge') +
  labs(x = "Genre",y='Rating')+
  ggtitle('Ratings by  Genre & Gender') +
  coord_flip() 


# obtain ratings by gender
df %>%
  group_by(gender,colour = gender) %>%
  summarize(rating = mean(rating),count = n()) %>%
  ggplot(aes(x = gender, y = rating, fill = count)) +
  geom_bar(stat = "identity",position = 'dodge') +
  labs(x = "Gender",y='Rating')+
  ggtitle('Ratings by Gender') +
  coord_flip() 
