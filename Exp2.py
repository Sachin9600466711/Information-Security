import hashlib

a = input("Enter a string:\n")
result = hashlib.md5(a.encode())  # Encode the input string before hashing
print("The byte equivalent of hash is:", end=" ")
print(result.digest())  # Print the hash digest

print("The available algorithms are:", end=" ")
print(hashlib.algorithms_guaranteed)  # Fix typo in 'haslib' to 'hashlib'
