module [convert]

convert : U64 -> Str
convert = \number ->
    divisibleByThree = number % 3 == 0
    divisibleByFive = number % 5 == 0
    divisibleBySeven = number % 7 == 0

    if divisibleByThree && divisibleByFive && divisibleBySeven then
        "PlingPlangPlong"
    else if divisibleByThree && divisibleByFive then
        "PlingPlang"
    else if divisibleByThree && divisibleBySeven then
        "PlingPlong"
    else if divisibleByFive && divisibleBySeven then
        "PlangPlong"
    else if divisibleByThree then
        "Pling"
    else if divisibleByFive then
        "Plang"
    else if divisibleBySeven then
        "Plong"
    else
        Num.toStr number
