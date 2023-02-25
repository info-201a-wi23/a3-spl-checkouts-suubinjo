# value 1
average_book <- data_df %>% group_by(CheckoutMonth) %>% summarise(avg=mean(Checkouts))
max_average <- average_book %>%filter(avg==max(avg,na.rm = TRUE)) %>% pull(CheckoutMonth)
max_average 

# value 2
min_average <- average_book %>%filter(avg==min(avg,na.rm = TRUE)) %>% pull(CheckoutMonth)
min_average

# value 3
print_book <- data_df %>% filter(MaterialType=="BOOK") %>% group_by(CheckoutYear,CheckoutMonth)%>% summarise(Checkouts=sum(Checkouts, na.rm = TRUE))

# value 4
max_title <- data_df %>%filter(Checkouts==max(Checkouts,na.rm = TRUE)) %>% pull(Title)
max_title

# value 5
publisher_book <- data_df %>% group_by(Publisher) %>% summarise(Checkouts=sum(Checkouts, na.rm = TRUE))
max_publisher <- publisher_book%>%filter(Checkouts==max(Checkouts,na.rm = TRUE)) %>% pull(Publisher)
max_publisher

