shinyUI(pageWithSidebar(
    headerPanel("Miles per Gallons Regression Model"),
    sidebarPanel(
        h1('Overview'),
        h6('This application allows the user to create and compare mulit-variable
           regression models, predicting the mpg peformance of a car based on a 
           combination of four features.'),
        h6('Select the features you would like to include in the model as 
           predictors.'),
        h6('You can also adjust the minimum weight (in tons) of the cars that 
           will be included in the model.'),
        h1('Inputs'),
        
        checkboxGroupInput("feature", "Automobile Features",
                           c("Transmission" = "am",
                             "Weight" = "wt",
                             "Horse Power" = "hp",
                             "Cylinders" = "cyl"),
                           selected="am"),
       
        
        sliderInput('minwt', 'Minimum Weight in tons',value = 1, min = 1, 
                    max = 3, step = 0.05),
        submitButton('Submit',  icon("refresh"))
        
    ),
    mainPanel(
        h3('Key "Goodness of Fit" Diagrams'),
        ##plotOutput('newHist'),
        plotOutput('newPlot', width = "80%"),
        p(''),
        p('The outputs below indicate the R Sq. error of the model and its 
          coeffients.'),
        
        h3('Key outputs'),
        h4('R Sq. Error'),
        verbatimTextOutput("orsq"),
        h4('Coefficients'),
        verbatimTextOutput("ocoeff")
       
    )
))
