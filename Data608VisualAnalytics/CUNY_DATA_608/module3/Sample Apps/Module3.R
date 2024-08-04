library(ggplot2)
library(dplyr)
library(plotly)
library(shiny)

cdc<-read.csv(".\\data\\cleaned-cdc-mortality-1999-2010-2.csv")

ui <- fluidPage(
  headerPanel('Crude Mortality Rate for All States in 2010'),
  sidebarPanel(
    selectInput('ICD.Chapter', 'Crude Mortality', unique(cdc$ICD.Chapter), selected='Neoplasms	AL	2010	10429	4779736	218.2
'),
    selectInput('State', 'State', unique(cdc$State), selected='NY'),
  ),
  mainPanel(
    plotlyOutput('plot1'),
    verbatimTextOutput('stats')
  )
)

server <- function(input, output, session) {
  
  selectedData <- reactive({
    dfSlice <- cdc %>%
      filter(Seasonality == input$seas, Metro == input$metro)
  })
  
  output$plot1 <- renderPlotly({
    
    dfSlice <- cdc %>%
      filter(Year == 2010)
    
    plot_ly(selectedData(), x = ~State, y = ~Crude.Rate, type='scatter',
            mode = 'lines')
  })
  
  output$stats <- renderPrint({
    dfSliceTier <- selectedData() %>%
      filter(Tier == input$tier)
    
    summary(dfSliceTier$HPI)
  })
  
}

shinyApp(ui = ui, server = server)