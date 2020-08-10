server <- function(input, output) {
  clicked_data <- reactiveValues(clickedMarker=NULL)
  some_data <- data.frame(psc)
  #RV <- reactiveValues(data = some_data)
  some_data$Latitude <-  as.numeric(some_data$LATITUDE)
  some_data$Longitude <-  as.numeric(some_data$LONGITUDE)
  some_data=filter(some_data, Latitude != "NA") # removing NA values

  # new column for the popup label

  some_data <- mutate(some_data, cntnt=paste0('<strong>Name: </strong>',DEVELOPMENT_NAME,
                                          '<br><strong>Address:</strong> ', ADDRESS,
                                          '<br><strong>City:</strong> ', CITY))

  # create a color paletter for category type in the data file

  #pal <- colorFactor(pal = c("#1b9e77", "#d95f02", "#7570b3"), domain = c("Charity", "Government", "Private"))

  # create the leaflet map
  output$map <- renderLeaflet({
    leaflet(some_data) %>%
      addCircles(lng = ~Longitude, lat = ~Latitude) %>%
      addTiles() %>% setView(-77.0369, 38.9072, zoom = 15) %>%
      addCircleMarkers(data = some_data, lat =  ~Latitude, lng =~Longitude,
                       radius = 10, popup = ~as.character(cntnt),
                       stroke = FALSE, fillOpacity = 0.8)%>%
      #addLegend(values=some_data$Category,opacity=1, na.label = "Not Available")%>%
      addEasyButton(easyButton(
        icon="fa-crosshairs", title="ME",
        onClick=JS("function(btn, map){ map.locate({setView: true}); }")))
  })
  # observe the marker click info and print to console when it is changed.
  #observeEvent(input$map_marker_click,{
    #print("observed map_marker_click")
    #clicked_data$clickedMarker <- input$map_marker_click
    #print("bye")
    #print(clicked_data$clickedMarker)
    #print("HI")
    #print(clicked_data$clickedMarker$lng)
    #output$table <- renderDataTable({
     # return(
        #subset(some_data, Longitude == clicked_data$clickedMarker$lng & Latitude == clicked_data$clickedMarker$lat)
      #)
    #})
  #})

  #output$plot1 <- renderPlotly({
   # CORE:::graph_three_shiny()
  #})

  #output$table <- eventReactive(input$reset, {
   # renderDataTable(some_data)
  #})

  output$table <- renderDataTable({psc})


}
