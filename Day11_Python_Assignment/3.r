#Q3 create a data frame in R for Students information
# columns: Roll No, Students Name, Age, Score
#1. get number of columns. get number of rows
#3. get columns
#4. get first 3 rows
#5. get last 3 rows
#6. get general information
#7. get statistical information

roll.no = c(11 ,22, 33, 44, 55)
students.name = c("sumit", "vishwa", "mayur", "sanket", "kaka")
age = c(20, 21, 44, 33, 55)
score = c(90, 91, 92, 93, 94)

df.student = data.frame(
      RollNo = roll.no,
      Name = students.name,
      Age = age,
      Score = score
)

print(df.student)
print(ncol(df.student))
print(nrow(df.student))
print(colnames(df.student))
print(head(df.student, 3))
print(tail(df.student, 3))
print(str(df.student))
print(summary(df.student))
