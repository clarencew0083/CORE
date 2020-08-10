ui <- fluidPage(title = 'Core App',
                theme = shinythemes::shinytheme('cosmo'),

                sidebarLayout(
                  #sidebarPanel(width = 3,
                   #            selectInput("xais",
                  #                         label = "Select first axis:",
                   #                        choices = colnames(psc),
                    #                       selected = 1)),
                  sidebarPanel(
                    #uiOutput("select_var1")
                  ),
                  mainPanel(width = 9,
                            tabsetPanel(
                              tabPanel(title = 'Output Map',
                                       leafletOutput("map", height=1000),
                             # br(),
                              #actionButton("reset", "reset"),
                              br(),
                                       dataTableOutput(outputId = 'table'),
                              br(),
                              plotlyOutput(outputId = "plot1"))))))
