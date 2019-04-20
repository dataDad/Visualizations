##ds 735 visualization for project 3
#html publish = https://rpubs.com/dataDad84/488707

install.packages("ggplot2")
install.packages("plotly")
library(ggplot2)
library(plotly)

countryData <- read.csv("gdp.1.csv",header = TRUE)

p <- ggplot(countryData,aes(GDP,Life_Expectancy,color=continent))+
  labs(title = 'Life Expectancy vs GDP Over Time', y = "Life Expectancy",subtitle = 'source = ' ) +
  geom_point(aes(size=pop,frame=year,ids=country)) 


#sources
#Source = https://raw.githubusercontent.com/OHI-Science/data-science-training/master/data/gapminder.csv 

p <- ggplotly(p) %>% 
  animation_opts(
    1000, redraw = FALSE
  ) %>% 
  animation_slider(
    currentvalue = list(prefix = "YEAR ", font = list(color="seagreen"))
  )

p

x <- ggplot(countryData,aes(GDP,Life_Expectancy,color=continent)) +
  geom_point(aes(size= pop,frame = year, ids = country))
ggplotly(x)