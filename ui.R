#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#


library(shiny)
shinyUI(pageWithSidebar(
  headerPanel("2022 Federal and Provincial Tax Calculator"),
  sidebarPanel(
    h4('Annual Income Information'),
    numericInput('Salary', 'Salary ($CAD)', 550000),
  ),
  mainPanel(
    h4('Federal Income Tax'),
    textOutput("FederalTax"),
    h4('Provincial Income Tax'),
    textOutput("ProvincialTax"),
    h4('Total Income Tax'),
    textOutput("TotalTax"),
    br(),
    h4('Instructions'),
    helpText("This application is for designed to allow workers from Quebec to calculate estimated annual income tax for fiscal year 2022 "),
    code("Salary"),
    helpText("Enter total of all combined income sources"),
  )
))