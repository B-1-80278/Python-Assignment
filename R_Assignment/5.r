#5)Write a R program to access the element at 3rd column and 2nd row, only the 3rd row 
#and only the 4th column of a given matrix(c(1:16)) and Give row_names ,col_names.

rownames = c('row1', 'row2', 'row3', 'row4')
colnames = c('col1', 'col2', 'col3', 'col4')
m.1 = matrix(c(1:16), nrow = 4, ncol = 4, dimnames = list(rownames, colnames))
print(m.1)

cat("The element at 3rd column and 2nd row:", m.1[2, 3])
cat("The elements at 3rd row:", m.1[3, ])
