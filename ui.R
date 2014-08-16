
library(shiny)

shinyUI(
  fluidPage(
  
  titlePanel("Investment Portfolio Diversification Demo"),
  
   sidebarLayout(
     sidebarPanel(
       h6('all inputs in percentages'),
       h4('Enter stock distribution'),
       fluidRow(
        column(5,numericInput('stock1', 'Share in stock 1:', 30, min = 0, max = 100, step = 1)),
        column(5, offset=2,numericInput('stock2', 'Share in stock 2:', 40, min = 0, max = 100, step = 1))
       ),
       p('Make sure the total does not exceed 100%!'),
       h4('Enter stock returns and volatility'),
       fluidRow(
         column(5,
               numericInput('return1', 'Return of stock 1:', 3, min = 0, max = 15, step = 1)
               ),
         column(5, offset=2,
               numericInput('vol1', 'Volatility stock 1:', 10, min = 0, max = 30, step = 1)
               )
       ),
       fluidRow(
         column(5,
                numericInput('return2', 'Return of stock 2:', 5, min = 0, max = 15, step = 1)
         ),
         column(5, offset=2,
                numericInput('vol2', 'Volatility stock 2:', 18, min = 0, max = 30, step = 1)
         )
       ),
       fluidRow(
         column(5,
                numericInput('return3', 'Return of stock 3:', 12, min = 0, max = 15, step = 1)
         ),
         column(5, offset=2,
                numericInput('vol3', 'Volatility stock 3:', 25, min = 0, max = 30, step = 1)
         )
       ),
       h4('Enter stock correlations'),
       fluidRow(
         column(5,
                numericInput('corr12', 'stock 1 - stock 2:', 20, min = 0, max = 100, step = 1)
         ),
         column(5, offset=2,
                numericInput('corr13', 'stock 1 - stock 2:', 25, min = 0, max = 100, step = 1)
         )
       ),
       fluidRow(
         column(5, offset=7,
                numericInput('corr23', 'stock 1 - stock 3:', 15, min = 0, max = 100, step = 1)
         )
       )
       
     ),
   
  
  mainPanel(
    h4("Portfolio shares:"),
    verbatimTextOutput("shares"),
    plotOutput("efplot")
  )
  )
))
