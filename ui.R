# This is the user-interface definition of a Shiny web application
# To run the application click 'Run App' in right corner.
#


library(shiny)

shinyUI(fluidPage(
  titlePanel("ANALYSIS OF GALTONFAMILIES DATASET: CHILD'S HEIGHT PREDICTION FROM PARENT'S HEIGHT "),
  sidebarLayout(
    sidebarPanel(
      #helpText("This application predicts height of child through his gender and the height of the parents."),
      helpText("Use slidebar for selection"),
      sliderInput(inputId = "inFh",
                  label = "Choose Father's height (in cm)",
                  value = 200,
                  min = 150,
                  max = 250,
                  step = 1),
      sliderInput(inputId = "inMh",
                  label = "Choose Mother's height (in cm)",
                  value = 170,
                  min = 150,
                  max = 250,
                  step = 1),
      radioButtons(inputId = "inGen",
                   label = "Select gender below: ",
                   choices = c("Female"="female", "Male"="male"),
                   inline = FALSE)
    ),
    
    absolutePanel(
      h3(style= "color:red", htmlOutput("parentsText1")),
      h3(style= "color:blue",htmlOutput("parentsText2")),
      h3(style= "color:green",htmlOutput("prediction")),
      top = 200, left = 800
      )
  )
))
