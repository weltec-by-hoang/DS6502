# Set working directory
setwd("C:/Users/nvtho/Dropbox/Weltec/DS6502/Feb2024/assignment2/solution")

# Read file
infectious_disease <- read.csv("Infectious Disease 2001-2014.csv")

# Extract Tuberculosis in Total NO infected in 2010 - 2012 period
Tuberculosis_2010 <- subset(infectious_disease, 
                            (infectious_disease$Disease == "Tuberculosis") & 
                            (infectious_disease$Sex == "Total") & 
                            (infectious_disease$Year == "2010") &
                            (infectious_disease$Count == 0))

Tuberculosis_2011 <- subset(infectious_disease, 
                            (infectious_disease$Disease == "Tuberculosis") & 
                            (infectious_disease$Sex == "Total") & 
                            (infectious_disease$Year == "2011") &
                            (infectious_disease$Count == 0))

Tuberculosis_2012 <- subset(infectious_disease, 
                            (infectious_disease$Disease == "Tuberculosis") & 
                            (infectious_disease$Sex == "Total") & 
                            (infectious_disease$Year == "2012") &
                            (infectious_disease$Count == 0))

# Find intersection of counties of NO infected in 2010 - 2012 period
County_Tuberculosis_2010_2011 <- intersect(Tuberculosis_2010$County, Tuberculosis_2011$County)
County_Tuberculosis_2010_to_2012 <- intersect(County_Tuberculosis_2010_2011, Tuberculosis_2012$County)
