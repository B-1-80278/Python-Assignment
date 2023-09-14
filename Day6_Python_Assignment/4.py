# Write a definition of a method count_now(places) to find and display those
# place names, in which there are more than 5 characters.
# For example : If the list of places contains ["DELHI","LONDON","PARIS","NEW YORK","DUBAI"]
# The following should get displayed :
# LONDON
# NEW YORK

list_of_places = ["KOLKATA", "DELHI", "LONDON", "PARIS", "NEW YORK", "DUBAI"]

def count_now(p1):
    for place in list_of_places:
        if len(place) > 5:
            print(place)

count_now(list_of_places)




