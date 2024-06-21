# Set working directory
setwd("C:/Users/nvtho/Dropbox/Weltec/DS6502/Feb2024/assignment2/solution")

# Read file
infectious_disease = read.csv("Infectious Disease 2001-2014.csv")

# Extract Malaria in Total infected of >10 in year 2010
Malaria_2010 <- subset(infectious_disease, 
                       (infectious_disease$Disease == "Malaria") & 
                       (infectious_disease$Sex == "Total") & 
                       (infectious_disease$Year == "2010") & 
                       (infectious_disease$Count >= 10))
