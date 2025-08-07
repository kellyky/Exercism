def two_fer(name):
    name = input("What's your name?")
    if name == "":
        print("One for you, one for me.")
    else:
        print(f"One for {name}, one for me.")
