library(shiny)
library(datasets)
library(dplyr)
shinyServer(function(input, output) {
    output$table <- renderDataTable({
        hp_seq <- seq(from = input$hp[1], to = input$hp[2], by = 1)
        data <- transmute(mtcars, Car = rownames(mtcars), Gross_horsepower = hp, 
                          Transmission = am, Number_of_forward_gears = gear, 
                          Number_of_cylinders = cyl, Engine = vs, 
                          Quarter_mile_time= qsec)
        data <- filter(data, Number_of_cylinders %in% input$cyl, 
                       Gross_horsepower %in% hp_seq, Transmission %in% input$am, 
                       Number_of_forward_gears %in% input$gear, 
                       Engine %in% input$vs)
        data <- mutate(data, Transmission = ifelse(Transmission==0, "Automatic", "Manual"))
        data <- mutate(data, Engine = ifelse(Engine==0, "V-shaped", "Straight"))
        data
    }, options = list(lengthMenu = c(5, 10, 15, 20, 25, 30), pageLength = 30))})
