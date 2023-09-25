#Q4 Create a data frame in R for Students information
#columns: RollNo, StudentsName, Age, Score
#Write a R program to extract 3rd and 5th rows with 1st and 3rd columns from a given data frame.roll_no = c(1,2,3,4,5)
roll.no = c(1,2,3,4,5)
student.name = c("sumit", "vishwa", "mayur", "sanket", "kaka")
age = c(12,13,14,15,13)
score = c(91,97,77,99,92)
df = data.frame(roll.no, student.name, age,  score)
print(df)

print(df[c(3,5),c(1,3)])

