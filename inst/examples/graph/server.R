library("shiny")
library("threejs")

data(LeMis, package="threejs")
g <- graphjs(LeMis$edges, LeMis$nodes, main="Les Mis&eacute;rables")

shinyServer(function(input, output)
{

  output$graph <- renderGraph({
    g
  })
})
