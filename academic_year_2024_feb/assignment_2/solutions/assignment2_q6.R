# Set working directory
setwd("C:/Users/nvtho/Dropbox/Weltec/DS6502/Feb2024/assignment2/solution")

# Read file
infectious_disease <- read.csv("Infectious Disease 2001-2014.csv")

# Dengue in San Diego
Dengue_SanDiego <- subset(infectious_disease, 
                          (infectious_disease$Disease == "Dengue") & 
                          (infectious_disease$Sex == "Total") & 
                          (infectious_disease$County == "San Diego"))

# Dengue in San Francisco
Dengue_SanFrancisco <- subset(infectious_disease, 
                              (infectious_disease$Disease == "Dengue") & 
                              (infectious_disease$Sex == "Total") & 
                              (infectious_disease$County == "San Francisco"))

# Find Correlation
t.test(Dengue_SanDiego$Rate, Dengue_SanFrancisco$Rate)
