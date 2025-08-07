def two_fer(name=""):
    # name = input("What's your name?")
    if name == "":
        return "One for you, one for me."
    else:
        return f"One for {name}, one for me."
