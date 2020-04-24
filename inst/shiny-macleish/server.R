#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(tidyverse)
library(RMySQL)
library(etl)
library(leaflet)
library(RSQLite)
library(ceeds)
library(macleish)
library(lubridate)
library(shinydashboard)
library(shiny)
library(highcharter)
library(timetk)
library(kableExtra)
library(plotly)
# Define server logic required to draw a histogram
shinyServer(function(input, output,session) {
   

  mac_data <- ceeds::read_whately()
  whately <- purrr::pluck(mac_data, "whately")
  orchard <- purrr::pluck(mac_data, "orchard")
  WhatelyMet <- ceeds::get_daily(whately)
  WhatelyMet <- ceeds::get_daily(whately)
  daily_whately <- WhatelyMet
  OrchardMet <- ceeds::get_daily(orchard)
  daily_orchard <- OrchardMet
  daily_orchard2 <- daily_orchard
  daily_whately2 <- daily_whately
  data_sets <- c("daily_orchard", "daily_whately")
  # defining outputs
  # output$name <- name = highchartOutput("name")
  output$cw <- renderTable({
    current;
  })
  datasetInput <- reactive({
    switch(input$dataset,
           "WhatelyMet" = daily_whately,
           "OrchardMet" = daily_orchard)
  })
  output$hc1 <- renderHighchart({
    highchart(type = "stock") %>%
      hc_add_series(datasetInput(),type = "line", hcaes(y = avgTemp, x = the_date), 
                    name = "Avg temperature") %>%
      hc_add_series(datasetInput(),type = "line", hcaes(y = mintemp, x = the_date), 
                    name = "min temperature") %>%
      hc_add_series(datasetInput(),type = "line", hcaes(y = maxtemp, x = the_date), 
                    name = "max temperature") %>%
      hc_exporting(enabled = TRUE) # enable exporting option 
  })
  output$hc2 <- renderHighchart({highchart(type = "stock") %>%
      hc_add_series(datasetInput(),type = "bar", hcaes(y = precipitation, 
                                                       x = the_date), name = "precipitation") %>%
      hc_exporting(enabled = TRUE)})
  
  output$hc3 <- renderHighchart({highchart(type = "stock") %>%
      hc_add_series(datasetInput(),type = "line", hcaes(y = maxwind, x = the_date)
                    , name = "Max Wind") %>%
      hc_exporting(enabled = TRUE)})
  
  # ggplot2
  output$hc4 <- renderPlot({
    x<-input$bins
    bins <- seq(min(datasetInput()$avgWindSpeed), max(datasetInput()$avgWindSpeed), length.out = input$bins)
    dirbins <- seq(min(datasetInput()$dir), max(datasetInput()$dir), length.out = input$bins)
    ggplot(data = ceeds::get_lastyear(datasetInput()), aes(x = cut(dir,8) , fill = cut(maxwind,x))) +
      geom_bar() + 
      scale_x_discrete(name="Wind Direction",drop = FALSE, labels =c("N","NE","E","SE","S","SW","W", "NW")) +
      coord_polar(start = -((30/1.5)/360) *(2*pi)) +
      scale_fill_discrete(name = "Wind Speed (m/s)") 
  })
  
  output$plot1 <- renderPlotly({
    ggplotly(ggplot(data = datasetInput(), aes_string(x =input$xcol, y = input$ycol)) +
               geom_point(color = "green", alpha = 0.3)) 
  })
  output$fast_stats <- renderTable({
    x<-as.character(input$v)
    data <-  datasetInput() %>%
      filter(the_date >= ymd(as.character(input$start1)), 
             the_date <=ymd(as.character(input$end1)))
    data2 <-  data[, input$v, drop = FALSE] 
    stats<-skimr::skim(data2) 
    stats
    
  })
  # Pre-check algorithms
  # Checking if there is any outlier on maxtemp 
  are_any_bad_maxtemp <- function(.data) {
    any(.data$maxtemp > 40) }
  
  # Checking if there is any outlier on mintemp
  are_any_bad_mintemp <- function(.data) {
    any(.data$mintemp < -40) }
  
  # Checking if there is any outlier on dir
  are_any_bad_dir <- function(.data) {
    any(360 < .data$dir | x$dir < 0) }
  
  # Checking if there is any outlier on humidity
  are_any_bad_humidity <- function(.data){
    any(100 < .data$avghumidity | .data$avghumidity < 20)
  }
  
  precheck <- function(x){
    if(are_any_bad_maxtemp(x)== TRUE)
      print("bad maxtemp")
    else if(are_any_bad_dir(x)== TRUE)
      print("bad dir")
    else print("passed")
  }

    
  show_me_bad_maxtemp <- function(.data) {
    .data %>%
      filter(maxtemp > 40 )}
  
  show_me_bad_mintemp <- function(.data) {
    .data %>%
      filter(mintemp < -40)
  }
  
  show_me_bad_dir <- function(.data) {
    .data %>%
      filter(dir < 0 | dir > 360)
  }
  
  show_me_bad_humidity <- function(.data) {
    .data %>%
      filter(avghumidity < 100 | avghumidity <20 )
  }
  
  # download raw data 
  output$choose_dataset <- renderUI({
    selectInput("dataset2", "Data set", as.list(data_sets))
  })
  datasetInput2 <- reactive({
    switch(input$dataset2,
           "WhatelyMet" = daily_whately2,
           "OrchardMet" = daily_orchard2)
  })
  output$choose_columns <- renderUI({
    # If missing input, return to avoid error later in function
    if (is.null(input$dataset2))
      return()
    
    # Get the data set with the appropriate name
    data1 <-  datasetInput2()
    colnames <- names(data1)
    
    # Create the checkboxes and select them all by default
    checkboxGroupInput("columns", "Choose columns", 
                       choices  = colnames,
                       selected = colnames)
  })
  output$data_table <- DT::renderDataTable({
    if(is.null(input$dataset))
      return()
    if (is.null(input$columns) || !(input$columns %in% names(datasetInput2())))
      return()
    
    # Keep the selected columns
    data1 <-  datasetInput2()[, input$columns, drop = FALSE]
    data1<-data1 %>%
      filter(the_date >= ymd(as.character(input$start)), 
             the_date <=ymd(as.character(input$end)))
    
    data1
  })
  
  output$downloadData <- downloadHandler(
    filename = function() { 
      paste('Weather', '.csv', sep='') },
    content = function(file) {
      write.csv( datasetInput2()[, input$columns, drop = FALSE]%>%
                   filter(the_date >= ymd(as.character(input$start)), 
                          the_date <=ymd(as.character(input$end)))
                 , file)
    })
  
  # we want to switch tabs so we need to refresh session
  # observeEvent allows reactive input and allows us to switch tabs
  observeEvent(input$switchtab, {
    newtab <- switch(input$tabs, 
                     "About" = "Raw data", "Raw data"="About","About"="Current Weather", "Current Weather"="About", "About"="Historic Data", "Historic Data"="About",
                     "Raw data"="Current Weather","Current Weather"="Raw data","Raw data"="Historic Data",
                     "Historic Data"="Raw data","Historic Data"="Current Weather",
                     "Current Weather"="Historic Data")
    #update tab items 
    updateTabItems(session, "tabs", newtab)
  })
 
  
})

