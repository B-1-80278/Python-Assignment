#Write a R program to merge two given lists into one list.
list1 <<- list(1:9)
list(10:15) -> list2

merged.list = c(list1, list2)
print(merged.list)
