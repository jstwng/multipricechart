tickers = c("AAPL", "NFLX", "AMZN", "K", "O", "MSFT")

prices <- tq_get(tickers,
                 from = "2017-01-01",
                 to = "2018-03-01",
                 get = "stock.prices")

library(tidyquant)
library(quantmod)
library(ggplot2)
prices %>%
  ggplot(aes(x = date, y = adjusted, color = symbol)) +
  geom_line() +
  facet_wrap(~symbol,scales = 'free_y') +
  theme_classic() +
  labs(x = 'Date',
       y = "Adjusted Price",
       title = "Price Chart") +
  scale_x_date(date_breaks = "month",
               date_labels = "%b\n%y")

