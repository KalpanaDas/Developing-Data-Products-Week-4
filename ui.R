library(shiny)
shinyUI(fluidPage(
    titlePanel("Comparison of cars"),
    sidebarLayout(
        sidebarPanel(
            helpText("Enter the features of the car"),
            sliderInput('hp', 'Gross horsepower', min=50, max=340, value=c(50,340), step=10),
            checkboxGroupInput('am', 'Transmission (0 = Automatic, 1 = Manual)', c("Automatic"=0, "Manual"=1), selected = c(0,1)),
            checkboxGroupInput('gear', 'Number of forward gears',c("Three"=3, "Four"=4, "Five"=5),selected = c(3,4,5)),
            checkboxGroupInput('cyl', 'Number of cylinders', c("Four"=4, "Six"=6, "Eight"=8), selected = c(4,6,8)),
            checkboxGroupInput('vs', 'Engine (0 = V-shaped, 1 = Straight)', c("V-shaped"=0, "Straight"=1), selected = c(0,1)),
            submitButton("Compare now!")),
            
        mainPanel(
            dataTableOutput("table")))))
