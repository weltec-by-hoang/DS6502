# Set working directory
setwd("C:/Users/nvtho/Dropbox/Weltec/DS6502/Feb2024/assignment2/solution")

# Read file
infectious_disease <- read.csv("Infectious Disease 2001-2014.csv")

# Chlamydia in California
Chlamydia <- subset(infectious_disease, 
                    (infectious_disease$Disease == "Chlamydia") & 
                    (infectious_disease$Sex == "Total") & 
                    (infectious_disease$County == "California"))

# Salmonellosis in California
Salmonellosis <- subset(infectious_disease, 
                        (infectious_disease$Disease == "Salmonellosis") & 
                        (infectious_disease$Sex == "Total") & 
                        (infectious_disease$County == "California"))

# Find Correlation
cor.test(Chlamydia$Rate, Salmonellosis$Rate)
