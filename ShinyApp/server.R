#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(plotrix)


set.seed(2020)
radius <- 1

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    
    # generate coordinates
    coord <- reactive({
        n <- input$throws
        list(x = runif(n, -radius, radius), y = runif(n, -radius, radius))
    })
    
    output$distPlot <- renderPlot({
        plot(coord()$x, coord()$y, 
             asp = 1, 
             xlim = c(-radius, radius), 
             ylim = c(-radius, radius),
             pch = 4)
        draw.circle(0, 0, radius, border = "blue", lwd = 3)
    })
    
    output$piEstimate <- renderText({
        inCircle <- coord()$x^2 + coord()$y^2 <= radius
        4 * mean(inCircle)
    })
})
