#' @title  graph_first
#' @description Installs scikit-learn into reticluate python enviornment
#' @return The cleaned dataset
graph_first <- function() {

  #response1 <- readline(prompt="Enter categorical feature to plot")
  #response2 <- readline(prompt="Enter categorical feature to plot for stack")
  agg <- dplyr::count(topgear, Maker, Origin)
  agg_ord <- dplyr::mutate(agg,
                    Maker = reorder(Maker, -n, sum),
                    Origin = reorder(Origin, -n, sum))
  ggplot2::ggplot(agg_ord) +
    ggplot2::geom_col(ggplot2::aes(x = Origin, y = n, fill = Maker))
}


#' @title  graph_three
#' @description Installs scikit-learn into reticluate python enviornment
#' @return The cleaned dataset
graph_three <- function() {
  library(magrittr)
  #response1 <- readline(prompt="Enter categorical feature to plot")
  #response2 <- readline(prompt="Enter categorical feature to plot for stack")
  agg <- dplyr::count(topgear, Maker, Origin, Fuel, MPG)
  agg_ord <- dplyr::mutate(agg,
                           Maker = reorder(Maker, -n, sum),
                           Origin = reorder(Origin, -n, sum),
                           Fuel = reorder(Fuel, -n, sum),
                           MPG = MPG) %>% top_n(20)
  fig <- plotly::plot_ly(test, x = ~Maker, y = ~Origin, z = ~Fuel, marker = list(color = ~MPG, colorscale = c('#FFE1A1', '#683531'), showscale = TRUE))
  fig <- fig %>% plotly::add_markers()
  fig <- fig %>% plotly::layout(scene = list(xaxis = list(title = 'Maker'),
                                     yaxis = list(title = 'Origin'),
                                     zaxis = list(title = 'Fuel')),
                        annotations = list(
                          x = 1.13,
                          y = 1.05,
                          text = 'MPG',
                          xref = 'paper',
                          yref = 'paper',
                          showarrow = FALSE
                        ))
  fig
}

#' @title  graph_three_shiny
#' @description Installs scikit-learn into reticluate python enviornment
#' @return The cleaned dataset
graph_three_shiny <- function() {
  library(magrittr)
  #response1 <- readline(prompt="Enter categorical feature to plot")
  #response2 <- readline(prompt="Enter categorical feature to plot for stack")
  agg <- dplyr::count(topgear, Maker, Origin, Fuel, MPG)
  agg_ord <- dplyr::mutate(agg,
                           Maker = reorder(Maker, -n, sum),
                           Origin = reorder(Origin, -n, sum),
                           Fuel = reorder(Fuel, -n, sum),
                           MPG = MPG) %>% top_n(20)
  fig <- plotly::plot_ly(test, x = ~Maker, y = ~Origin, z = ~Fuel, marker = list(color = ~MPG, colorscale = c('#FFE1A1', '#683531'), showscale = TRUE))
  fig <- fig %>% plotly::add_markers()
  fig <- fig %>% plotly::layout(scene = list(xaxis = list(title = 'Maker'),
                                             yaxis = list(title = 'Origin'),
                                             zaxis = list(title = 'Fuel')),
                                annotations = list(
                                  x = 1.13,
                                  y = 1.05,
                                  text = 'MPG',
                                  xref = 'paper',
                                  yref = 'paper',
                                  showarrow = FALSE
                                ))
}
