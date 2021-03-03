library(tidyverse)
library(shiny)
library(shinydashboard)
library(here)

homerange <- readr::read_csv(here("lab13", "data","Tamburelloetal_HomeRangeDatabase.csv"))

ui <- fluidPage(    
  
  titlePanel("Log 10 Homerange by Taxon"), 
  sidebarLayout(      
    sidebarPanel(
      selectInput("taxon", " Select Taxon of Interest:", choices=unique(homerange$taxon)),
      hr(),
      helpText("Reference: Tamburello N, Cote IM, Dulvy NK (2015) Energy and the scaling of animal space use. The American Naturalist 186(2):196-211.")
    ),
    mainPanel(
      plotOutput("taxonPlot")  
    )
  )
)

server <- function(input, output, session) {
  session$onSessionEnded(stopApp)
  output$taxonPlot <- renderPlot({
    homerange %>% 
      filter(taxon == input$taxon) %>% 
      ggplot(aes(x=log10.hra)) + 
      geom_density(color="black", fill="steelblue", alpha=0.6)
  })
}

shinyApp(ui, server)