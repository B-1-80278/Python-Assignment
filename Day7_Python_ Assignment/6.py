# A pangram is a sentence that contains all the letters of the English alphabet at least once,
# for example: The quick brown fox jumps over the lazy dog. Your task here is to
# write a function to check a sentence to see if it is a pangram or not.

string1 = "The quick brown fox jumps over the lazy dog"
set1 = set()
def check_pangram():
    for ch in string1.lower():
        if ch.isalpha():
            set1.add(ch)

    unique_set = set(set1)
    print(unique_set)

    if len(unique_set) < 26:
        print("The given sentence is not pangram.....")
    else:
        print("The given sentence is pangram.....")

check_pangram()

