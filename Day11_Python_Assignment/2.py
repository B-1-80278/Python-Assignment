# Refer the dataset "Salaries.csv" and perform following tasks.
# i) Read the dataset in dataframe.
# ii) display first five records.
# iii) display first ten records.
# iv) display last five records.
# v) display last ten records.
# vi) display the columns inside the dataset.
# vii) display shape of data.
# viii) describe the dataset.
# ix) display the information about the dataset and analyse the data.
# x) display types of each columns.

import pandas as pd

df = pd.read_csv('Salaries.csv')

# print(df)
print("First five records of dataset: ")
print(df.head())
print("First ten records of dataset: ")
print(df.head(10))
print("Last five records from dataset:")
print(df.tail())
print("Last ten records from dataset:")
print(df.tail(10))
print()
print("The columns inside the dataset:")
print(df.columns)

print("The information about the dataset:")
df.info
print()
print("Data types of columns:")
print(df.dtypes)

print()

print(f" shape: {df.shape}")
print()
print("Description of data set:")
print(df.describe())
