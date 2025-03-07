import string

def caesar_cipher(text, shift, mode):
    result = ""
    
    for char in text:
        if char.isalpha():  # Shift letters (A-Z, a-z)
            shift_amount = shift if mode == "encrypt" else -shift
            start = ord('A') if char.isupper() else ord('a')
            result += chr((ord(char) - start + shift_amount) % 26 + start)
        
        elif char.isdigit():  # Shift numbers (0-9)
            shift_amount = shift if mode == "encrypt" else -shift
            result += str((int(char) + shift_amount) % 10)
        
        elif char in string.punctuation:  # Shift symbols (!, @, #, etc.)
            symbol_list = string.punctuation
            index = symbol_list.index(char)
            shift_amount = shift if mode == "encrypt" else -shift
            result += symbol_list[(index + shift_amount) % len(symbol_list)]
        
        else:
            result += char  # Keep spaces and other unknown characters unchanged

    return result

def main():
    print("=== Enhanced Caesar Cipher Tool ===")
    while True:
        mode = input("\nDo you want to (E)ncrypt or (D)ecrypt? (E/D): ").strip().lower()
        if mode not in ['e', 'd']:
            print("Invalid choice! Please enter 'E' to encrypt or 'D' to decrypt.")
            continue

        text = input("Enter the text: ")
        
        try:
            shift = int(input("Enter the shift value (1-9 for numbers, 1-25 for letters): "))
            if not (1 <= shift <= 25):
                print("Shift value must be between 1 and 25.")
                continue
        except ValueError:
            print("Invalid input! Shift value must be a number.")
            continue

        mode = "encrypt" if mode == "e" else "decrypt"
        result = caesar_cipher(text, shift, mode)
        print(f"\n{mode.capitalize()}ed Text: {result}")

        another = input("\nDo you want to perform another operation? (Y/N): ").strip().lower()
        if another != 'y':
            print("Exiting Caesar Cipher Tool. Goodbye!")
            break

if __name__ == "__main__":
    main()
