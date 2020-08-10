library(shiny)
library(shinythemes)
library(shinyWidgets)# Bootswatch color themes for shiny
library(choroplethr)      # Creating Choropleth Maps in R
library(choroplethrMaps)  # Maps used by the choroplethr package
library(dplyr)
library(leaflet)
library(DT)
library(plotly)

# load the data set from the choroplethrMaps package
data('df_state_demographics')
map_data <- df_state_demographics
