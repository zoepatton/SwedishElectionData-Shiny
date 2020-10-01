library(shiny)
library(SwedishElectionData)

ui <- fluidPage(
  titlePanel("App for swedish election data"),
  sidebarLayout(
    sidebarPanel(
      selectInput(inputId = "level",
                  label = "Choose level:",
                  choices = c("riksdag", "landsting", "kommun")),
      
      selectInput(inputId = "type",
                  label = "Choose type:",
                  choices = c("valdistrikt", "kommun"))
    ),
    mainPanel(
      tableOutput("table")
    )
  )
)

server <- function(input, output){
  
    
  output$table <- renderTable(SwedishElectionData::election_data(input$level,input$type))

  
}

shiny::shinyApp(ui = ui,server = server)


