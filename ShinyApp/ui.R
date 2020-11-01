#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)


# Define UI 
shinyUI(fluidPage(

    # Application title
    titlePanel("Estimating \u03C0 by Monte Carlo Method"),

    # Sidebar with a slider input for number of throws
    sidebarLayout(
        sidebarPanel(
            h4("Use the slider to select the number of draws, then press Go!"),
            h5("Note: you may have to update the number of draws to make the Go! button work"),
            sliderInput("ndraw",
                        "Number of draws:",
                        min = 10,
                        max = 10000,
                        value = 1000),
            submitButton("Go!")
        ),

        # Plot
        mainPanel(
            h3("The ratio of the number of points inside the circle to the total number of points estimates the number \u03C0 / 4 "),
            plotOutput("piPlot"),
            h3("Monte Carlo Estimate of \u03C0:"),
            textOutput("piEstimate"),
            h3("True Value: "),
            pi
        )
    )
))
