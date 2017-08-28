
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyServer(function(input, output) {
  
  model1<-lm(dist~speed,cars)
  model1pred<-reactive({
    inputspeed<-input$sliderspeed
    predict(model1,newdata=data.frame(speed=inputspeed))
  })
  
  output$plot1<-renderPlot({
    input1<-input$sliderspeed
    
    plot(cars, xlab = "Speed (mph)", ylab = "Stopping distance (ft)",las = 1)
    abline(model1,col="red",lwd=2)
    legend(25,250,"Linear regression prediction",pch = 16,col="red",bty = "n",cex=1.2)
    points(input1,model1pred(),col="red",pch=16,cex=2)
  })
  
  output$pred1<-renderText({
    model1pred()
  })

})
