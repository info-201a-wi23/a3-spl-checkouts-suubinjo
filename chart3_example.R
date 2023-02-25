x_values <- seq(1, 3)
y_values <- seq(1,3)

type_book <- data_df %>% filter(MaterialType %in% c("BOOK","EBOOK","AUDIOBOOK","SOUNDDISC"))
type_book2 <-type_book %>% group_by(MaterialType) %>% summarise(Checkouts=sum(Checkouts, na.rm = TRUE))

library(ggplot2)
library("scales")
ggplot(data=type_book2) +
  geom_col(aes(x=MaterialType, y =Checkouts,fill=MaterialType))+labs(title = "The number of Checkouts of each Material Type", x = "Material Types", y = "Total Checkouts",fill="Types")+ scale_y_continuous(labels = label_number_si())
