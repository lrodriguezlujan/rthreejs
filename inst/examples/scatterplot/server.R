library("shiny")
library("threejs")

set.seed(1)

shinyServer(function(input, output)
{
  output$scatterplot <- renderScatterplotThree({
    npoints <- input$npoints
    num.ticks <- input$nticks
    example_data <- matrix(runif(npoints * 3), ncol = 3)
    if (num.ticks == 0) num.ticks <- NULL
    else num.ticks <- rep(num.ticks,3)
    if (input$radius) r <- rlnorm(npoints,meanlog = -4, sdlog = 0.15)
    else r <- 0
    data <- cbind(example_data,r)
    colnames(data) <- NULL
    color <- rep(rainbow(input$colors),length.out = nrow(data))
    sizes <- rep(c(0.5, 1, 2)[1:input$sizes], length.out = nrow(data))
    labs <- sprintf("x=%.2f, y=%.2f, z=%.2f r=%.2f", data[,1], data[,2], data[,3], data[,4])
    scatterplot3js(x = data,
                    num.ticks = num.ticks,
                    color = color,
                    size = sizes,
                    labels = labs,
                    label.margin = "80px 10px 10px 10px",
                    renderer = input$renderer,
                    grid = input$grid)
  })
})
