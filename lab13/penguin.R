library(shiny)

ui <- fluidPage(
  selectInput("x", "Select X Variable", choices = c("bill_length_mm", "bill_depth_mm", "flipper_length_mm", "body_mass_g"),
              selected = "bill_length_mm"),
  selectInput("y", "Select Y Variable", choices = c("bill_length_mm", "bill_depth_mm", "flipper_length_mm", "body_mass_g"),
              selected = "bill_depth_mm"),
  sliderInput("fontsize", "Select the Font Size", min = 10, max = 24, value = 18, step = 1),
  plotOutput("plot", width = "500px", height = "400px")
)

server <- function(input, output, session) {
  session$onSessionEnded(stopApp)
  output$plot <- renderPlot({
    ggplot(penguins, aes_string(x = input$x, y = input$y, color="species")) + geom_point() + theme_light(base_size = input$fontsize)
  })
}

shinyApp(ui, server)