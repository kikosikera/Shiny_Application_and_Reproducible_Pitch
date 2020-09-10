##Peer-graded Assignment: Course Project: Shiny Application and Reproducible Pitch

###Ammonia, the raw material for producing nitrogen fertilizer, is made from natural gas. The production cost of ammonia depends on the price of natural gas.
###The production cost of ammonia($/tonne) is estimated as 36*Natural gas price($/mmbtu)+26
###This shiny app calculates the production cost of ammonia as the change of natural gas price.


library(shiny)

shinyServer(function(input, output) {

  output$plot1 <- renderPlot({
          x = c(3:16)
          y = 36*x+26
          plot(x,y,xlab="Natural gas price($/mmbtu)", ylab="Production cost($/tonne)",col="white")
          legend("topleft",legend=c("Production cost of Ammonia", "Production cost of Urea"), col=c("red","blue"),lty=1)
          if(input$ammonia){
                  x = c(3:16)
                  y = 36*x+26
                  z = 26*x+42
                  NG=input$NG_price
                  lines(x,y, col = "red", lwd= 2)
                  points(NG, 36*NG+26, col = "red", pch = 16, cex = 2)}
          if(input$urea){
                  x = c(3:16)
                  y = 36*x+26
                  z = 26*x+42
                  NG=input$NG_price
          lines(x,z, col = "blue",lwd=2)
          points(NG, 26*NG+42, col = "blue", pch = 16, cex = 2)}
  })
  output$text <- renderText("Ammonia and Urea are both raw materials for producing nitrogen fertilizer. They are made from natural gas. The production cost of ammonia and Urea depends on the price of natural gas. This shiny app calculates the production cost of ammonia/Urea as the change of natural gas price.")
})
