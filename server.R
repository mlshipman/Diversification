library(shiny)


shinyServer(function(input, output) {


  output$shares<-renderPrint({c(input$stock1, input$stock2, 100-input$stock1-input$stock2)/100})
  
  output$efplot<-renderPlot({
    
    sigma<-c(input$vol1, input$vol2, input$vol3)
    corr<-matrix(c(100, input$corr12, input$corr13, input$corr12, 100, input$corr23, input$corr13, input$corr23, 100), nrow=3, ncol=3)/100
    bigsigma<-sigma*corr*sigma
    shares<-c(input$stock1, input$stock2, 100-input$stock1-input$stock2)/100
    portvol<-sqrt( shares %*% bigsigma %*% shares )
    portreturn<- sum(c(input$return1,input$return2,input$return3) * shares)
    
    plot(input$vol1,input$return1, col="red", ylim=c(0,15),xlim=c(0,30), xlab="Standard Deviation", ylab="Expected Return", main="Risk Return Plot", pch=20, cex=3)
    points(input$vol2, input$return2, col="blue", pch=20, cex=3)
    points(input$vol3, input$return3, col="green", pch=20, cex=3)
    points(portvol, portreturn, col="black", pch=20, cex=3)
    legend("topright", pch=20, col=c("red", "blue", "green", "black"), legend=c("Stock1","Stock 2", "Stock 3", "Portfolio") )
  })
  
})
