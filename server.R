#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#


library(shiny)
shinyServer(
  function(input, output){
    output$ProvincialTax <- renderText({ calculateProvincialTax(input$Salary) })
    output$FederalTax <- renderText({ calculateFederalTax(input$Salary) })
    output$TotalTax <- renderText({ calculateTotalTax(input$Salary) })
  }
)

calculateProvincialTax <- function (Salary) 
{
  result <- 0.150*min(Salary,45105) + 
            0.200*min(max(Salary-45105,0),45095) + 
            0.240*min(max(Salary-90200,0),19555) +
            0.2575*max(Salary-109755,0)
  return(round(result, digits = 2))
}

calculateFederalTax <- function(Salary)
{
  result <- 0.150*min(Salary,50197) + 
            0.205*min(max(Salary-50197,0),50195) + 
            0.260*min(max(Salary-100392,0),55233) +
            0.290*min(max(Salary-155625,0),66083) + 
            0.330*max(Salary-221708,0)
  return(round(result, digits = 2))
}

calculateTotalTax <- function(Salary)
{
  result1 <- 0.150*min(Salary,45105) + 
             0.200*min(max(Salary-45105,0),45095) + 
             0.240*min(max(Salary-90200,0),19555) +
             0.2575*max(Salary-109755,0)
  
  result2 <-  0.150*min(Salary,50197) + 
              0.205*min(max(Salary-50197,0),50195) + 
              0.260*min(max(Salary-100392,0),55233) +
              0.290*min(max(Salary-155625,0),66083) + 
              0.330*max(Salary-221708,0)
  
  return(round(result1+result2, digits = 2))
}