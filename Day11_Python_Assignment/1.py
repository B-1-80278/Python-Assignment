# Q1. Refer the dataset "Advertising.csv" and perform following tasks.
# i) Read the dataset "Advertising.csv" in data frame
# ii) Print first five records of dataset
# iii) print last five records from dataset
# iv) display the columns inside the dataset
# v) display last three records from dataset
# vi) display the information about the dataset and analyse the data
# vii) display types of each columns.
# viii) check for null values in the dataset and display the sum of null values inside the column
# ix) drop a column 'radio' from a dataset and display first ten records
# x) increase the sales by 10% and add a new column "updated_sales" in dataframe
# xi) display shape of data
# xiii) describe the dataset.

import pandas as pd

df = pd.read_csv('Advertising.csv')

# print(df)
print("First five records of dataset: ")
print(df.head(5))
print("Last five records from dataset:")
print(df.tail(5))
print("The columns inside the dataset:")
print(df.columns)
print("Last three records from dataset:")
print(df.tail(3))
print("The information about the dataset:")
df.info
print()
print("Data types of columns:")
print(df.dtypes)

print()
print(df.isna())
print("the sum of null values inside the column")
print(df.isna().sum())
print()

df['updated sales'] = df['sales'] * 1.1
print(df.columns)
print()
print(f" shape: {df.shape}")
print()
print("Description of data set:")
print(df.describe())
new_df = df.drop('radio', axis=1)
print(new_df.columns)


