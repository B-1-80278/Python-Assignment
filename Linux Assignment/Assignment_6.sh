#! /usr/bin/bash

# 1 Write a program to print the table of a given number.

echo -n "Enter number : "
read num

for(( i=1; i<11; i++ ))
do
  echo "$num * $i = $( expr $num \* $i )"
done



# 2. Write a program to find the factorial of given number.

echo -n "Enter number : "
read num

if [ $num -lt 0 ]
then
  echo "Factorial does not exists for negative number. "
elif [ $num -eq 0 ]
then
  echo "$num! = 1"
else
  fact=1
  for (( i=1; i<=num; i++))
  do
    fact=$( expr $fact \* $i ) 
  done
  echo "$num! = $fact "
fi


#3. Write a program to find given number of terms in the Fibonacci series.

echo -n "Enter the number of terms : "
read terms

i=0
j=1

firstterm=0
lastterm=1
echo -n "Fibbonacci Series : $firstterm  $lastterm  "

terms=$(expr $terms - 2)
while [ $j -le $terms ]
do
  newterm=$(expr $firstterm + $lastterm)  
  echo -n "$newterm  "
  firstterm=$lastterm
  lastterm=$newterm
  j=$(expr $j + 1)
done

echo ''


# 4. Write a program to calculate gross salary if the DA is 40%, HRA is 20% of basic salary.

echo -n "enter basic salary : "
read bs

echo -n "Gross salary : "
echo "scale=2; $bs * 1.6" | bc


#5. Write a shell script to accept a filename as argument and displays the last modification time if the file exists and a suitable message if it doesn’t exist.

echo -n "Enter file path : "
read path

if [ -e $path ]
then
  echo "file found at $path"
  echo -n "last modification timestamp : "
  stat -c %y $path
else
  echo "no file at $path"
fi


#7. Write a shell script to display only executable files of current directory.

fls=$(ls)

echo "Executable files -----> :"
for file in ${fls[@]}
do
  if [ -x $file ]
  then
    echo $file
  fi
done


# 8. Print the following pattern.
# *
# **
# ***
# ****
# *****


for((row=1; row<=5; row++))
do
  for((col=1; col<=row; col++))
  do
    echo -n "*"
  done
  echo ""
done