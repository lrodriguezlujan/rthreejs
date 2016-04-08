library("shiny")
library("threejs")

shinyUI(fluidPage(
  titlePanel("Les miserables graph"),
  sidebarLayout(
    sidebarPanel(
      #sliderInput("N", "Number of cities to plot", value=5000, min = 100, max = 10000, step = 100),
      hr(),
      p("Click and drag to rotate.")
    ),
    mainPanel(
      graphOutput("graph")
    )
  )
))
