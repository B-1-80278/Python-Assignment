# Write a Python function student_data() which will print the id of a student (student_id).
# If the user passes an argument student_name or student_class(use **kwargs) the function
# will print the student name and class.

def student_data(*args, **kwargs):
    print(args, kwargs)

student_data(80278, students_name = 'Sumit', student_class = 'A')

