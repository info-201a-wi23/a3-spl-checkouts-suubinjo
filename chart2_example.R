library("stringr")
library("dplyr")

romance_books <- data_df %>% filter(str_detect(Subjects, "Romance"))
romance_books2 <- romance_books %>% mutate(type = rep("Romance",time=length(romance_books$Subjects)))

thriller_books <- data_df%>% filter(str_detect(Subjects, "Thriller"))
thriller_books2 <- thriller_books %>% mutate(type = rep("Thriller",time=length(thriller_books$Subjects)))


romance_thriller <- rbind(romance_books2, thriller_books2)

checkouts_book <- romance_thriller %>% group_by(type,CheckoutMonth) %>% filter(CheckoutYear==2022) %>% summarise(Checkouts=sum(Checkouts, na.rm = TRUE))

library(ggplot2)
library("scales")
ggplot(data=checkouts_book) +
  geom_col(aes(x=CheckoutMonth, y=Checkouts, fill=type))+ scale_y_continuous(labels = label_number_si())+ scale_x_continuous(breaks =seq(1,12,1))+labs(title = "Romance vs Thriller in 2022", x = "Months", y = "Total Checkouts",fill="Genre")
