library(ggplot2)
library(dplyr)
library(plotly)
library(shiny)

cdc<-read.csv(".\\data\\cleaned-cdc-mortality-1999-2010-2.csv")


ui1 <- fluidPage(
  headerPanel('Crude Mortality Rate'),
  sidebarPanel(
    selectInput('ICD.Chapter', 'Mortality', unique(cdc$ICD.Chapter)),
    selectInput('State', 'State', unique(cdc$State))
    
  ),
  mainPanel(
    plotlyOutput('plot1'),
    plotlyOutput('plot2'),
    verbatimTextOutput('stats')
  )
)

server1 <- function(input, output, session) {
  
  selectedData <- reactive({
    cdcSlice <- cdc %>%
      filter(ICD.Chapter == input$ICD.Chapter, State == input$State)
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
      labs(color = "State", x = "Years", y = "DeathRate %Change/Year")+
      geom_line()
    
    p <- ggplotly(p) %>%
      animation_opts(2000, easing = "elastic", redraw = TRUE, mode = "immediate")%>%
      add_annotations(
        yref="paper", 
        xref="paper", 
        y=1.1, 
        x=0, 
        text="Death Rate Percent Change Per Year", 
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