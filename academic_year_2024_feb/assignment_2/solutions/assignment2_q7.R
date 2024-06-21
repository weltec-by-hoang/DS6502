# Set working directory
setwd("C:/Users/nvtho/Dropbox/Weltec/DS6502/Feb2024/assignment2/solution")

# Read file
infectious_disease = read.csv("Infectious Disease 2001-2014.csv")

# Cryptosporidiosis in California
Cryptosporidiosis_California <- subset(infectious_disease, 
                                       (infectious_disease$Disease == "Cryptosporidiosis") & 
                                       (infectious_disease$Sex == "Total") & 
                                       (infectious_disease$County == "California"))

# Cryptosporidiosis in Lake
Cryptosporidiosis_Lake <- subset(infectious_disease, 
                                 (infectious_disease$Disease == "Cryptosporidiosis") & 
                                 (infectious_disease$Sex == "Total") & 
                                 (infectious_disease$County == "Lake"))

# Cryptosporidiosis in San Diego
Cryptosporidiosis_SanDiego <- subset(infectious_disease, 
                                     (infectious_disease$Disease == "Cryptosporidiosis") & 
                                     (infectious_disease$Sex == "Total") & 
                                     (infectious_disease$County == "San Diego"))

# Cryptosporidiosis in San Francisco
Cryptosporidiosis_SanFrancisco <- subset(infectious_disease, 
                                         (infectious_disease$Disease == "Cryptosporidiosis") & 
                                         (infectious_disease$Sex == "Total") & 
                                         (infectious_disease$County == "San Francisco"))

# (a) ANOVA

Cryptosporidiosis <- data.frame(group = rep(c("California", "Lake", "SanDiego", "SanFrancisco"), each = 14),
                                year = rep(c(1:14), times  = 4),
                                value = c(Cryptosporidiosis_California$Rate,
                                          Cryptosporidiosis_Lake$Rate,
                                          Cryptosporidiosis_SanDiego$Rate,
                                          Cryptosporidiosis_SanFrancisco$Rate))

anova_result <- aov(value ~ group, data = Cryptosporidiosis)
summary(anova_result)

# (b) Post-Hoc Analysis:
tukey_result <- TukeyHSD(anova_result)
tukey_result

# (c) EDA
library(ggplot2)

ggplot(data = Cryptosporidiosis, aes(x = year, y = value, color = group)) +
  geom_line() +
  theme_minimal() +
  labs(title = "Cryptosporidiosis Cases Over Years",
       x = "Year (2k)",
       y = "Rate (%)",
       color = "County") +
  scale_x_continuous(breaks = 1:14)
