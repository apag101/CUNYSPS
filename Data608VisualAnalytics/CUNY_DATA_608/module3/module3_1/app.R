library(ggplot2)
library(dplyr)
library(plotly)
library(shiny)

cdc<-read.csv("cleaned-cdc-mortality-1999-2010-2.csv")


ui1 <- fluidPage(
  headerPanel('Crude Mortality Rate 2010'),
  sidebarPanel(
    selectInput('ICD.Chapter', 'Mortality', unique(cdc$ICD.Chapter))
    
  ),
  mainPanel(
    plotlyOutput('plot1'),
    verbatimTextOutput('stats')
  )
)

server1 <- function(input, output, session) {
  
  selectedData <- reactive({
    cdcSlice <- cdc %>%
      filter(ICD.Chapter == input$ICD.Chapter)
  })
  
  output$plot1 <- renderPlotly({
    
    cdcSlice <- cdc %>%
      filter(ICD.Chapter == input$ICD.Chapter, Year == 2010)
    
    g<-ggplot(data= cdcSlice) +
      geom_point(mapping = aes(x = reorder(State, -Crude.Rate), y = Crude.Rate, fill= State , size = Crude.Rate), 
                 stat = "identity", position = "identity")+
      theme(axis.text.x=element_text(angle=90))+
      labs(y="Crude Rate for 2010", x="All States")
    g+ scale_fill_discrete(guide = guide_legend(reverse=TRUE))
    ggplotly(g)
  })


  output$stats <- renderPrint({
    cdcSliceTier <- selectedData() 
    
    summary(cdcSliceTier$Crude.Rate)
    
  })
  
}
shinyApp(ui = ui1, server = server1)