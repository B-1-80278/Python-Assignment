# Q6. Consider engine.csv file and plot the following graphs between any 2 columns.
# i) Line plot
# ii) Bar Graph
# iii) Scatter Plot
# A. Create a new csv file of 10 employees with employee id and salary and plot any 3 graphs.
# B. Add suitable Labels
# C. Add chart Title
# D. Export the chart in image format
# E.Show the chart

import matplotlib.pyplot as plt
import numpy as np

df = np.read_csv('Engine.csv.csv')
print(df)
plt.scatter(df.['ENGINESIZE'], df.['FUELCONSUMPTION_COMB'], color="red", label="Salary")
plt.plot(df.['ENGINESIZE'], df.['FUELCONSUMPTION_COMB'], color="red")
