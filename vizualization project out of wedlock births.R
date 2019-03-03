#Visualization Project for DS 745
#little script to create skills bar chart for resume
install.packages("extrafont")
#library(extrafont)
#vis 2
birthData <- read.csv(file = "C:/Users/sawitri.schultz/Desktop/pro1.csv",header = TRUE, sep = ",",row.names = 1,check.names = F)
attach(birthData)
#transpose the data
tBirthData <- t(birthData)
tBirthData <- as.data.frame(tBirthData)
attach(tBirthData)
caucasian <- tBirthData[,1]
xRange <- range(row.names(tBirthData))
yRange <- range(0,90)
yr <- seq(0,75,3)
x <- seq(1990,2015,1)
plot(x,yr,lwd = 2,ylim = c(0,80), col= 'black',xlim = c(1990,2015),
     type = 'n', ylab = "% Births Out of Wedlock",
     main = "Percent of Births Born Out of Wedlock By Race",xlab = 'Year')

lines(x,`African American`,col = "red")
lines(x,Hispanic,col="orange", type = 'l',lwd = 2)
lines(x,caucasian,col="blue",type = 'l',lwd = 2)
lines(x,Asian,col = "aquamarine2", type = 'l',lwd = 2)
lines(x,`American Indian`,col="bisque3")

legend("top",
  legend = c("Asian","White","Hispanic","American Indian","African American"),
  bty = 'n',cex = .6,text.col  = c("aquamarine2","blue","orange","bisque3","red"),
  horiz = TRUE
)
################################
#vis 3

library(plotly)
x <- seq(1990,2015,1)


data <- data.frame(x,Asian,caucasian,`African American`,Hispanic,`American Indian`)

xaxis <- list(title = "",
              showline = TRUE,
              showgrid = FALSE,
              showticklabels = TRUE,
              linecolor = 'rgb(204, 204, 204)',
              linewidth = 2,
              autotick = FALSE,
              ticks = 'outside',
              tickcolor = 'rgb(204, 204, 204)',
              tickwidth = 2,
              ticklen = 5,
              tickfont = list(family = 'Arial',
                              size = 12,
                              color = 'rgb(82, 82, 82)'))

yaxis <- list(title = "",
              showgrid = FALSE,
              zeroline = FALSE,
              showline = FALSE,
              showticklabels = FALSE)

margin <- list(autoexpand = TRUE,
               l = 150,
               r = 150,
               t = 100)

# Build the annotations

african_american_1 <- list(
  xref = 'paper',
  yref = 'y',
  x = 0.05,
  y = `African American`[1],
  xanchor = 'right',
  yanchor = 'middle',
  text = ~paste('Black Births', `African American`[1], '%'),
  font = list(family = 'Arial',
              size = 12,
              color = 'rgba(67,67,67,1)'),
  showarrow = FALSE)


am_ind1 <- list(
  xref = 'paper',
  yref = 'y',
  x = 0.05,
  y = `American Indian`[1],
  xanchor = 'right',
  yanchor = 'middle',
  text = ~paste('Am. Indian Births', `American Indian`[1], '%'),
  font = list(family = 'Arial',
              size = 12,
              color = 'rgba(67,67,67,1)'),
  showarrow = FALSE)

hispanic_1<- list(
  xref = 'paper',
  yref = 'y',
  x = 0.05,
  y = `Hispanic`[1],
  xanchor = 'right',
  yanchor = 'middle',
  text = ~paste('Hispanic Births', Hispanic[1], '%'),
  font = list(family = 'Arial',
              size = 12,
              color = 'rgba(67,67,67,1)'),
  showarrow = FALSE)

asian_1 <- list(
  xref = 'paper',
  yref = 'y',
  x = 0.05,
  y = `Asian`[1],
  xanchor = 'right',
  yanchor = 'middle',
  text = ~paste('Asian Births', `Asian`[1], '%'),
  font = list(family = 'Arial',
              size = 12,
              color = 'rgba(67,67,67,1)'),
  showarrow = FALSE)

white_1 <- list(
  xref = 'paper',
  yref = 'y',
  x = 0.05,
  y = caucasian[1],
  xanchor = 'right',
  yanchor = 'middle',
  text = ~paste('White Births', caucasian[1], '%'),
  font = list(family = 'Arial',
              size = 12,
              color = 'rgba(67,67,67,1)'),
  showarrow = FALSE)

