#Write a R program to add a new item c4 = "R Programming" to a given list.

list1 <<- list(c1 = 1:15, c2 = "C Programming", c3 = "HTML")
c4 = "R Programming"
list3 <<- append(list1, c4)
print(list3)
