class Student:
    def __init__(self,roll_no='', student_name='', course=''):
        self.roll_no = roll_no
        self.student_name = student_name
        self.course = course
        self.marks = {}

    def __str__(self):
        return f"roll no = {self.roll_no}, student name = {self.student_name}, course = {self.course}, dict = {self.marks}"

    def accept_student_data(self):
        roll = input("Enter the roll number ")
        student_name = input("Enter the student name ")
        course = input("Enter the course name")
        self.roll_no = roll
        self.student_name = student_name
        self.course = course

        for index in range(5):
            mark = int(input(f"marks of subject {index+1} : "))
            self.marks[f"subject {index+1}"] = mark


    def print_student_data(self):

        print('-' * 35)
        print(f"student name : {self.student_name}")
        print(f" roll number : {self.roll_no}")
        print(f"course : {self.course}")
        print("Marks of each subject")
        for sub in self.marks.keys():
            print(f"{sub} = {self.marks[sub]}")

        print('-'* 35)


def accept_5_student_and_print():
    list1 = []
    for index in range(1):
        print(f"Enter the details of student {index + 1} ")
        student = Student()
        student.accept_student_data()
        list1.append(student)

    for student in list1:
        print(f"lets print here, override str ->  ")
        print(student)
        print()

        print("records of student: ")
        student.print_student_data()


accept_5_student_and_print()
#
# s1 = Student()
# print(s1)