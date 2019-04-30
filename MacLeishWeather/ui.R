#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#
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
library(kableExtra)
library(plotly)
#install.packages("skimr")
library(DT)
library(skimr)
library(shinydashboardPlus)
library(base64enc)
library(shiny)
mac_data <- read_whately()
whately <- purrr::pluck(mac_data, "whately")
orchard <- purrr::pluck(mac_data, "orchard")
daily_whately <- get_daily(whately)
daily_orchard <- get_daily(orchard)
last_whately <- get_lastyear(daily_whately)
#getting current weather data
current_w <- tail(whately, 1)
current_o <- tail(orchard,1)
# print(current[1,2])
b64 <- base64enc::dataURI(file= "height_comparison.png", mime="image/png")
b65 <- base64enc::dataURI(file= "paul.png", mime="image/png")
b66 <- base64enc::dataURI(file= "MacLeish.png", mime="image/png")

# Define UI for application that draws a histogram
shinyUI(dashboardPage(skin = "black",
              # making a heading for the dashboard
              dashboardHeader(title = "MacLeish Weather", 
                              dropdownMenu()),
              #making a sidebar with tabs
              dashboardSidebar(
                # making a sidebar menu
                sidebarMenu(
                  #making an id 
                  id = "tabs",
                  #creating menu items
                  menuItem("Current Weather", 
                           tabName = "current", 
                           icon = icon("seedling")),
                  menuItem("About", tabName = "about", 
                           icon = icon("newspaper")),
                  menuItem("Historic Data", 
                           tabName = "historic", 
                           icon = icon("bar-chart-o")),
                  menuItem("Download Data", 
                           tabName = "raw", 
                           icon = icon("table"))      
                )),
              # Drawing the dashboard body
              dashboardBody(
                # tab items 
                tabItems(
                  tabItem(tabName = "current", 
                          fluidPage(
                            tags$head(
                              tags$style(HTML('
                                              .main-header .logo {
                                              font-family: "Geneva";
                                              font-size: 20px;
                                              }
                                              
                                              '))
                              ),
                            gradientBox(
                              title = span("OrchardMet Station", style = "font-family: Geneva"),
                              icon = "fa fa-apple-alt",
                              gradientColor = "teal", 
                              boxToolSize = "sm", 
                              footer = 
                                " ",
                              h5("as of:", current_o$when, align = "center",
                                 style = "font-family: Geneva"),
                              p(current_o$temperature, "°C", 
                                style = "font-family: Geneva; font-size: 3em"),
                              h4("humidity  ", icon("tint"), br(),
                                 current_o$rel_humidity, "%", align = "right",
                                 style = "font-family: Geneva"), 
                              hr(style = "width: 40%; margin-top: 10px; margin-bottom: 10px", 
                                 align = "right"),
                              h4("pressure  ", icon("plane-departure"), br(),
                                 current_o$pressure, align = "right",
                                 style = "font-family: Geneva"), 
                              hr(style = "width: 40%; margin-top: 10px; margin-bottom: 10px", 
                                 align = "right"),
                              h4("precipitation ", icon("umbrella"), br(),
                                 current_o$rainfall, "mm", align = "right",
                                 style = "font-family: Geneva"), 
                              hr(style = "width: 40%; margin-top: 10px; margin-bottom: 10px", 
                                 align = "right"),
                              h4("wind", icon("cloud"), br(),
                                 current_o$wind_speed, "m/s", align = "right",
                                 style = "font-family: Geneva"),
                              collapsible = FALSE
                            ),
                            gradientBox(
                              title = span("WhatelyMet Station", style = "font-family: Geneva"),
                              icon = "fa fa-leaf",
                              gradientColor = "teal", 
                              boxToolSize = "sm",
                              footer =
                                " ",  
                              h5("as of:", current_w$when, align = "center",
                                 style = "font-family: Geneva"),
                              p(current_w$temperature, "°C",
                                style = "font-family: Geneva; font-size: 3em"),
                              h4("humidity  ", icon("tint"), br(),
                                 current_w$rel_humidity, "%", align = "right",
                                 style = "font-family: Geneva"), 
                              hr(style = "width:40%; margin-top: 10px; margin-bottom: 10px", 
                                 align = "right"),
                              h4("pressure  ", icon("plane-departure"), 
                                 br(),
                                 current_w$pressure, align = "right",
                                 style = "font-family: Geneva"), 
                              hr(style = "width:40%; margin-top: 10px; margin-bottom: 10px", 
                                 align = "right"),
                              h4("precipitation ", icon("umbrella"), br(),
                                 current_w$rainfall, "mm", align = "right",
                                 style = "font-family: Geneva"), 
                              hr(style = "width:40%; margin-top: 10px; margin-bottom: 10px", 
                                 align = "right"),
                              h4("wind", icon("cloud"), br(),
                                 current_w$wind_speed, "m/s", align = "right",
                                 style = "font-family: Geneva"),
                              collapsible = FALSE
                            )
                              )),
                  tabItem(tabName = "about", 
                          h1("Welcome to the MacLeish weather app!", align = "center", 
                             style = "font-family: Geneva"),
                          hr(),
                          p("Here you will find current weather, historical data (from 
                            January 2012 to present) and data you can download of the two 
                            weather stations at the MacLeish Field Station of Smith 
                            College.", style = "font-family: 'Geneva'; 
                            margin-left: 28%; margin-right: 28%"),
                          img(src=b66, height = 244, width = 279, 
                              style="display: block; margin-left: auto; margin-right: auto;" ),
                          br(),
                          p("The MacLeish Field Station weather collection sites are 
                            accessed at the end of Poplar Hill Road in Whately, 
                            Massachusetts, USA (Lat: 42 deg. 26 min. 56 sec. N Long: 72 deg.
                            40 min. 50 sec. W).", style = "font-family: 'Geneva';
                            margin-left: 28%; margin-right: 28%"),
                          p("Weather measurements are made at two locations at the MacLeish
                            field station. On the WhatelyMet tower, meteorological 
                            instruments (except the rain gauge) are mounted at the top of a 
                            tower 25.3 m tall, well above the surrounding forest canopy. 
                            Ground elevation is 250.8 m above sea level. OrchardMet is a 
                            standard, 10 m meteorological station, elevation 258 m above 
                            sea level. Temperature, relative humidity, and radiation are 
                            measured 2 m above the ground. The tower is located in a forest
                            clearing.", style = "font-family: 'Geneva'; margin-left: 28%;
                            margin-right: 28%"),
                          br(),
                          img(src=b64, height = 264, width = 345.4, 
                              style="display: block; margin-left: auto; margin-right: auto;"),
                          h4("height comparison between weather station towers, trees and 
                             people", align = "center", style = "font-family: 'Geneva; 
                             font-style: italic; font-size: 14px"),
                          p("We strive to make this data more accessible to those who can 
                            use it, from Smith College Statistical & Data Sciences students
                            who need large datasets to practice data visualization & data 
                            wrangling methods, to local researchers in the Pioneer Valley.",
                            style = "font-family: 'Geneva'; margin-left: 28%; 
                            margin-right: 28%"),
                          br(),
                          img(src=b65, height = 249, width = 322, 
                              style="display: block; margin-left: auto; margin-right: auto"),
                          h4("meet the weather station manager, Paul Wetzel of CEEDS ", 
                             align = "center", style = "font-family: 'Geneva; 
                             font-style: italic; font-size: 14px"),
                          p("All the data visualizations you see are interactive so feel 
                            free to click around and learn about your local weather!", 
                            style = "font-family: 'Geneva'; margin-left: 28%;
                            margin-right: 28%"),
                          br(),
                          p("Sincerely,", style = "font-family: 'Geneva'"),
                          p(a("Marta, Mirella, and Julia (SDS 410, spring 2019)",
                              href = "https://github.com/beanumber/ceeds"), 
                            style = "font-family: 'Geneva'"),
                          p(a("Paul R. Wetzel", href = "mailto: pwetzel@smith.edu"),
                            style = "font-family: 'Geneva'"
                          )
                          ),
                  tabItem(tabName = "historic", h2("Historic Data", align = "center"),
                          fluidPage(splitLayout(cellWidths = c("15%","16%","16%","16%","16%","16%")),
                                    box(selectInput("dataset", "Dataset", c("WhatelyMet", "OrchardMet")), width = 12),
                                    box(highchartOutput("hc2"), width = 12, collapsible = T, solidHeader = T, 
                                        title = "Precipitation (mm)",collapsed =T),
                                    box(highchartOutput("hc3"),width = 12,collapsible = T,solidHeader = T, 
                                        title = "MAX Wind Speed (m/s)", collapsed =T),
                                    box(highchartOutput("hc1"),width = 12, collapsible = T,solidHeader = T, 
                                        title = "Temperature (celsius)", collapsed =T),
                                    box(plotOutput("hc4"), width = 12,collapsible = T,solidHeader = T, 
                                        title = "Wind Direction of the Last Year", collapsed =T,
                                        sliderInput("bins",
                                                    "Number of bins:",
                                                    min = 4,
                                                    max = 15,
                                                    value = 7)
                                    ),
                                    box(plotlyOutput("plot1"), width = 12, collapsible = T,solidHeader = T, 
                                        collapsed =T,title = "Other Variables (correlation)", sidebarPanel(
                                          selectInput('xcol', 'X Variable', names(ceeds::get_daily(whately_2015))),
                                          selectInput('ycol', 'Y Variable', names(ceeds::get_daily(whately_2015))),
                                          selected=names(ceeds::get_daily(whately_2015))[[2]])),
                                    box(tableOutput("fast_stats"),width = 12,collapsible = T,solidHeader = T, 
                                        title = "Summary Statistics Table", collapsed =T, sidebarPanel(
                                          selectInput('v', 'Variable',names(ceeds::get_daily(whately_2015))),
                                          dateInput("start1",
                                                    "Start date:",
                                                    value = 2012-01-01,
                                                    format = "yyyy-mm-dd"),
                                          dateInput("end1",
                                                    "End date:",
                                                    value = now(),
                                                    format = "yyyy-mm-dd"))))),
                  tabItem(tabName = "raw", h2("Raw Data", align = "center"),
                          fluidPage(splitLayout(cellWidths = c("45%","55%"),
                                                box(sidebarPanel(
                                                  selectInput("dataset2", "Dataset", c("WhatelyMet", "OrchardMet")),
                                                  uiOutput("choose_columns"),
                                                  br(),
                                                  a(href = "https://gist.github.com/4211337", "Source code"),
                                                  downloadButton('downloadData', 'Download'),
                                                  width=12, dateInput("start",
                                                                      "Start date:",
                                                                      value = 2012-01-01,
                                                                      format = "yyyy-mm-dd"),
                                                  dateInput("end",
                                                            "End date:",
                                                            value = now(),
                                                            format = "yyyy-mm-dd")
                                                ),width=12),box(DT::dataTableOutput("data_table"), width = 24,collapsible = T,
                                                                solidHeader = T, title="Data table")))) 
                  
                          )#end tabItems
                          )#end body
              ))