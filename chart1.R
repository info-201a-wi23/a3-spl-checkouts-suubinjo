data_df <- read.csv("C:\\Users\\82106\\Desktop\\2022-2023-All-Checkouts-SPL-Data.csv",stringsAsFactors = FALSE)

data_usage <- data_df  %>% filter(CheckoutYear==2022) %>% group_by(UsageClass,CheckoutMonth) %>% summarise(Checkouts=sum(Checkouts, na.rm = TRUE))

x_values <- seq(1, 3)
y_values <- seq(1,3)

library(dplyr)
library(ggplot2)
ggplot(data=data_usage) +
  geom_line(aes(x=CheckoutMonth, y=Checkouts, color=UsageClass))+labs(title = "The number of Checkouts of each Usage Class in 2022", x = "Months", y = "Total Checkouts", color="Usage")+ scale_x_continuous(breaks =seq(1,12,1))
