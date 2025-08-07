module [isLeapYear]

isLeapYear : I64 -> Bool
isLeapYear = \year ->
    Num.isMultipleOf year 4 &&
            !(Num.isMultipleOf year 100) || Num.isMultipleOf year 400
