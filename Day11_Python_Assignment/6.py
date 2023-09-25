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
import pandas as pd
import numpy as np

df = pd.read_csv("Engine.csv.csv")

print(df.head())
engine_size = df['ENGINESIZE']
co2_emissions = df['CO2EMISSIONS']


def function1():

    # draw scatter plot
    plt.plot(engine_size, co2_emissions, color="black")

    # add labels
    plt.xlabel("engine size in litres")
    plt.ylabel("CO2 Emissions ")


    # add chart title
    plt.title("Engine size vs CO2 emissions")
    plt.show()


# function1()


def function2():
    # draw scatter plot
    plt.scatter(engine_size, co2_emissions, color="black")

    # add labels
    plt.xlabel("engine size in litres")
    plt.ylabel("CO2 Emissions ")

    # add chart title
    plt.title("Engine size vs CO2 emissions")
    plt.show()


# function2()


def function3():
    # draw scatter plot
    plt.bar(engine_size, co2_emissions, color="black")

    # add labels
    plt.xlabel("engine size in litres")
    plt.ylabel("CO2 Emissions ")

    # add chart title
    plt.title("Engine size vs CO2 emissions")
    plt.show()


# function3()


def function4():
    df = pd.read_csv("employees.csv")

    print(df.head())
    id = df['id']
    salary = df['salary']

    def function1():
        # draw scatter plot
        plt.plot(id, salary, color="black",label = "salary")

        # add labels
        plt.xlabel("id ")
        plt.ylabel("salary ")

        # add chart title
        plt.title("id vs salary")
        plt.savefig("id vs salary_1.jpg")
        plt.legend()
        plt.show()

    function1()

    def function2():
        # draw scatter plot
        plt.scatter(id, salary, color="black", label = "salary")

        # add labels
        plt.xlabel("id ")
        plt.ylabel("salary ")
        plt.legend()

        # add chart title
        plt.title("id vs salary")
        plt.savefig("id vs salary_2.jpg")
        plt.show()

    function2()

    def function3():
        # draw scatter plot
        plt.bar(id, salary, color="black",label = "salary")

        # add labels
        plt.xlabel("id ")
        plt.ylabel("salary ")
        plt.legend()

        # add chart title
        plt.title("id vs salary")
        plt.savefig("id vs salary_3.jpg")
        plt.show()

    function3()

function4()