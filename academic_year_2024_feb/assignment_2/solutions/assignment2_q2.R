# Set working directory
setwd("C:/Users/nvtho/Dropbox/Weltec/DS6502/Feb2024/assignment2/solution")

# Read file
infectious_disease = read.csv("Infectious Disease 2001-2014.csv")

# Extract HIV in Female in year 2005
HIV_Female_2005 <- subset(infectious_disease, 
                          (infectious_disease$Disease == "HIV") & 
                          (infectious_disease$Sex == "Female") & 
                          (infectious_disease$Year == "2005"))

# Sort counties by the Rate
HIV_Female_2005_sorted <- HIV_Female_2005[order(HIV_Female_2005$Rate, decreasing = TRUE), ]
