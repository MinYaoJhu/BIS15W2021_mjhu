library(tidyverse)
library(shiny)
library(shinydashboard)
library(naniar)

UC_admit <- readr::read_csv("data/UC_admit.csv")

UC_admit <- UC_admit %>% 
  filter(Ethnicity!="All")

UC_admit$Academic_Yr <- as.factor(UC_admit$Academic_Yr)

ui <- dashboardPage(
  dashboardHeader(title = "Admissions by ethnicity across all UC campuses"),
  dashboardSidebar(disable = T),
  dashboardBody(
    fluidRow(
      box(title = "Plot Options", width = 3,
          radioButtons("x", "Select Ethnicity", 
                       choices = c("International", "Unknown", "White", "Asian", "Chicano/Latino", "American Indian", "African American"), 
                       selected = "International"),
          radioButtons("y", "Select Campus", 
                       choices = c("Davis", "Irvine", "Berkeley", "Irvine", "Los_Angeles", "Merced", "Riverside", "San_Diego", "Santa_Barbara", "Santa_Cruz"), 
                       selected = "Davis"),
          selectInput("z", "Select Admit Category", choices = c("Applicants", "Admits", "Enrollees"), selected = "Applicants")
      ),
      box(title = "UC Admissions", width = 7,
          plotOutput("plot", width = "600px", height = "500px")
          
      )
    )
  )
)

server <- function(input, output, session) {
  output$plot <- renderPlot({
    UC_admit %>% 
      filter(Ethnicity==input$x & Campus==input$y & Category==input$z) %>% 
      ggplot(aes(x=Academic_Yr, y=FilteredCountFR, fill=FilteredCountFR))+
      geom_col(color="black", alpha=0.75)+
      theme_light(base_size = 18) +
      theme(axis.text.x = element_text(angle = 60, hjust = 1))+
      labs(x = "Year", y = "Number")
    
  })
  session$onSessionEnded(stopApp)
}

shinyApp(ui, server)