# def recite(start_verse, end_verse):
#     pass


verse_fly = ["I know an old lady who swallowed a fly.", "I don't know why she swallowed the fly. Perhaps she'll die."]

def line_break():
    print("\n")


def fly():
    for line in verse_fly:
        print(line)
    line_break()




verse_spider = ["I know an old lady who swallowed a spider.", "It wriggled and jiggled and tickled inside her.", "She swallowed the spider to catch the fly.", "I don't know why she swallowed the fly. Perhaps she'll die."]


def spider():
    for line in verse_spider:
        print(line)
    line_break()




verse_bird = ["I know an old lady who swallowed a bird.", "How absurd to swallow a bird!", "She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.", "She swallowed the spider to catch the fly.", "I don't know why she swallowed the fly. Perhaps she'll die."]

def bird():
    for line in verse_bird:
        print(line)
    line_break()


verse_cat = ["I know an old lady who swallowed a cat.", 
"Imagine that, to swallow a cat!", 
"She swallowed the cat to catch the bird.",
"She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.",
"She swallowed the spider to catch the fly.",
"I don't know why she swallowed the fly. Perhaps she'll die."]

def cat():
    for line in verse_cat:
        print(line)
    line_break()

verse_dog = ["I know an old lady who swallowed a dog.", 
"What a hog, to swallow a dog!",
"She swallowed the dog to catch the cat.",
"She swallowed the cat to catch the bird.", 
"She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.",
"She swallowed the spider to catch the fly.",
"I don't know why she swallowed the fly. Perhaps she'll die."]

def dog():
    for line in verse_dog:
        print(line)
    line_break()



verse_goat = ["I know an old lady who swallowed a goat.", "Just opened her throat and swallowed a goat!", "She swallowed the goat to catch the dog.", "She swallowed the dog to catch the cat.", "She swallowed the cat to catch the bird.", "She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.", "She swallowed the spider to catch the fly.", "I don't know why she swallowed the fly. Perhaps she'll die."]


def goat():
    for line in verse_goat:
        print(line)
    line_break()


verse_cow = ["I know an old lady who swallowed a cow.", "I don't know how she swollowed a cow!", "She swallowed the cow to catch the goat.", "She swallowed the goat to catch the dog.", "She swallowed the dog to catch the cat.", "She swallowed the cat to catch the bird", "She swallowed the bird to catch the spider that wriggled and jiggled and tickled in side her.", "She swallowed the spider to catch the fly", "I don't know why she swallowed the fly. Perhaps she'll die."]

def cow():
    for line in verse_cow:
        print(line)
    line_break()


verse_horse = ["I know an old lady who swallowed a horse.", "She's dead, of course!"]

def horse():
    for line in verse_horse:
        print(line)
    line_break()


def song():
    fly()
    spider()
    bird()
    cat()
    dog()
    goat()
    cow()
    horse()

song()