af_american_2 <- list(
  xref = 'paper',
  x = 0.95,
  y = `African American`[26],
  xanchor = 'left',
  yanchor = 'middle',
  text = paste(`African American`[26], '%'),
  font = list(family = 'Arial',
              size = 12,
              color = 'rgba(67,67,67,1)'),
  showarrow = FALSE)

am_ind2 <- list(
  xref = 'paper',
  x = 0.95,
  y = `American Indian`[26],
  xanchor = 'left',
  yanchor = 'middle',
  text = paste(`American Indian`[26], '%'),
  font = list(family = 'Arial',
              size = 12,
              color = 'rgba(67,67,67,1)'),
  showarrow = FALSE)

his_2 <- list(
  xref = 'paper',
  x = 0.95,
  y = `Hispanic`[26],
  xanchor = 'left',
  yanchor = 'middle',
  text = paste(Hispanic[26], '%'),
  font = list(family = 'Arial',
              size = 12,
              color = 'rgba(67,67,67,1)'),
  showarrow = FALSE)


asian_2<- list(
  xref = 'paper',
  x = 0.95,
  y = `Asian`[26],
  xanchor = 'left',
  yanchor = 'middle',
  text = paste(`Asian`[26], '%'),
  font = list(family = 'Arial',
              size = 12,
              color = 'rgba(67,67,67,1)'),
  showarrow = FALSE)

white_2<- list(
  xref = 'paper',
  x = 0.95,
  y = caucasian[26],
  xanchor = 'left',
  yanchor = 'middle',
  text = paste( caucasian[26], '%'),
  font = list(family = 'Arial',
              size = 12,
              color = 'rgba(67,67,67,1)'),
  showarrow = FALSE)

p <- plot_ly(data, x = ~x) %>%
  add_trace(y = ~`African American`, type = 'scatter', mode = 'lines', line = list(color = 'rgba(199,72,4,1)', width = 4))  %>%
  add_trace(y = ~Hispanic, type = 'scatter', mode = 'lines', line = list(color = 'rgba(255,119,0,1)', width = 4)) %>%
  add_trace(y = ~`American Indian`, type = 'scatter', mode = 'lines', line = list(color = 'rgba(226,119,41,1)', width = 4)) %>%
  add_trace(y = ~caucasian, type = 'scatter', mode = 'lines', line = list(color = 'rgba(238, 148, 32, 0.8)', width = 4)) %>%
  add_trace(y = ~Asian, type = 'scatter', mode = 'lines', line = list(color = 'rgba(249, 186, 128, 0.8)', width = 4)) %>%
  #this makes the endpoints
  add_trace(x = ~c(x[1], x[26]), y = ~c(`African American`[1], `African American`[26]), type = 'scatter', mode = 'markers', marker = list(color = 'rgba(199,72,4,1)', size = 8)) %>%
  add_trace(x = ~c(x[1], x[26]), y = ~c(`American Indian`[1], `American Indian`[26]), type = 'scatter', mode = 'markers', marker = list(color = 'rgba(226,119,41,1)', size = 8)) %>%
  add_trace(x = ~c(x[1], x[26]), y = ~c(Hispanic[1], Hispanic[26]), type = 'scatter', mode = 'markers', marker = list(color = 'rgba(255,119,0,1)', size = 8)) %>%
  add_trace(x = ~c(x[1], x[26]), y = ~c(caucasian[1], caucasian[26]), type = 'scatter', mode = 'markers', marker = list(color = 'rgba(238, 148, 32, 0.8)', size = 8)) %>%
  add_trace(x = ~c(x[1], x[26]), y = ~c(Asian[1], Asian[26]), type = 'scatter', mode = 'markers', marker = list(color = 'rgba(249, 208, 133,1)', size = 8)) %>%
  layout(title = "Percentage of Births From Unmarried Mothers By Race", xaxis = xaxis, yaxis = yaxis, margin = margin,
         autosize = FALSE,
         showlegend = FALSE,
         annotations = african_american_1) %>%
  layout(annotations = white_1) %>%
  layout(annotations = hispanic_1) %>%
  layout(annotations = am_ind1) %>%
  layout(annotations = asian_1) %>%
  layout(annotations = af_american_2) %>%
  layout(annotations = am_ind2) %>%
  layout(annotations = his_2) %>%
  layout(annotations = white_2) %>%
  layout(annotations = asian_2)



p