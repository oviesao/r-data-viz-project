# Load necessary libraries
library(tidyverse)

# Read the data
data <- read.csv("data/emissions.csv")

# Clean data: remove any rows with missing values (not needed here, but good practice)
data_clean <- data %>% drop_na()

# Select the top 10 countries with the highest CO2 emissions
top10 <- data_clean %>% 
  arrange(desc(CO2_Emissions)) %>%
  head(10)

# Create a bar plot
ggplot(top10, aes(x = reorder(Country, CO2_Emissions), y = CO2_Emissions)) +
  geom_bar(stat = "identity", fill = "steelblue") +
  coord_flip() +
  labs(title = "Top 10 Countries by CO₂ Emissions",
       x = "Country", y = "Emissions (million tons)")

# Save the plot
ggsave("plots/emissions_plot.png")
