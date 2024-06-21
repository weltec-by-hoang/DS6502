# Set working directory
setwd("C:/Users/nvtho/Dropbox/Weltec/DS6502/Feb2024/assignment2/solution")

# Read file
infectious_disease <- read.csv("Infectious Disease 2001-2014.csv")

# Extract Amebiasis
Amebiasis <- subset(infectious_disease, (infectious_disease$Disease == "Amebiasis") & (infectious_disease$Sex == "Total"))

# List of counties
County <- unique(Amebiasis$County)

# Initialize an empty list to store the data frames
amebiasis_by_county <- list()

# Iterate over each county
for (i in 1:length(County)) {
  county <- County[i]
  amebiasis <- subset(Amebiasis, Amebiasis$County == county)
  print(class(amebiasis))
  
  # Append the new data frame to the list with a unique name for each county
  amebiasis_by_county[[county]] <- amebiasis
}

# Create plot list for all counties that had the upward trends 
plot_list <- list()

# Iterate over each data frame in the list and create a plot if the condition is met
for (county in names(amebiasis_by_county)) {
  data <- amebiasis_by_county[[county]]
  
  # Check the condition: Count at Year 2014 must be higher than Count at Year 2001
  if (any(data$Year == 2014) && any(data$Year == 2001)) {
    count_2014 <- data$Count[data$Year == 2014]
    count_2001 <- data$Count[data$Year == 2001]
    
    if (count_2014 > count_2001) {
      # Create a line plot
      plot <- ggplot(data, aes(x = Year, y = Count)) +
        geom_line(color = "blue") +
        geom_point(color = "red") +
        labs(title = paste("Amebiasis Cases in", county),
             x = "Year",
             y = "Count") +
        scale_x_continuous(breaks = seq(min(data$Year), max(data$Year), by = 1)) # Ensure all years are shown on the axis
      
      # Append the plot to the plot_list
      plot_list[[county]] <- plot
    }
  }
}

# Show all names of counties that had the upward trends 
names(plot_list)