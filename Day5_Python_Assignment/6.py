# Write a function translate() that will translate a text into "rövarspråket"
# (Swedish for "robber's language"). That is, double every consonant and place an
# occurrence of "o" in between. For example, translate("this is fun") should return
# the string "tothohisos isos fofunon".

sentence = "this is sample"
vowels = ['a', 'e', 'i', 'o', 'u', ' ']
translated = ""

for ch in sentence:
    if ch in vowels:
        translated += ch
    else:
        translated += ch + 'o' + ch
print(translated)
