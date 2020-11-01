#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)


titleString <- "Estimating \u03C0 by Monte Carlo Method"

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel(titleString),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            sliderInput("throws",
                        "Number of throws:",
                        min = 10,
                        max = 10000,
                        value = 1000)
        ),

        # Show a plot of the generated distribution
        mainPanel(
            plotOutput("distPlot"),
            h3("Monte Carlo Estimate of \u03C0:"),
            textOutput("piEstimate"),
            h3("True Value: "),
            pi
        )
    )
))
