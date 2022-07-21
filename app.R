
library(shiny)  # Required to run any Shiny app
library(ggplot2)  # For creating pretty plots
library(dplyr)  # For filtering and manipulating data
#library(agridat)  # The package where the data comes from

Data <- read.csv(".Data/dataLYLcom.csv")

ui <- fluidPage(
  #Header
  titlePanel(h3("Life-Years Lost Attributable To Air, Water and Earth Pollution in Asia and Pacfic Countries, 2000-2019")),
  tabsetPanel(
    tabPanel("The relationship of Life-years lost by different pollution",
             mainPanel(uiOutput(outputId="LYL_rep.img", width = "100%")))
    #mainPanel(plotOutput("p"), width = "100%"))
    
  ))

server <- function(input, output) {
  
  output$LYL_rep.img <-renderPlot({
    ggplot(Data, aes(x=Air.Pollution, y=Water.and.Earth.Pollution))+ 
    geom_point(aes(fill= Country, size=Year), shape=21, stroke=0.7)
    
    })
    
    }
  
shinyApp(ui = ui, server = server)
