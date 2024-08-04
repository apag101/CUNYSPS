library(ggplot2)
library(dplyr)
library(plotly)
library(shiny)

cdc<-read.csv("cleaned-cdc-mortality-1999-2010-2.csv")


ui1 <- fluidPage(
  headerPanel('Crude Mortality Rate'),
  sidebarPanel(
    selectInput('ICD.Chapter', 'Mortality', unique(cdc$ICD.Chapter)),
    selectInput('State', 'State', unique(cdc$State))
    
  ),
  mainPanel(
    plotlyOutput('plot2'),
    verbatimTextOutput('stats')
  )
)

server1 <- function(input, output, session) {
  
  selectedData <- reactive({
    cdcSlice <- cdc %>%
      filter(ICD.Chapter == input$ICD.Chapter, State == input$State)
  })

  
  output$plot2 <- renderPlotly({
    
    cdcSlice <- cdc %>%
      filter(ICD.Chapter == input$ICD.Chapter, State == input$State)%>%
      group_by(Year)%>%
      mutate(pop=sum(as.integer(Population)),DeathRate= Deaths*1000/pop)
    
    #plot_ly(cdcSlice, x = ~Year, y = ~DeathRate, type='scatter',size = ~DeathRate)
    require(plotly)
    p <- ggplot(cdcSlice, aes(Year, DeathRate, color = State))+
      geom_point(aes(size = DeathRate, frame = Year, ids = State))+
      scale_fill_continuous()+
      labs(color = "State", x = "Years", y = "DeathRate % Per Year")+
      geom_line()
    
    p <- ggplotly(p) %>%
      animation_opts(2000, easing = "elastic", redraw = TRUE, mode = "immediate")%>%
      add_annotations(
        yref="paper", 
        xref="paper", 
        y=1.1, 
        x=0, 
        text="Death Rate Percent Per Year", 
        showarrow=F, 
        font=list(size=17)
      ) %>% 
      layout(title=FALSE)
    p

  })

  output$stats <- renderPrint({
    cdcSliceTier <- selectedData() 
    
    summary(cdcSliceTier$Crude.Rate)
    
  })
  
}
shinyApp(ui = ui1, server = server1)