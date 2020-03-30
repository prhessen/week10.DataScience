# R Studio API Code
library(rstudioapi)
setwd(dirname(getActiveDocumentContext()$path))

# Libraries
library(qualtRics)
library(tidyverse)

# Data Import and Cleaning

qualtrics_api_credentials(api_key = "apikeygoeshere", 
                          base_url = "https://umn.ca1.qualtrics.com",
                          install = TRUE,
                          overwrite = T)
surveys <- all_surveys() %>%
    mutate(creationDate = as.POSIXct(creationDate))

# Visualization
ggplot(surveys, aes(creationDate)) +
    geom_bar() + 
    ggtitle("Count of Surveys Made Over Time") +
    xlab("Time") + 
    ylab("Number of Surveys")
