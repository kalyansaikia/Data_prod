# This is the server logic of a Shiny web application. 
# To run the application click 'Run App' 
#

# Loading required Library 

library(shiny)
library(HistData)
data(GaltonFamilies)
library(dplyr)
library(ggplot2)

# Measurement conversion from Inch to cm
gf <- GaltonFamilies
gf <- gf %>% mutate(father=father*2.54,
                    mother=mother*2.54,
                    childHeight=childHeight*2.54)

# Developing Linear model

regmod <- lm(childHeight ~ father + mother + gender, data=gf)

# Defining Shiny server 

shinyServer(function(input, output) {
  output$parentsText1 <- renderText({
    paste(strong("Selected Father's height = "),
          strong(round(input$inFh, 1)),
          "cm")
  })
  
  output$parentsText2 <- renderText({
    paste(strong ("Selected Mother's height = "),
          strong(round(input$inMh, 1)),
          "cm")
  })
  
  output$prediction <- renderText({
    df <- data.frame(father=input$inFh,
                     mother=input$inMh,
                     gender=factor(input$inGen, levels=levels(gf$gender)))
    ch <- predict(regmod, newdata=df)
    sord <- ifelse(
      input$inGen=="female",
      "Daugther",
      "Son"
    )
    paste0("Predicted Height of",
           em(strong(sord)),
           " is ",
           em(strong(round(ch))),
           " cm"
    )
  })
})


