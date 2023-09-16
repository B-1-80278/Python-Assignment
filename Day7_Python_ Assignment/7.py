# Write a Python function student_data() which will print the id of a student (student_id).
# If the user passes an argument student_name or student_class(use **kwargs) the function
# will print the student name and class.

def student_data(*args, **kwargs):
    if len(args) != 0:
        print(args)
    else:
        for parameter in kwargs:
            print(kwargs[parameter])


student_data(80278)
student_data(students_name='Sumit', student_class='B1')

