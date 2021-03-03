library("shiny")
library("shinydashboard")

ui <- dashboardPage(
  dashboardHeader(title = "Relative Abundance"),
  dashboardSidebar(disable = T),
  dashboardBody(
    fluidRow(
      box(title = "Plot Options", width = 3,
          selectInput("x", "Select RA Taxon", choices = c("RA_Apes", "RA_Birds", "RA_Elephant", "RA_Monkeys", "RA_Rodent", "RA_Ungulate"), 
                      selected = "RA_Apes"),
          hr(),
          helpText("Reference: Koerner SE, Poulsen JR, Blanchard EJ, Okouyi J, Clark CJ. Vertebrate community composition and diversity declines along a defaunation gradient radiating from rural villages in Gabon. Journal of Applied Ecology. 2016.")
      ), # close the first box
      box(title = "Relative Abundance %", width = 6,
          plotOutput("plot", width = "600px", height = "500px")
      ) # close the second box
    ) # close the row
  ) # close the dashboard body
) # close the ui

server <- function(input, output, session) { 
  
  output$plot <- renderPlot({
    gabon %>% 
      ggplot(aes_string(x = "Distance", y = input$x)) +
      geom_point(size=4)+
      geom_smooth(method=lm, se=T)+
      scale_x_continuous(breaks=seq(0, 30, by = 5))+ theme_light(base_size = 18)
  })
  
  # stop the app when we close it
  session$onSessionEnded(stopApp)
}

shinyApp(ui, server)