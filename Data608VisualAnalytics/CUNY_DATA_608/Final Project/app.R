library(ggplot2)
library(dplyr)
library(plotly)
library(shiny)
library(lattice)
library(leaflet) 
library(widgetframe)
library(broom)
library(arsenal)
library(broomExtra)

cdc<-read.csv("https://raw.githubusercontent.com/apag101/CUNYSPS/master/schooldataupdated.csv")
colcdc<-as.data.frame(cbind(colp=colnames(cdc[24:33]),colr=colnames(cdc[24:33])))


ui1 <- fluidPage(
  headerPanel('NYC School Analysis 2011-2012'),
  sidebarPanel(
    
    selectInput('colp','Predictor',colcdc$colp),
    selectInput('colr','Response',colcdc$colr)
    
  ),
  mainPanel(
    tabsetPanel(type = "tabs",
    tabPanel("Linear",plotlyOutput('plot1')),
    tabPanel("Density",plotlyOutput('plot2')),
    tabPanel("Histogram",plotlyOutput('plot3')),
    tabPanel("GLM Summary",tableOutput('stats')),
    tabPanel("Table>80% Grad/Attend Coll", tableOutput("table")),
    tabPanel("Map>80% Grad/Attend Coll",leafletOutput("mymap"))
    )
  )
  
)

server1 <- function(input, output, session) {
  
  selectedData <- reactive({
    cdcSlice <- colcdc %>%
      filter(colp == input$colp, colr == input$colr)
  })
  
  output$plot1 <- renderPlotly({
    
    
    g<-ggplot(data=cdc, aes(x=cdc[,names(cdc) %in% input$colp], y=cdc[,names(cdc) %in% input$colr], color = sprtcode)) +
      geom_point() +stat_smooth(method="lm", se=TRUE) +labs(y=input$colr, x=input$colp)
    ggplotly(g)
  })
  
  output$plot2 <- renderPlotly({
    
   # p <- xyplot(cdc[,names(cdc) %in% input$colp] ~ cdc[,names(cdc) %in% input$colr] | sprtcode,cdc, type="l")

    p <-qplot(cdc[,names(cdc) %in% input$colr], data = cdc, geom = "density",fill = cdc[,names(cdc) %in% input$colp])+labs(y=input$colr, x=input$colp)
    ggplotly(p)
  })

  
  output$plot3 <- renderPlotly({
    
    # p <- xyplot(cdc[,names(cdc) %in% input$colp] ~ cdc[,names(cdc) %in% input$colr] | sprtcode,cdc, type="l")
    
    p <-qplot(cdc[,names(cdc) %in% input$colr], data = cdc, geom = "histogram",fill = sprtcode)+facet_wrap(~ sprtcode)+labs(y=input$colr, x=input$colp)
    ggplotly(p)
     })
  
  cdc80<-subset(cdc,grad2011 > 80|grad2012>80|collenroll2012>80|collenroll2011>80)
  
  output$mymap <- renderLeaflet({
      content <- paste(sep = "<br/>",
                       "------------------------------",
                       '<b>School Information:</>', 
                       cdc80$Printed_Name,
                       cdc80$Boro,
                       cdc80$Location,
                       "------------------------------",
                       '<b>Total Students:</>',
                       cdc80$TotStudnts,
                       "------------------------------",
                       '<b>Sports:</>',
                       cdc80$Sports,
                       "------------------------------",
                       '<b>Language Classes</>',
                       cdc80$LangClass,
                       "------------------------------",
                       '<b>AP Courses</>',
                       cdc80$APCourses,
                       "------------------------------",
                       '<b>Leader Support</>',
                       cdc80$LeaderSupport)
      
      df = data.frame(Lat = cdc80$lat, Long = cdc80$lon)
      
      m <- leaflet(df, width = 900, height = 900) %>% 
        setView(lng = cdc80$lon[nrow(cdc80)], lat = cdc80$lat[nrow(cdc80)], zoom = 11)
      m %>% 
        addTiles() %>% 
        addProviderTiles(providers$Stamen.TonerLite,
                         options = providerTileOptions(noWrap = TRUE)
        )%>%
        addMarkers(clusterOptions = markerClusterOptions(),cdc80$lon, cdc80$lat, popup = paste(sep = "<br/>", content))
  })
  
  output$stats <- renderTable({
    cdcSliceTier <- selectedData() 
    
 g<- glm(cdc$sprtcode~cdc[,names(cdc) %in% input$colr]|cdc[,names(cdc) %in% input$colp],family='binomial')

#as.list(glance(g))
as.list(c(tidy(g),glance(g)))
#as.list()
  })
  
  output$table <- renderTable({
  cdc80
  })
  
}
shinyApp(ui = ui1, server = server1)


