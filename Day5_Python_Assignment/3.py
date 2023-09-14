# ROT -13
# Pnrfne pvcure? V zhpu cersre Pnrfne fnynq!

dict1 = {'a': 'n', 'b': 'o', 'c': 'p', 'd': 'q', 'e': 'r', 'f': 's', 'g': 't', 'h': 'u', 'i': 'v', 'j': 'w', 'k': 'x',
         'l': 'y', 'm': 'z', 'n': 'a',
         'o': 'b', 'p': 'c', 'q': 'd', 'r': 'e', 's': 'f', 't': 'g', 'u': 'h', 'v': 'i', 'w': 'j', 'x': 'k', 'y': 'l',
         'z': 'm', 'A': 'N', 'B': 'O', 'C': 'P',
         'D': 'Q', 'E': 'R', 'F': 'S', 'G': 'T', 'H': 'U', 'I': 'V', 'J': 'W', 'K': 'X', 'L': 'Y', 'M': 'Z', 'N': 'A',
         'O': 'B', 'P': 'C',
         'Q': 'D', 'R': 'E', 'S': 'F', 'T': 'G', 'U': 'H', 'V': 'I', 'W': 'J', 'X': 'K', 'Y': 'L', 'Z': 'M'}



def decoder():
    encoded_msg = input("Enter the encoded msg to decode it ")
    decoded_msg = ""
    for letter in encoded_msg:
        if dict1.get(letter) is None:
            decoded_msg += letter
        else:
            decoded_msg += dict1[letter]


    print(f"decoded msg is : {decoded_msg}")



def encoder():
    message = input("Enter the msg which you want to encode: ")
    # sunbeam
    encoded_msg = ""

    for letter in message:
        if dict1.get(letter) is None:
            encoded_msg += letter
        else:
            encoded_msg += dict1[letter]

    print(f"encoded msg is:  {encoded_msg}")

choice = int(input("Enter 1 to decode message and Enter 2 to encode message: " ))
if choice == 1:
    decoder()
else:
    encoder()
